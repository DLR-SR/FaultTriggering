within FaultTriggering.Utilities.Internal;
function faultProcessingForFaultBus
  "Gathers all faults in the model and set them."
  extends FaultTriggering.Utilities.Icons.FaultFunction;

  input String modelName="FaultTriggering.Examples.ActuatorExample.Actuator"
    "Model name";
  input String scriptName="SetFaults.mos" "Name of output script";
  input Boolean overWriteScripts = false
    "Replaces existing models without propmpting" annotation(choices(checkBox=true));

  output String[:] realFaultParameterNames;
  output String[:] integerFaultParameterNames;
  output String[:] booleanFaultParameterNames;
  output String[:] realFaultNames;
  output String[:] integerFaultNames;
  output String[:] booleanFaultNames;
  output FaultTriggering.Utilities.Records.Faults faults;
protected
  String[:] realFaultParameterPaths;
  String[:] integerFaultParameterPaths;
  String[:] booleanFaultParameterPaths;
  String[:] realFaultComponents;
  String[:] integerFaultComponents;
  String[:] booleanFaultComponents;
  Boolean displayFaults=true;
  Integer loopNr;
  Integer loopMax;
  Boolean dumpBoolean;
  String subString;
  Integer modelNameLength;
  Real[:] tempBooleanValues;
  Boolean[:] tempBooleanVector;
  Real realTemp;

