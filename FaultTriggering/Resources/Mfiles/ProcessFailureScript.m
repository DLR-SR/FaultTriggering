function [FaultNames,FaultValues,FaultDescriptions] = ProcessFailureScript(ScriptName)
% PROCESSFAILURESCRIPT processes the script ScriptName and outputs the
% names and default values.
%
% [FaultNames,FaultValues,FaultDescription] = ProcessFailureScript(ScriptName)
% In this function the modelica script ScriptName is processed. From the
% script the faultnames FaultNames are read from the script, just like the
% applied fault values FaultValues and the fault type FaultDescription
% (boolean, integer or real)

%  Author: F.L.J. van der Linden, 
%  Revision(s): 23-07-2012 % first version
%  Copyright 2008-20012 DLR

%% Load Script with Failure Data
fid = fopen(ScriptName);
RawFaultNames = fscanf(fid,'%s');
fclose(fid);
RawFaultLength = length(RawFaultNames);
% find the posiion of features in the file to distinguish values names and
% descriptions
FaultCommaPositions = [0,strfind(RawFaultNames,';')];
FaultEqualPositions = strfind(RawFaultNames,'=');
FaultPercentPositions = [0,strfind(RawFaultNames,'%')];
% read the data from the file into the output variables
for Faulti = 1:length(FaultCommaPositions)-1
   FaultNames{Faulti}  = RawFaultNames(FaultPercentPositions(Faulti)+1:FaultEqualPositions(Faulti)-1); 
   FaultValueString{Faulti} = RawFaultNames(FaultEqualPositions(Faulti)+1:FaultCommaPositions(Faulti+1)-1);
   FaultDescriptions{Faulti} = RawFaultNames(FaultCommaPositions(Faulti+1)+3:FaultPercentPositions(Faulti+1)-1);
   if strcmp(FaultValueString{Faulti},'true')
       FaultValues(Faulti) = 1;
   elseif strcmp(FaultValueString{Faulti},'false')
       FaultValues(Faulti) = 0;
   else
       FaultValues(Faulti) = str2num(FaultValueString{Faulti});
   end
end