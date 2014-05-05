function [Failures] = SetupFailureParameters(ScriptName,NoGUI)
% SETUPFAILUREPARAMETERS processes the script ScriptName to obtain all model
% failures. The user can select which failure range has to be processed.
%
% TestCase selects what kind of testscript has to be generated:
%   1: each Variable and boolean fault 1 Test (singe failure case)
%   2: All possible single and double failures of Variable and boolean
%       (first 1 then 2 Failues at the same time)
%   3:

%  Author: F.L.J. van der Linden,
%  Revision(s): 29-10-2012 % first version
%  Copyright 2008-20012 DLR

%% Input Checking

if nargin < 1
    warning('DLR:CreateFailureScript:NoScriptName', 'No Script name is defined. Defaulting to SetFailures.mos');
    ScriptName = 'SetParameterFailures.mos';
end
if nargin < 2
    NoGUI = false;
end
%% Process the FailureScript to obtain failurenames, types and default values
[FaultNames,FaultValues,FaultDescriptions] = ProcessFailureScript(ScriptName);

%% Find failure switches for variable failures

% Search for the string 'Switch' in FaultDescriptions to identify the
% variable fault switches.
% Save all directly switchable failures in FaultSwitches. Also the
% parameter boolean failures can be directly switched and are therefore
% added

% get real failures
disp 'Use matlab syntax!'
disp 'Real failures, therefore real inputs can be used'
j=0; % initiate counter
for  i = 1: length(FaultDescriptions);
    if strcmp(FaultDescriptions{i},'Real');
        j=j+1; % increase counter
        % start failure Structure to keep track of user input
        Failures.Real(j).Index = i;
        Failures.Real(j).FaultNames = FaultNames{i};
        % ask for user feedback if NoGUI is true
        if NoGUI
            Failures.Real(j).FaultRange = 0;
        else
            % ask for user input
            UserInput = input(['input the range of ', ...
                RemoveAfterLastDot(Failures.Real(j).FaultNames),': ']);
            % check if real numbers are used
            if isreal(UserInput)
                Failures.Real(j).FaultRange = UserInput;
            else
                warning('DLR:SetupFailureParameters:Wrong input syntax', 'Wrong syntax, defaulting to 0');
                Failures.Real(j).FaultRange = 0;
            end
        end
    end
end
Failures.TotalFailures = j;
%% get Integer Failures
disp 'Use matlab syntax!'
disp 'Integer failures, therefore only Integer inputs can be used'
j=0; % initiate counter
for  i = 1: length(FaultDescriptions);
    if strcmp(FaultDescriptions{i},'Integer');
        j=j+1; % increase counter
        % start failure Structure to keep track of user input
        Failures.Integer(j).Index = i;
        Failures.Integer(j).FaultNames = FaultNames{i};
        % ask for user feedback if NoGUI is true
        if NoGUI
            Failures.Integer(j).FaultRange = 0;
        else
            % ask for user input
            UserInput = input(['input the range of ', ...
                RemoveAfterLastDot(Failures.Integer(j).FaultNames),': ']);
            % check if real numbers are used
            if all(CheckIfInteger(UserInput))
                Failures.Integer(j).FaultRange = UserInput;
            else
                warning('DLR:SetupFailureParameters:Wrong input syntax', 'Wrong syntax, defaulting to 0');
                Failures.Integer(j).FaultRange = 0;
            end
        end
    end
end
Failures.TotalFailures = Failures.TotalFailures + j;
%% get Boolean Failures
disp 'Use matlab syntax!'
disp 'Boolean failures, therefore only Integer inputs can be used'
j=0; % initiate counter
for  i = 1: length(FaultDescriptions);
    if strcmp(FaultDescriptions{i},'Boolean');
        j=j+1; % increase counter
        % start failure Structure to keep track of user input
        Failures.Boolean(j).Index = i;
        Failures.Boolean(j).FaultNames = FaultNames{i};
        % ask for user feedback if NoGUI is true
        if NoGUI
            Failures.Boolean(j).FaultRange = 0;
        else
            % ask for user input
            UserInput = input(['input the range of ', ...
                RemoveAfterLastDot(Failures.Boolean(j).FaultNames),': ']);
            % check if real numbers are used
            if all(CheckIfBoolean(UserInput))
                Failures.Boolean(j).FaultRange = UserInput;
            else
                warning('DLR:SetupFailureParameters:Wrong input syntax', 'Wrong syntax, defaulting to 0');
                Failures.Boolean(j).FaultRange = 0;
            end
        end
    end
end
Failures.TotalFailures = Failures.TotalFailures + j;