algorithm
  modelNameLength := Modelica.Utilities.Strings.length(modelName);

  // ----------------------------------------------------------
  // ----------------- Get Variable Faults  -----------------
  // ----------------------------------------------------------

  (booleanFaultComponents,booleanFaultNames,integerFaultComponents,
    integerFaultNames,realFaultComponents,realFaultNames) :=
    FaultTriggering.Utilities.Internal.gatherVariableFaults(modelName,true);

  // -----------------------------------------------------------
  // ----------------- Initialize fault record -----------------
  // -----------------------------------------------------------

  // setup the record with the loaded values
  faults.variableFaults.booleanFaults :=
    FaultTriggering.Utilities.Records.BooleanFaults(booleanFaultComponents,
    booleanFaultNames);
  faults.variableFaults.integerFaults :=
    FaultTriggering.Utilities.Records.IntegerFaults(integerFaultComponents,
    integerFaultNames);
  faults.variableFaults.realFaults :=
    FaultTriggering.Utilities.Records.RealFaults(realFaultComponents,
    realFaultNames);

  // ----------------------------------------------------------
  // ----------------- Set Variable Default Values ------------
  // ----------------------------------------------------------

  // set up the channel selections so that each fault is automatically given an own
  // unique channel

  // setup default REAL values
  faults.variableFaults.realFaultSelect := 1:size(realFaultNames, 1);
  faults.variableFaults.realFaultDefault := 1:size(realFaultNames, 1);

  // setup default INTEGER values
  faults.variableFaults.integerFaultSelect := 1:size(integerFaultNames, 1);
  faults.variableFaults.integerFaultDefault := 1:size(integerFaultNames, 1);

  // setup default BOOLEAN values
  faults.variableFaults.booleanFaultSelect := 1:size(booleanFaultNames, 1);
  faults.variableFaults.booleanFaultDefault := fill(true,size(booleanFaultNames, 1));

  // setup the fault mode selection
  // Real faults
  faults.variableFaults.realFaultMode := integer(floor(
    FaultTriggering.Utilities.Internal.getVariableMode(
    realFaultNames,
    modelName,
    false)));
  faults.variableFaults.realFaultDefault :=
    FaultTriggering.Utilities.Internal.getVariableValues(
    realFaultNames,
    modelName,
    false);

  // Integer Faults
  faults.variableFaults.integerFaultMode := integer(floor(
    FaultTriggering.Utilities.Internal.getVariableMode(
    integerFaultNames,
    modelName,
    false)));
  faults.variableFaults.integerFaultDefault := integer(floor(
    FaultTriggering.Utilities.Internal.getVariableValues(
    integerFaultNames,
    modelName,
    false)));
  // Boolean Faults
  faults.variableFaults.booleanFaultMode := integer(floor(
    FaultTriggering.Utilities.Internal.getVariableMode(
    booleanFaultNames,
    modelName,
    false)));
  faults.variableFaults.booleanFaultDefault := Real2BooleanVector(
    FaultTriggering.Utilities.Internal.getVariableValues(
    booleanFaultNames,
    modelName,
    false));

  // ----------------------------------------------------------
  // ----------------- Get Parameter Faults -----------------
  // ----------------------------------------------------------

  (booleanFaultParameterPaths,booleanFaultParameterNames,
    integerFaultParameterPaths,integerFaultParameterNames,
    realFaultParameterPaths,realFaultParameterNames) :=
    FaultTriggering.Utilities.Internal.gatherParameterFaults(modelName,true);
  // setup the record with the loaded values
  faults.parameterFaults.realFaults :=
    FaultTriggering.Utilities.Records.RealFaults(realFaultParameterPaths,
    realFaultParameterNames);
  faults.parameterFaults.integerFaults :=
    FaultTriggering.Utilities.Records.IntegerFaults(integerFaultParameterPaths,
    integerFaultParameterNames);
  faults.parameterFaults.booleanFaults :=
    FaultTriggering.Utilities.Records.BooleanFaults(booleanFaultParameterPaths,
    booleanFaultParameterNames);

  // ----------------------------------------------------------
  // ----------------- Get Parameter Default Values -----------
  // ----------------------------------------------------------

  // setup default REAL values
  faults.parameterFaults.realValue :=
    FaultTriggering.Utilities.Internal.getParameterValues(
    realFaultParameterNames,
    modelName,
    true);

  // setup default INTEGER values
  faults.parameterFaults.integerValue := integer(floor(
    FaultTriggering.Utilities.Internal.getParameterValues(
    integerFaultParameterNames,
    modelName,
    false)));

  // setup default BOOLEAN values

  tempBooleanValues := FaultTriggering.Utilities.Internal.getParameterValues(
    booleanFaultParameterNames,
    modelName,
    false);
  faults.parameterFaults.booleanValue := fill(true, size(tempBooleanValues, 1));
  for i in size(tempBooleanValues, 1):-1:1 loop
    if tempBooleanValues[i] > 0.5 then
      faults.parameterFaults.booleanValue[i] := true;
    else
      faults.parameterFaults.booleanValue[i] := false;
    end if;
  end for;

  // ----------------------------------------
  // --------------- Start GUI --------------
  // ----------------------------------------

  // display fault setting GUI where all parameter faults can be set.
  // Variable faults are predefined and need not to be set.
   faults := PromptFor(faults);

  // // ----------------------------------------
  // // --------------- Apply Results ----------
  // // ----------------------------------------
  //
  // Translate the model so the parameters can be set
  //  translateModel(modelName); - not necessary anymore since already translated.

  // ----------------- Variable Faults Setup ----------------
  // select which fault is bound to which input
  // check if file already exist. if not, exit when not overWriteScripts
  if overWriteScripts == false then
  assert(not (Modelica.Utilities.Files.exist(scriptName)), scriptName +
    " already exist: exitting");
    else
  Modelica.Utilities.Files.remove(scriptName);
  end if;
  // REAL Faults
  loopMax := size(realFaultComponents, 1);
  for loopNr in 1:loopMax loop
    subString := Modelica.Utilities.Strings.substring(
      realFaultNames[loopNr],
      modelNameLength + 2,
      Modelica.Utilities.Strings.length(realFaultNames[loopNr]));
    // Set the faults in the model
    dumpBoolean := SetVariable((subString + ".faultIndex"), faults.variableFaults.realFaultSelect[
      loopNr]);
    dumpBoolean := SetVariable((subString + ".externalFaultOn"), 1);
    // write to file
    Modelica.Utilities.Streams.print((subString + ".faultIndex") + "=" + String(
      faults.variableFaults.realFaultSelect[loopNr]) + ";//RealIndex%",
      scriptName);
    Modelica.Utilities.Streams.print((subString + ".faultMode") + "=" + String(
      faults.variableFaults.realFaultMode[loopNr]) + ";//RealMode%", scriptName);
    Modelica.Utilities.Streams.print((subString + ".externalFaultOn") + "=1" +
      ";//Boolean%", scriptName);
  end for;
  // INTEGER Faults
  loopMax := size(integerFaultComponents, 1);
  for loopNr in 1:loopMax loop
    subString := Modelica.Utilities.Strings.substring(
      integerFaultNames[loopNr],
      modelNameLength + 2,
      Modelica.Utilities.Strings.length(integerFaultNames[loopNr]));
    dumpBoolean := SetVariable((subString + ".faultIndex"), faults.variableFaults.integerFaultSelect[
      loopNr]);
    dumpBoolean := SetVariable((subString + ".externalFaultOn"), 1);
    Modelica.Utilities.Streams.print((subString + ".faultIndex") + "=" + String(
      faults.variableFaults.integerFaultSelect[loopNr]) + ";//IntegerIndex%",
      scriptName);
    Modelica.Utilities.Streams.print((subString + ".faultMode") + "=" + String(
      faults.variableFaults.integerFaultMode[loopNr]) + ";//IntegerMode%",
      scriptName);
    Modelica.Utilities.Streams.print((subString + ".externalFaultOn") + "=1" +
      ";//Boolean%", scriptName);
  end for;
  // BOOLEAN Faults
  loopMax := size(booleanFaultComponents, 1);
  for loopNr in 1:loopMax loop
    subString := Modelica.Utilities.Strings.substring(
      booleanFaultNames[loopNr],
      modelNameLength + 2,
      Modelica.Utilities.Strings.length(booleanFaultNames[loopNr]));
    dumpBoolean := SetVariable((subString + ".faultIndex"), faults.variableFaults.booleanFaultSelect[
      loopNr]);
    dumpBoolean := SetVariable((subString + ".externalFaultOn"), 1);
    Modelica.Utilities.Streams.print((subString + ".faultIndex") + "=" + String(
      faults.variableFaults.booleanFaultSelect[loopNr]) + ";//BooleanIndex%",
      scriptName);
    Modelica.Utilities.Streams.print((subString + ".faultMode") + "=" + String(
      faults.variableFaults.booleanFaultMode[loopNr]) + ";//BooleanMode%",
      scriptName);
    Modelica.Utilities.Streams.print((subString + ".externalFaultOn") + "=1" +
      ";//Boolean%", scriptName);
  end for;

  // ----------------- Parameter Faults Setup ---------------

  // REAL parameter Faults
  loopMax := size(faults.parameterFaults.realValue, 1);
  for loopNr in 1:loopMax loop
    subString := Modelica.Utilities.Strings.substring(
      realFaultParameterNames[loopNr],
      modelNameLength + 2,
      Modelica.Utilities.Strings.length(realFaultParameterNames[loopNr]));
    dumpBoolean := SetVariable(subString, faults.parameterFaults.realValue[
      loopNr]);
    Modelica.Utilities.Streams.print((subString + "=" + String(faults.parameterFaults.realValue[
      loopNr])) + ";//Real%", scriptName);
  end for;
  // INTEGER parameter Faults
  loopMax := size(faults.parameterFaults.integerValue, 1);
  for loopNr in 1:loopMax loop
    subString := Modelica.Utilities.Strings.substring(
      integerFaultParameterNames[loopNr],
      modelNameLength + 2,
      Modelica.Utilities.Strings.length(integerFaultParameterNames[loopNr]));
    dumpBoolean := SetVariable(subString, faults.parameterFaults.integerValue[
      loopNr]);
    Modelica.Utilities.Streams.print(subString + "=" + String(faults.parameterFaults.integerValue[
      loopNr]) + ";//Integer%", scriptName);
  end for;
  // BOOLEAN parameter Faults
  loopMax := size(booleanFaultParameterNames, 1);
  for loopNr in 1:loopMax loop
    subString := Modelica.Utilities.Strings.substring(
      booleanFaultParameterNames[loopNr],
      modelNameLength + 2,
      Modelica.Utilities.Strings.length(booleanFaultParameterNames[loopNr]));
    if faults.parameterFaults.booleanValue[loopNr] then
      realTemp := 1;
    else
      realTemp := 0;
    end if;
    dumpBoolean := SetVariable(subString, realTemp);
    Modelica.Utilities.Streams.print(subString + "=" + String(realTemp) +
      ";//Boolean%", scriptName);
  end for;

  annotation (__Dymola_interactive=true,
    Icon(graphics),
    Diagram(graphics={Polygon(
          points={{70,90},{-22,10},{0,-10},{-70,-90},{30,-10},{10,10},{70,90}},
          smooth=Smooth.None,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid,
          lineThickness=0.5,
          pattern=LinePattern.None,
          lineColor={0,0,0}), Polygon(
          points={{76,14},{56,34},{36,34},{16,14},{-64,14},{-74,6},{-74,-6},{-64,
              -14},{18,-14},{38,-34},{58,-34},{76,-12},{52,-12},{44,-6},{44,6},
              {52,14},{76,14}},
          lineThickness=0.5,
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0})}),
    Documentation(info="<html>
<p>This Function gathers all the faults in the model <b>modelName</b>, sets the values of the faults and saves it into the modelica script <b>scriptName</b>. The Integer <b>maxSearchSize</b> is needed to preallocate the number of searched elements.</p>
<p><br/>Unfortunately it is impossibke to read the default values directly from the model using the ModelManagement.Structure.AST libray, therefore all parameter values are set to 0, and all variable faults to index 1 by default. </p>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><br/><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><p><b>Copyright &copy; DLR Institute of System Dynamics and Control</b> </p></td>
</tr>
</table>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td></td>
<td></td>
</tr>
</table>
</html>"));
end faultProcessingForFaultBus;
