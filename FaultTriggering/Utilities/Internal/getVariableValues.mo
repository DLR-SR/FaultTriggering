within FaultTriggering.Utilities.Internal;
function getVariableValues "gets the variable default values from the model"

  input String[:] faultNames={"FaultTriggering.Examples.ActuatorExample.Actuator.driveline.friction.externalRealFault"};
  input String modelName="FaultTriggering.Examples.ActuatorExample.Actuator";
  input Boolean translateFirst=true "translate model if flag is true";
  output Real[size(faultNames, 1)] outputValues "Values of the variables";

protected
  Real[:,:] attributes;
  Boolean booleanDump;
  String[size(faultNames, 1)] bareFaultNames;
  Integer n;
  Integer n2=0;

algorithm
  // traslate model if needed
  if translateFirst then
    booleanDump := translateModel(modelName);
  end if;
 // cut modelnamelength so that Dymola_Initialization_getAttributes can find the values
  for n in 1:size(faultNames, 1) loop
    if Modelica.Utilities.Strings.length(faultNames[n]) >
        Modelica.Utilities.Strings.length(modelName) then
      bareFaultNames[n] := Modelica.Utilities.Strings.substring(
        faultNames[n],
        Modelica.Utilities.Strings.length(modelName) + 2,
        Modelica.Utilities.Strings.length(faultNames[n]));
    end if;
  end for;
  // get attributes of the faults and save them into outputValues
  for n in 1:size(faultNames, 1) loop
    n2 := n2 + 1;
 //   attributes := Dymola_Initialization_getAttributes({bareFaultNames[n] + ".faultIndex"},4);
    attributes := Dymola_Initialization_getAttributes({readToLastDot(bareFaultNames[n]) + ".fault_local"},4);
    outputValues[n2] :=attributes[1, 2];
  end for;

  annotation(__Dymola_interactive=true);
end getVariableValues;
