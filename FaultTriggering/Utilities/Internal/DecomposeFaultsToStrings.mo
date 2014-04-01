within FaultTriggering.Utilities.Internal;
function DecomposeFaultsToStrings "decompose the faults to single components"
  input String[:] faultNames={"driveline.DriveFriction.externalRealFault","motor.motorKtFault.externalIntegerFault",
      "motor.speedSensor.externalBooleanFault","driveline.speedSensor.externalBooleanFault","driveline.DrivelineDisconnect.constBooleanFault"};
  input FaultTriggering.Utilities.Types.FaultType[:] faultType={4,5,6,6,3}
    "fault type:";
  input Integer[:] faultChannel={1,1,1,2,0}
    "channel to which each fault is connected";
  input Integer preAllocationSize=20;
  output String[:] name "name of component";
  output String[:] extendsTo "extending to";
  output Integer[:] extensionDepths "extension depth";
  output Boolean[:] finalVariable "indicates if it is the final extension";
  output FaultTriggering.Utilities.Types.FaultType[:] outputType
    "the type of the output";
protected
  Integer[:] outputChannel "channel number of the output";

  String[preAllocationSize] nameAlloc "preallocated name vector";
  String[preAllocationSize] extendsToAlloc "prealocated extendsto vector";
  Integer[preAllocationSize] extensionDepthsAlloc
    "preallocated extendsdepth vector";
  Boolean[preAllocationSize] finalVariableAlloc
    "preallocated finalVariable vector";
  FaultTriggering.Utilities.Types.FaultType[preAllocationSize] outputTypeAlloc
    "the type of the output";
  Integer[preAllocationSize] outputChannelAlloc "channel number of the output";

  String currentName "name that is processed";
  Integer numberOfNames "number of the faultnames to be processed";
  Integer loopNr=0 "universal loop counter";
  Integer whileNr=0 "while loop counter";
  Integer iterationNr=0 "while loop iteration counter";
  Boolean flag "while brike loop flag";
  Boolean dotFound "no dot in the current name";
  String dummyS "string dummy variable";
  Boolean dummyB "Boolean dummy variable";
  Integer extensionDepth "extension depth of the current iteration";

algorithm
  numberOfNames := size(faultNames, 1);

  for loopNr in 1:numberOfNames loop // loop over all names
    currentName := faultNames[loopNr];
    whileNr := 0;
    extensionDepth := 0;
    dotFound := true;
    while dotFound loop
      whileNr := whileNr + 1;
      iterationNr := iterationNr + 1;
      extensionDepth := extensionDepth + 1;
      (nameAlloc[iterationNr],currentName,dotFound) :=
        FaultTriggering.Utilities.Internal.readToDot(currentName);
      outputTypeAlloc[iterationNr] := faultType[loopNr];
      outputChannelAlloc[iterationNr] := faultChannel[loopNr];
      if dotFound then
        (extendsToAlloc[iterationNr],dummyS,dummyB) :=
          FaultTriggering.Utilities.Internal.readToDot(currentName);
      else
        finalVariableAlloc[iterationNr] := true;

      end if;
      extensionDepthsAlloc[iterationNr] := extensionDepth;
    end while;
  end for;

  name := nameAlloc[1:iterationNr];
  extendsTo := extendsToAlloc[1:iterationNr];
  extensionDepths := extensionDepthsAlloc[1:iterationNr];
  finalVariable := finalVariableAlloc[1:iterationNr];
  outputType := outputTypeAlloc[1:iterationNr];
outputChannel := outputChannelAlloc[1:iterationNr];

  annotation (Documentation(info="<html>
<p>Internal fuction to decompose the faultnames and types to a string  vector which can be used for further processing</p>
</html>"));
end DecomposeFaultsToStrings;
