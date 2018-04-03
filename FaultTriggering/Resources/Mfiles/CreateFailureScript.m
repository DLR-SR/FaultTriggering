function [FaultNames,FaultValues,FaultDescriptions] = CreateFailureScript(ScriptName, WhatTest)
% CREATEFAILURESCRIPT processes the script ScriptName to obtain all model
% failures. Afterwards the user can select which failures have to be
% activated.
%
% TestCase selects what kind of testscript has to be generated:
%   1: each Variable and boolean fault 1 Test (singe failure case)
%   2: All possible single and double failures of Variable and boolean
%       (first 1 then 2 Failures at the same time)
%   3: Single Parameter Failures

%  Author: F.L.J. van der Linden,
%  Revision(s): 23-07-2012 % first version
%  Copyright 2008-20012 DLR

%% Input Checking

if nargin < 1
    warning('DLR:CreateFailureScript:NoScriptName', 'No Script name is defined. Defaulting to SetFailures.mos');
    ScriptName = 'SetFailures.mos';
end
if nargin < 2
    WhatTest = 1;
end
%% Process the FailureScript to obtain failurenames, types and default values
[FaultNames,FaultValues,FaultDescriptions] = ProcessFailureScript(ScriptName);

%% Find failure switches for variable failures

% Search for the string 'Switch' in FaultDescriptions to identify the
% variable fault switches.
% Save all directly switchable failures in FaultSwitches. Also the
% parameter boolean failures can be directly switched and are therefore
% added
j=0;
for  i = 1: length(FaultDescriptions);
    if not(isempty(strfind(FaultDescriptions{i},'Switch'))) || ...
            strcmp(FaultDescriptions{i},'Boolean');
        j=j+1;
        FaultSwitches(j) = i;
    end
end

%% Create failure Matrix

if WhatTest == 1
    % generate single failures matrix
    Test.SwichableFailures = eye(length(FaultSwitches));
end


if WhatTest == 2
    % generate single failures matrix
    Test.SwichableFailures = eye(length(FaultSwitches));
    % add secondary failures
    for i = 1:length(FaultSwitches)
        Test.SwichableFailures = [Test.SwichableFailures,...
            [zeros(i-1,length(FaultSwitches)-i);
            ones(1,length(FaultSwitches)-i);...
            eye(length(FaultSwitches)-i)]];
    end
end

%%
% Test.SwichableFailures = zeros(Failures.TotalFailures,0);
if WhatTest == 3
    NoGUI = true;
    Failures = SetupFailureParameters(ScriptName,NoGUI);
    k=0;
    Test.SwichableFailures = zeros(Failures.TotalFailures,0);
    for i= 1:length(Failures.Boolean)
        for j = 1: length(Failures.Boolean(i).FaultRange)
            k=k+1;
        Test.FaultNames(k) = Failures.Boolean(i).FaultNames;
        Test.FaultSize(k) = Failures.Boolean(i).FaultRange(j);
        Test.SwichableFailures = zeros(Failures.TotalFailures,0);

    end
    end
end

%% Write Script

OutputScriptName = 'TestScript.mos';
ModelName = 'FailureTriggering.Examples.ActuatorExample.ActuatorInternalFault';
ModelName = 'FailureTriggering.AutoTest.Examples.ActuatorTest';
finalOutputScriptName = '"TestResults.m"';

Simulation.startTime = 0;
Simulation.stopTime = 1;
Simulation.tolerance = 1e-5;

% open or create file
fid = fopen(OutputScriptName, 'w+');
% write header
fprintf(fid,'//TestScript to perform batch processing of selected failures \n');
% write translation order to file
fprintf(fid,['translateModel("' , ModelName ,'"); \n']);
% define outputnames in file
fprintf(fid,['finalOutputScriptName = ', finalOutputScriptName,';\n']);

for i = 1: size(Test.SwichableFailures,2)
    fprintf(fid,['//Start ',num2str(i) '. Test \n']);
    fprintf(fid,['writeFailures.testRun = ', num2str(i),';\n']);

    for j = 1: size(Test.SwichableFailures,1)
        fprintf(fid,[FaultNames{FaultSwitches(j)}, '=', num2str(Test.SwichableFailures(j,i)),';\n']);
    end
    fprintf(fid,['simulateModel("', ModelName, '", startTime=', num2str(Simulation.startTime),...
        ', stopTime=' , num2str(Simulation.stopTime),...
        ', tolerance=', num2str(Simulation.tolerance),'); \n']);

end
% close file
fclose(fid);
