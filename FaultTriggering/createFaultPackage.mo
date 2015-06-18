within FaultTriggering;
function createFaultPackage
  extends FaultTriggering.Utilities.Icons.FaultFunction;

  input String modelName="FaultTriggering.Examples.ActuatorExample.Actuator"
    "Model name";
  input String scriptName="SetFaults.mos" "Name of output script";
  input String packageName="Faults.mo"
    "Name of the Fault package created by the function";
  input Boolean overWriteScripts = true
    "Replaces existing models without propmpting" annotation(choices(checkBox=true));
  output FaultTriggering.Utilities.Records.Faults faults;

protected
  String[:] realFaultParameterNames;
  String[:] integerFaultParameterNames;
  String[:] booleanFaultParameterNames;
  String[:] realFaultNames;
  String[:] integerFaultNames;
  String[:] booleanFaultNames;
  Integer faultNr "counter of the failues";
  Integer faultSizes[3] "size of the Real, Integer and Boolean faults";

  output String[:] faultNames;
  output FaultTriggering.Utilities.Types.FaultType[:] faultType "fault type:";
  output Integer[:] faultChannel "channel to which each fault is connected";

  output String[:] name "name of component";
  output String[:] extendsTo "extending to";
  output Integer[:] extensionDepths "extension depth";
  output Boolean[:] finalVariable "indicates if it is the final extension";

algorithm
  (realFaultParameterNames,integerFaultParameterNames,
    booleanFaultParameterNames,realFaultNames,integerFaultNames,
    booleanFaultNames,faults) :=
    FaultTriggering.Utilities.Internal.faultProcessingForFaultBus(
    modelName,
    scriptName,
    overWriteScripts);

// ---  remove modelname from string ---
for faultNr in 1: size(realFaultNames,1) loop
  realFaultNames[faultNr] :=Strings.substring(
      realFaultNames[faultNr],
      Strings.length(modelName)+2,
      Strings.length(realFaultNames[faultNr]));
end for;

for faultNr in 1: size(integerFaultNames,1) loop
  integerFaultNames[faultNr] :=Strings.substring(
      integerFaultNames[faultNr],
      Strings.length(modelName)+2,
      Strings.length(integerFaultNames[faultNr]));
end for;

for faultNr in 1: size(booleanFaultNames,1) loop
  booleanFaultNames[faultNr] :=Strings.substring(
      booleanFaultNames[faultNr],
      Strings.length(modelName)+2,
      Strings.length(booleanFaultNames[faultNr]));
end for;

// set sizes:
faultSizes :={size(realFaultNames, 1),size(integerFaultNames, 1),size(
    booleanFaultNames, 1)};

//cat faultnames for processing
  faultNames := cat(
    1,
    realFaultNames,
    integerFaultNames,
    booleanFaultNames);

 faultType := cat(1,ones(size(realFaultNames, 1))*4,ones(size(integerFaultNames, 1))*5,ones(size(booleanFaultNames, 1))*6);
 faultChannel := cat(1,1:size(realFaultNames, 1),1:size(integerFaultNames, 1),1:size(booleanFaultNames, 1));

// create the package
  (name,extendsTo,extensionDepths,finalVariable) :=
    FaultTriggering.Utilities.Internal.createFaultPackageInternal(
    faultNames,
    faultType,
    faultChannel,
    faultSizes,
    faults,
    modelName,
    packageName,
    overWriteScripts);

  annotation (   Documentation(info="<html>
<p>This Function gathers all the faults in the model <b>modelName</b>, sets the values of the faults and saves it into the modelica script <b>scriptName</b>. The Integer <b>maxSearchSize</b> is needed to preallocate the number of searched elements.</p>
<p><br>This function creates a package with name <b>packageName</b>. In this package a hiarchial bus is build to which all faults can be easily coupled in the model <b>ConnectBusToFaults</b>. </p>
</html>", revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2015, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end createFaultPackage;
