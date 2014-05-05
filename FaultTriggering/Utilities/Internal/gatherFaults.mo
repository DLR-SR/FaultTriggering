within FaultTriggering.Utilities.Internal;
function gatherFaults
  "Select all model compontsfrom modelName which type is equal to searchString"
extends FaultTriggering.Utilities.Icons.ModelTree;

  input String modelName="FaultTriggering.Examples.ActuatorExample.Actuator";
  input Integer maxSearchSize=500 "pre allocation size of the output matrices";
  input String searchString="Fault_Real";
  output String[:] faultPaths "Path to component";
  output String[:] faultNames "Component names";

protected
  String[maxSearchSize] faultNamesList;
  String[maxSearchSize] faultFromNamesList;
  String[maxSearchSize] faultPathList;
  String[maxSearchSize] componentNames;
  String componentName;
  String[maxSearchSize] componentPaths;
  String componentPath;

  Boolean[maxSearchSize] IsInputs;
  Integer searchStringIndex;
  Integer Index_LastDotInName;
  Integer Counter_Fault=1;
  Boolean IsFault;

algorithm
// Get Components and their properties of the model
  (componentNames,componentPaths) :=
    FaultTriggering.Utilities.Internal.getAllModelComponents(modelName,
    maxSearchSize);
// Loop over all Components
  for Counter_Component in 1:size(componentNames, 1) loop
//     // get Typename
    componentPath := componentPaths[Counter_Component];
    componentName := componentNames[Counter_Component];
    Index_LastDotInName := Modelica.Utilities.Strings.findLast(componentPath, ".");

    if Index_LastDotInName > 1 then
       // look if the name FAULT is in the type, if yes ==> FAULT. This is looped for all searchString indexes. If a string is already found, no further string comparison is needed and is skipped.
      IsFault := not (Modelica.Utilities.Strings.find(
        componentPath,
        searchString,
        Index_LastDotInName) == 0);
      if IsFault then   // if fault then save names and default values
        faultPathList[Counter_Fault] := componentPath;
        faultNamesList[Counter_Fault] := componentName;
          // Increase FaultCounter
        Counter_Fault := Counter_Fault + 1;
      end if;
    end if;
  end for;

  faultNames := faultNamesList[1:Counter_Fault - 1];
  faultPaths := faultPathList[1:Counter_Fault - 1];

  annotation (                         Documentation(info="<html>
<p>Select all model compontsfrom <b>modelName</b> which type is equal to <b>searchString</b>. Maximal search depth is <b>maxSearchSize</b>. Output are the string vectors FaultComponents and FaultNames. They represent the component names as well as the path to the component.</p>
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
end gatherFaults;
