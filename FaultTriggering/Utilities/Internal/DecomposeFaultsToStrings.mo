within FaultTriggering.Utilities.Internal;
function DecomposeFaultsToStrings "decompose the faults to single components"
  input String[:] faultNames={"driveline.DriveFriction.externalRealFault",
      "motor.motorKtFault.externalIntegerFault",
      "motor.speedSensor.externalBooleanFault",
      "driveline.speedSensor.externalBooleanFault",
      "driveline.DrivelineDisconnect.constBooleanFault"};
  input FaultTriggering.Utilities.Types.FaultType[:] faultType={4,5,6,6,3}
    "fault type:";
  input Integer[:] faultChannel={1,1,1,2,0}
    "channel to which each fault is connected";
  output String[:] name "name of component";
  output String[:] extendsTo "extending to";
  output Integer[:] extensionDepths "extension depth";
  output Boolean[:] finalVariable "indicates if it is the final extension";
  output FaultTriggering.Utilities.Types.FaultType[:] outputType
    "the type of the output";
protected
  Integer[:] outputChannel "channel number of the output";

  String nameTemp "temporary name variable";
  String extendsToTemp "temperary value";

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

  for loopNr in 1:numberOfNames loop
    // loop over all names
    currentName := faultNames[loopNr];
    whileNr := 0;
    extensionDepth := 0;
    dotFound := true;
    while dotFound loop
      whileNr := whileNr + 1;
      iterationNr := iterationNr + 1;
      extensionDepth := extensionDepth + 1;
      (nameTemp,currentName,dotFound) :=
        FaultTriggering.Utilities.Internal.readToDot(currentName);
      name := cat(
        1,
        name,
        {nameTemp});
      outputType := cat(
        1,
        outputType,
        {faultType[loopNr]});
      outputChannel := cat(
        1,
        outputChannel,
        {faultChannel[loopNr]});
      if dotFound then
        (extendsToTemp,dummyS,dummyB) :=
          FaultTriggering.Utilities.Internal.readToDot(currentName);
        extendsTo := cat(
          1,
          extendsTo,
          {extendsToTemp});
        finalVariable := cat(
          1,
          finalVariable,
          {false});
      else
        extendsTo := cat(
          1,
          extendsTo,
          {""});
        finalVariable := cat(
          1,
          finalVariable,
          {true});
      end if;
      extensionDepths := cat(
        1,
        extensionDepths,
        {extensionDepth});
    end while;
  end for;

  annotation (Documentation(info="<html>
<p>Internal fuction to decompose the faultnames and types to a string  vector which can be used for further processing</p>
</html>"));
end DecomposeFaultsToStrings;
