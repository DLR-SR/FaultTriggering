within FaultTriggering.Utilities.Internal;
function createFaultPackageInternal
  "this function writes the fault package from the specified inputs"
  extends FaultTriggering.Utilities.Icons.FaultFunction;

  input String[:] faultNames={"driveline.DriveFriction.externalRealFault","motor.motorKtFault.externalIntegerFault",
      "motor.speedSensor.externalBooleanFault","driveline.speedSensor.externalBooleanFault",
      "driveline.DrivelineDisconnect.constBooleanFault"};
  input FaultTriggering.Utilities.Types.FaultType[:] faultType={FaultTriggering.Utilities.Types.FaultType.realVar,FaultTriggering.Utilities.Types.FaultType.intVar,FaultTriggering.Utilities.Types.FaultType.boolVar,FaultTriggering.Utilities.Types.FaultType.boolVar,FaultTriggering.Utilities.Types.FaultType.boolPar}
    "fault type:";
  input Integer[:] faultChannel={1,1,1,2,1}
    "channel to which each fault is connected";
  input Integer faultSizes[3]={1,1,2}
    "size of the Real, Integer and Boolean faults";
  input FaultTriggering.Utilities.Records.Faults faults=
      FaultTriggering.Utilities.Records.Faults(parameterFaults=
      FaultTriggering.Utilities.Records.Parameter_Faults(
      realFaults={FaultTriggering.Utilities.Records.RealFaults(name=
        "FaultTriggering.Utilities.Types.Parameter_Fault_Real", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.driveline.realFaultConst.constRealFault")},
      realValue={1},
      integerFaults={FaultTriggering.Utilities.Records.IntegerFaults(name=
        "FaultTriggering.Utilities.Types.Parameter_Fault_Integer", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.driveline.integerFaultConst.constIntegerFault")},
      integerValue={1},
      booleanFaults={FaultTriggering.Utilities.Records.BooleanFaults(name=
        "FaultTriggering.Utilities.Types.Parameter_Fault_Boolean", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.driveline.disconnect.constBooleanFault"),
        FaultTriggering.Utilities.Records.BooleanFaults(name=
        "FaultTriggering.Utilities.Types.Parameter_Fault_Boolean", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.driveline.constantBooleanFault.constBooleanFault")},
      booleanValue={true,false}), variableFaults=
      FaultTriggering.Utilities.Records.Variable_Faults(
      realFaults={FaultTriggering.Utilities.Records.RealFaults(name=
        "FaultTriggering.Utilities.Types.Variable_Fault_Real", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.driveline.friction.externalRealFault")},
      realFaultSelect={1},
      realFaultMode={1},
      realFaultDefault=  {0.0},
      integerFaults={FaultTriggering.Utilities.Records.IntegerFaults(name=
        "FaultTriggering.Utilities.Types.Variable_Fault_Integer", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.motor.ktFault.externalIntegerFault")},
      integerFaultSelect={1},
      integerFaultMode={1},
      integerFaultDefault={1},
      booleanFaults={FaultTriggering.Utilities.Records.BooleanFaults(name=
        "FaultTriggering.Utilities.Types.Variable_Fault_Boolean", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.loadSpeedSensor.externalBooleanFault"),
        FaultTriggering.Utilities.Records.BooleanFaults(name=
        "FaultTriggering.Utilities.Types.Variable_Fault_Boolean", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.motor.speedSensor.externalBooleanFault"),
        FaultTriggering.Utilities.Records.BooleanFaults(name=
        "FaultTriggering.Utilities.Types.Variable_Fault_Boolean", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.driveline.speedSensor.externalBooleanFault"),
        FaultTriggering.Utilities.Records.BooleanFaults(name=
        "FaultTriggering.Utilities.Types.Variable_Fault_Boolean", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.driveline.bearing.fault.externalBooleanFault")},
      booleanFaultSelect={1,2,3,4},
      booleanFaultMode={1,1,1,1},
      booleanFaultDefault={true,true,false,false}));
  input String modelName="FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus"
    "Model name";
  input String packageName="Faults.mo";
//  input Integer preAllocationSize=500
//    "pre allocation size of the output matrices";
  input Boolean overWriteScripts = false
    "Replaces existing models without prompting" annotation(choices(checkBox=true));

  output String[:] name "name of component";
  output String[:] extendsTo "extending to";
  output Integer[:] extensionDepths "extension depth";
  output Boolean[:] finalVariable "indicates if it is the final extension";

//    FaultTriggering.Utilities.Records.Faults faults "fault record";
//  constant Integer preAllocationSize = (size(faults.parameterFaults.booleanValue,1) + size(faults.parameterFaults.integerValue,1) + size(faults.parameterFaults.realValue,1) +
//                               size(faults.variableFaults.booleanFaultMode,1) + size(faults.variableFaults.integerFaultMode,1) + size(faults.variableFaults.realFaultMode,1))*100;
protected
  String[:] partialExtends;
  Integer maxDepth "maximal extension depth";
    Integer[:] processedNames;
  Integer processedNamesIteration=0;
  Integer nameNr;
  Integer nameNr2;
  Integer extendsNr;
  Boolean isInVector;
  Integer dummyI;
  FaultTriggering.Utilities.Types.FaultType name_Type[:] "type of the fault";
  Integer loopMax;
  Integer totalVariableFaults "total number of variable faults";
  Integer modelNameLength;
  String[:] realFaultParameterPaths;
  String[:] integerFaultParameterPaths;
  String[:] booleanFaultParameterPaths;
  String[:] realFaultComponents;
  String[:] integerFaultComponents;
  String[:] booleanFaultComponents;
  String[:] realFaultParameterNames;
  String[:] integerFaultParameterNames;
  String[:] booleanFaultParameterNames;
  String[:] realFaultNames;
  String[:] integerFaultNames;
  String[:] booleanFaultNames;
  Integer[:] channel "channel number of the fault";
  String subString;
  Boolean printComma=false;
  String[:] faultString "string of the fault record";

algorithm
  modelNameLength := Modelica.Utilities.Strings.length(modelName);

// get fault strings
  (name,extendsTo,extensionDepths,finalVariable,name_Type) :=
    FaultTriggering.Utilities.Internal.DecomposeFaultsToStrings(
    faultNames,
    faultType,
    faultChannel);

  maxDepth := max(extensionDepths);
  // check if file already exist. if not, exit
  if  overWriteScripts == false then
assert( not
           (Modelica.Utilities.Files.exist(packageName)), packageName + " already exist: exitting");
  else
  Modelica.Utilities.Files.remove(packageName);
  end if;

  Streams.print("package " + readAfterDot(modelName) + "Package", packageName);
  Streams.print("import FaultTriggering;", packageName);
  Streams.print("extends FaultTriggering.Utilities.Icons.Fault;",
    packageName);

// --------------------------------------------------------------------------------------------
// ----------   setup wrapper model  ----------------------------------------------------------
// --------------------------------------------------------------------------------------------

  Streams.print("model " +  readAfterDot(modelName) + "Wrapper", packageName);

// Setup model paramters
// REAL parameter Faults
  Streams.print("extends  " + modelName + "(", packageName);

// REAL parameter Faults
  loopMax := size(faults.parameterFaults.realValue, 1);
  for loopNr in 1:loopMax loop
     // Print a comma before each entry, except for the first one
    if printComma == false then
      printComma := true;
    else
      Modelica.Utilities.Streams.print(",", packageName);
    end if;
    subString := Modelica.Utilities.Strings.substring(
      faults.parameterFaults.realFaults[loopNr].path,
      modelNameLength + 2,
      Modelica.Utilities.Strings.length(faults.parameterFaults.realFaults[
        loopNr].path));

    Modelica.Utilities.Streams.print(subString + "=" + "faultTrigger.faultRecord.parameterFaults.realValue["
       + String(loopNr) + "]", packageName);
  end for;
   // INTEGER parameter Faults
  loopMax := size(faults.parameterFaults.integerValue, 1);
  for loopNr in 1:loopMax loop
          // Print a comma before each entry, except for the first one
    if printComma == false then
      printComma := true;
    else
      Modelica.Utilities.Streams.print(",", packageName);
    end if;
    subString := Modelica.Utilities.Strings.substring(
      faults.parameterFaults.integerFaults[loopNr].path,
      modelNameLength + 2,
      Modelica.Utilities.Strings.length(faults.parameterFaults.integerFaults[
        loopNr].path));
    Modelica.Utilities.Streams.print(subString + "=" + "faultTrigger.faultRecord.parameterFaults.integerValue["
       + String(loopNr) + "]", packageName);
  end for;
  // BOOLEAN parameter Faults
  loopMax := size(faults.parameterFaults.booleanValue, 1);
  for loopNr in 1:loopMax loop
          // Print a comma before each entry, except for the first one
    if printComma == false then
      printComma := true;
    else
      Modelica.Utilities.Streams.print(",", packageName);
    end if;

    subString := Modelica.Utilities.Strings.substring(
      faults.parameterFaults.booleanFaults[loopNr].path,
      modelNameLength + 2,
      Modelica.Utilities.Strings.length(faults.parameterFaults.booleanFaults[
        loopNr].path));
    Modelica.Utilities.Streams.print(subString + "=" + "faultTrigger.faultRecord.parameterFaults.booleanValue["
       + String(loopNr) + "]", packageName);
  end for;

// REAL variable Faults
  loopMax := size(faults.variableFaults.realFaults, 1);
  for loopNr in 1:loopMax loop
     // Print a comma before each entry, except for the first one
    if printComma == false then
      printComma := true;
    else
      Modelica.Utilities.Streams.print(",", packageName);
    end if;
    subString := Modelica.Utilities.Strings.substring(
      faults.variableFaults.realFaults[loopNr].path,
      modelNameLength + 2,
      Modelica.Utilities.Strings.length(faults.variableFaults.realFaults[
        loopNr].path));

    Modelica.Utilities.Streams.print(subString + "=FaultTriggering.Utilities.Types.Variable_Fault_Real(
            externalFaultOn=true," + "faultIndex=" + String(faults.variableFaults.realFaultSelect[
        loopNr]) + ","+  "faultMode=faultTrigger.faultRecord.variableFaults.realFaultMode[" + String(faults.variableFaults.realFaultSelect[
        loopNr]) + "])", packageName);
  end for;
// INTEGER variable Faults
  loopMax := size(faults.variableFaults.integerFaults, 1);
  for loopNr in 1:loopMax loop
     // Print a comma before each entry, except for the first one
    if printComma == false then
      printComma := true;
    else
      Modelica.Utilities.Streams.print(",", packageName);
    end if;
    subString := Modelica.Utilities.Strings.substring(
      faults.variableFaults.integerFaults[loopNr].path,
      modelNameLength + 2,
      Modelica.Utilities.Strings.length(faults.variableFaults.integerFaults[
        loopNr].path));

    Modelica.Utilities.Streams.print(subString + "=FaultTriggering.Utilities.Types.Variable_Fault_Integer(
            externalFaultOn=true," + "faultIndex=" + String(faults.variableFaults.integerFaultSelect[
        loopNr]) + ","+  "faultMode=faultTrigger.faultRecord.variableFaults.integerFaultMode[" + String(faults.variableFaults.integerFaultSelect[
        loopNr]) + "])", packageName);
  end for;
// BOOLEAN variable Faults
  loopMax := size(faults.variableFaults.booleanFaults, 1);
  for loopNr in 1:loopMax loop
     // Print a comma before each entry, except for the first one
    if printComma == false then
      printComma := true;
    else
      Modelica.Utilities.Streams.print(",", packageName);
    end if;
    subString := Modelica.Utilities.Strings.substring(
      faults.variableFaults.booleanFaults[loopNr].path,
      modelNameLength + 2,
      Modelica.Utilities.Strings.length(faults.variableFaults.booleanFaults[
        loopNr].path));

    Modelica.Utilities.Streams.print(subString + "=FaultTriggering.Utilities.Types.Variable_Fault_Boolean(
            externalFaultOn=true," + "faultIndex=" + String(faults.variableFaults.booleanFaultSelect[
        loopNr]) + ","+  "faultMode=faultTrigger.faultRecord.variableFaults.booleanFaultMode[" + String(faults.variableFaults.booleanFaultSelect[
        loopNr]) + "])", packageName);
  end for;
  Streams.print(");", packageName);

//  Streams.print("parameter FaultRecord faultRecord annotation (Placement(transformation(extent={{20,60},{40,80}})));", packageName);

  Streams.print("inner FaultTriggerController faultTrigger
    annotation (Placement(transformation(extent={{60,60},{80,80}})));",
    packageName);

  Streams.print("end " + readAfterDot(modelName) + "Wrapper" + ";", packageName);

// --------------------------------------------------------------------------------------------
// ----------   setup FaultTriggerController --------------------------------------------------------
// --------------------------------------------------------------------------------------------

  Streams.print("model FaultTriggerController", packageName);
  Streams.print("extends FaultTriggering.FaultOutput.Partial_FaultTrigger(" + "realFaultSize = " +
    String(faultSizes[1]) + ",integerFaultSize = " + String(faultSizes[2]) + ",booleanFaultSize = "
     + String(faultSizes[3]) + ");", packageName);
  Streams.print("parameter FaultRecord faultRecord;", packageName);
  Streams.print("protected", packageName);
  Streams.print(readAfterDot(modelName) + "Package" + ".Interfaces.Faults faults annotation (Placement(transformation(extent={{84,-20},{124,20}})));",
    packageName);

totalVariableFaults :=size(faults.variableFaults.realFaults, 1) + size(faults.variableFaults.integerFaults,
    1) + size(faults.variableFaults.booleanFaults, 1);

  // -------------------------- add default blocks -------------------------------

  for nameNr in 1:size(faultNames, 1) loop
    if faultType[nameNr] == FaultTriggering.Utilities.Types.FaultType.realVar then
    Streams.print("Modelica.Blocks.Sources.Constant " +  Strings.replace(readToLastDot(faultNames[nameNr]),".","_") +
    "(k = faultRecord.variableFaults.realFaultDefault["+ String(faultChannel[nameNr]) + "])" +
    " annotation (Placement(transformation(extent={{-80," + String(70-(nameNr-1)/(totalVariableFaults-1)*160) + "},{-60," + String(90-(nameNr-1)/(totalVariableFaults-1)*160) + "}})));", packageName);
    elseif faultType[nameNr] == FaultTriggering.Utilities.Types.FaultType.intVar then
    Streams.print("Modelica.Blocks.Sources.IntegerConstant " +  Strings.replace(readToLastDot(faultNames[nameNr]),".","_") +
    "(k = faultRecord.variableFaults.integerFaultDefault["+ String(faultChannel[nameNr]) + "])" +
    " annotation (Placement(transformation(extent={{-80," + String(70-(nameNr-1)/(totalVariableFaults-1)*160) + "},{-60," + String(90-(nameNr-1)/(totalVariableFaults-1)*160) + "}})));", packageName);
    elseif faultType[nameNr] == FaultTriggering.Utilities.Types.FaultType.boolVar then
    Streams.print("Modelica.Blocks.Sources.BooleanConstant " +  Strings.replace(readToLastDot(faultNames[nameNr]),".","_") +
    "(k = faultRecord.variableFaults.booleanFaultDefault["+ String(faultChannel[nameNr]) + "])" +
    " annotation (Placement(transformation(extent={{-80," + String(70-(nameNr-1)/(totalVariableFaults-1)*160) + "},{-60," + String(90-(nameNr-1)/(totalVariableFaults-1)*160) + "}})));", packageName);
    end if;
  end for;

  Streams.print("equation", packageName);

  for nameNr in 1:size(faultNames, 1) loop
    if faultType[nameNr] == FaultTriggering.Utilities.Types.FaultType.realVar then
      Streams.print("realFault[" + String(faultChannel[nameNr]) + "] = faults."
         + faultNames[nameNr] + ";", packageName);
    elseif faultType[nameNr] == FaultTriggering.Utilities.Types.FaultType.intVar then
      Streams.print("integerFault[" + String(faultChannel[nameNr]) + "] = faults."
         + faultNames[nameNr] + ";", packageName);
    elseif faultType[nameNr] == FaultTriggering.Utilities.Types.FaultType.boolVar then
      Streams.print("booleanFault[" + String(faultChannel[nameNr]) + "] = faults."
         + faultNames[nameNr] + ";", packageName);
    end if;
  end for;
   // connect blocks to bus
    for nameNr in 1:size(faultNames, 1) loop
    if faultType[nameNr] == FaultTriggering.Utilities.Types.FaultType.realVar then
      Streams.print("connect( " +  Strings.replace(readToLastDot(faultNames[nameNr]),".","_") + ".y, faults."
         + faultNames[nameNr] + ") annotation(Line(points=
        {{-60," + String(80-(nameNr-1)/(totalVariableFaults-1)*160) + "}," +
        "{ 0 ," + String(80-(nameNr-1)/(totalVariableFaults-1)*160) + "}," +
        "{0,0},{100,0}},  color={0,0,127}, smooth=None));", packageName);
    elseif faultType[nameNr] == FaultTriggering.Utilities.Types.FaultType.intVar then
      Streams.print("connect( " +  Strings.replace(readToLastDot(faultNames[nameNr]),".","_") + ".y, faults."
         + faultNames[nameNr] + ") annotation(Line(points=
        {{-60," + String(80-(nameNr-1)/(totalVariableFaults-1)*160) + "}," +
        "{ 0 ," + String(80-(nameNr-1)/(totalVariableFaults-1)*160) + "}," +
        "{0,0},{100,0}},  color={255,127,0}, smooth=None));", packageName);
    elseif faultType[nameNr] == FaultTriggering.Utilities.Types.FaultType.boolVar then
      Streams.print("connect( " +  Strings.replace(readToLastDot(faultNames[nameNr]),".","_") + ".y, faults."
         + faultNames[nameNr] + ") annotation(Line(points=
        {{-60," + String(80-(nameNr-1)/(totalVariableFaults-1)*160) + "}," +
        "{ 0 ," + String(80-(nameNr-1)/(totalVariableFaults-1)*160) + "}," +
        "{0,0},{100,0}},  color={255,0,255}, smooth=None));", packageName);
    end if;
  end for;

  Streams.print("annotation (defaultComponentPrefixes=\"inner\",defaultComponentName=\"faultTrigger\",Diagram(graphics));",
    packageName);
  Streams.print("end FaultTriggerController;", packageName);

// --------------------------------------------------------------------------------------------
// ----------  Setup Fault Record -----------------------------------------------------------
// --------------------------------------------------------------------------------------------

  Streams.print("record FaultRecord \"Predefined Fault record\"", packageName);

  Streams.print("extends ", packageName);
  faultString := FaultTriggering.Utilities.Internal.Records.Faults2str(faults);
  for i in 1:size(faultString, 1) loop
    Modelica.Utilities.Streams.print(faultString[i], packageName);
  end for;
  Streams.print(";", packageName);
  Streams.print("end FaultRecord;", packageName);

// --------------------------------------------------------------------------------------------
// ----------   setup Simulink fault Input Connector ----------------------------------------------------------------
// --------------------------------------------------------------------------------------------

  Streams.print("connector FaultsInput = input " + readAfterDot(modelName) + "Package" + ".Interfaces.Faults \"'input Faults' as connector\"  annotation (Icon(graphics={Rectangle(extent={{-8,4},{10,0}},lineColor={255,0,0},lineThickness=0.5)}));",
    packageName);
//  Streams.print("end FaultsInput;",packageName);
Streams.print("package Interfaces", packageName);
Streams.print("extends FaultTriggering.Utilities.Icons.InterfacesPackage;", packageName);
// --------------------------------------------------------------------------------------------
// ----------   setup base bus ----------------------------------------------------------------
// --------------------------------------------------------------------------------------------
  Streams.print("connector Faults", packageName); // creates base connector
  Streams.print("extends FaultTriggering.Utilities.Icons.FaultBus;", packageName);
  extendsNr := 0;
//   partialExtends := FaultTriggering.Utilities.Internal.emptyStringVector(
//     partialExtends);
  partialExtends := FaultTriggering.Utilities.Internal.emptyStringVector(
    name);
 // add all "underbusses"
  for nameNr in 1:size(name, 1) loop
    if extensionDepths[nameNr] == 1 and not (
        FaultTriggering.Utilities.Internal.checkInString(name[nameNr],
        partialExtends)) then
      extendsNr := extendsNr + 1;
      partialExtends[extendsNr] := name[nameNr];
      Streams.print(readAfterDot(modelName) + "Package" + ".Interfaces." + name[nameNr] + " " + name[nameNr] + ";",
        packageName);
    end if;
  end for;

  Streams.print("end Faults;", packageName);

// --------------------------------------------------------------------------------------------
// ----------   setup sub busses --------------------------------------------------------------
// --------------------------------------------------------------------------------------------

  // create subbusses and "preallocate" then with the subbusses and variables
 //   processedNames := zeros(size(
  //  name,1));
  for nameNr2 in 1:size(name, 1) loop
    if FaultTriggering.Utilities.Internal.findIfIntegerVector(processedNames,
        nameNr2) == false then
      if Strings.compare(extendsTo[nameNr2], "") <> Modelica.Utilities.Types.Compare.Equal then
        Streams.print("connector " + name[nameNr2], packageName);
        Streams.print("extends FaultTriggering.Utilities.Icons.FaultSubBus;",
          packageName);
      elseif name_Type[nameNr2] == FaultTriggering.Utilities.Types.FaultType.realPar then
        Streams.print("type " + name[nameNr2] + " = Real \"Real parameter Fault\" ;",
          packageName);
      elseif name_Type[nameNr2] == FaultTriggering.Utilities.Types.FaultType.intPar then
        Streams.print("type " + name[nameNr2] + " = Integer \"Integer parameter Fault\" ;",
          packageName);
      elseif name_Type[nameNr2] == FaultTriggering.Utilities.Types.FaultType.boolPar then
        Streams.print("type " + name[nameNr2] + " = Boolean \"Boolean parameter Fault\" ;",
          packageName);
      elseif name_Type[nameNr2] == FaultTriggering.Utilities.Types.FaultType.realVar then
        Streams.print("connector " + name[nameNr2] + " = input Real \"Real variable Fault\" ;",
          packageName);
      elseif name_Type[nameNr2] == FaultTriggering.Utilities.Types.FaultType.intVar then
        Streams.print("connector " + name[nameNr2] + " = input Integer \"Integer variable Fault\" ;",
          packageName);
      elseif name_Type[nameNr2] == FaultTriggering.Utilities.Types.FaultType.boolVar then
        Streams.print("connector " + name[nameNr2] + " = input Boolean \"Boolean variable Fault\" ;",
          packageName);
      end if;
      extendsNr := 0;
      partialExtends := FaultTriggering.Utilities.Internal.emptyStringVector(
        partialExtends);
      for nameNr in 1:size(name, 1) loop
        if Strings.compare(name[nameNr2], name[nameNr]) == Modelica.Utilities.Types.Compare.Equal then
          if finalVariable[nameNr] == false and not (
              FaultTriggering.Utilities.Internal.checkInString(extendsTo[nameNr],
              partialExtends)) then
            extendsNr := extendsNr + 1;
            partialExtends[extendsNr] := extendsTo[nameNr];
            Streams.print(readAfterDot(modelName) + "Package" + ".Interfaces." + extendsTo[nameNr] + " " + extendsTo[
              nameNr] + ";", packageName);
          end if;
          processedNames :=cat(
            1,
            processedNames,
            {nameNr});
        end if;
      end for;
      if Strings.compare(extendsTo[nameNr2], "") <> Modelica.Utilities.Types.Compare.Equal then
        Streams.print("end " + name[nameNr2] + ";", packageName);
      end if;   processedNames :=cat(
            1,
            processedNames,
            {nameNr});
    end if;
  end for;

Streams.print("end Interfaces;", packageName);
  Streams.print("end " + readAfterDot(modelName) + "Package" + ";", packageName);

  annotation (Icon(graphics),
                         Documentation(info="<html>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><br/><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><p><b>Copyright &copy; DLR Institute of System Dynamics and Control</b> </p></td>
</tr>
</table>
</html>"));
end createFaultPackageInternal;
