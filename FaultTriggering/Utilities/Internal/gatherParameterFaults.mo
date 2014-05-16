within FaultTriggering.Utilities.Internal;
function gatherParameterFaults
  import Modelica.Utilities.Streams.print;

//   input String className="FaultTriggering.Examples.ActuatorExample.Actuator_ParameterFaults";
  input String className="FaultTriggering.Examples.ActuatorExample.Actuator";
  input Integer maxSearchSize=500 "pre allocation size of the output matrices";

  output String[:] BooleanfaultPaths "Path to component";
  output String[:] BooleanfaultNames "Component names";
  output String[:] integerFaultPaths "Path to component";
  output String[:] integerFaultNames "Component names";
  output String[:] realFaultPaths "Path to component";
  output String[:] realFaultNames "Component names";
protected
  String fileName="~FMUOutput\modelDescription.xml" "path to FMI";
  FaultTriggering.Utilities.Internal.Records.FMU.ScalarVariable vars[:];

  FaultTriggering.Utilities.Internal.Records.FMU.InternalRecords.OptionalString
    declaredBooleanType[:];
  FaultTriggering.Utilities.Internal.Records.FMU.InternalRecords.OptionalString
    declaredIntegerType[:];
  FaultTriggering.Utilities.Internal.Records.FMU.InternalRecords.OptionalString
    declaredRealType[:];

  String componentNames[:] "array with all model components";
  String name;
  String componentName;
  String componentPath;
  Integer Counter_Fault=1;
  Boolean IsFault;
  Integer Index_LastDotInName;

  String[maxSearchSize] faultNamesList;
  String[maxSearchSize] faultFromNamesList;
  String[maxSearchSize] faultPathList;
algorithm

  translateModelFMU(
    className,
    false,
    "",
    "2",
    "me");

  vars := importScalarVariables(fileName);

  componentNames := vars[:].name;
  declaredBooleanType := vars[:].realAttributes.declaredType;
  declaredIntegerType := vars[:].integerAttributes.declaredType;
  declaredRealType := vars[:].booleanAttributes.declaredType;

//   for i in 1:size(vars, 1) loop
//     print("name = " + componentNames[i]);
//
//     if declaredBooleanType[i].present then
//       print("   Booleantype = " + declaredBooleanType[i].Value);
//     end if;
//     if declaredIntegerType[i].present then
//       print("   Integertype = " + declaredIntegerType[i].Value);
//     end if;
//     if declaredRealType[i].present then
//       print("   Realtype = " + declaredRealType[i].Value);
//     end if;
//
//   end for;

  // Get Boolean Faults
  Counter_Fault:=1;
  for Counter_Component in 1:size(componentNames, 1) loop

    componentPath := declaredBooleanType[Counter_Component].Value;
    componentName := componentNames[Counter_Component];
    Index_LastDotInName := Modelica.Utilities.Strings.findLast(componentPath, ".");
    if declaredBooleanType[Counter_Component].present then
      if Index_LastDotInName > 1 then
        // look if the name FAULT is in the type, if yes ==> FAULT. This is looped for all searchString indexes. If a string is already found, no further string comparison is needed and is skipped.
        IsFault := not (Modelica.Utilities.Strings.find(
          componentPath,
          "Parameter_Fault_Boolean",
          Index_LastDotInName) == 0);
        if IsFault then
          // if fault then save names and default values
          faultPathList[Counter_Fault] := componentPath;
          faultNamesList[Counter_Fault] := className + "." + componentName;
          // Increase FaultCounter
          Counter_Fault := Counter_Fault + 1;
        end if;
      end if;

    end if;
  end for;

  BooleanfaultNames := faultNamesList[1:Counter_Fault - 1];
  BooleanfaultPaths := faultPathList[1:Counter_Fault - 1];

    // Get Integer Faults
  Counter_Fault:=1;
  for Counter_Component in 1:size(componentNames, 1) loop

    componentPath := declaredIntegerType[Counter_Component].Value;
    componentName := componentNames[Counter_Component];
    Index_LastDotInName := Modelica.Utilities.Strings.findLast(componentPath, ".");
    if declaredRealType[Counter_Component].present then
      if Index_LastDotInName > 1 then
        // look if the name FAULT is in the type, if yes ==> FAULT. This is looped for all searchString indexes. If a string is already found, no further string comparison is needed and is skipped.
        IsFault := not (Modelica.Utilities.Strings.find(
          componentPath,
          "Parameter_Fault_Integer",
          Index_LastDotInName) == 0);
        if IsFault then
          // if fault then save names and default values
          faultPathList[Counter_Fault] := componentPath;
          faultNamesList[Counter_Fault] := className + "." + componentName;
          // Increase FaultCounter
          Counter_Fault := Counter_Fault + 1;
        end if;
      end if;

    end if;
  end for;

  integerFaultNames := faultNamesList[1:Counter_Fault - 1];
  integerFaultPaths := faultPathList[1:Counter_Fault - 1];

  // Get Real Faults
  Counter_Fault:=1;
  for Counter_Component in 1:size(componentNames, 1) loop

    componentPath := declaredRealType[Counter_Component].Value;
    componentName := componentNames[Counter_Component];
    Index_LastDotInName := Modelica.Utilities.Strings.findLast(componentPath, ".");
    if declaredRealType[Counter_Component].present then
      if Index_LastDotInName > 1 then
        // look if the name FAULT is in the type, if yes ==> FAULT. This is looped for all searchString indexes. If a string is already found, no further string comparison is needed and is skipped.
        IsFault := not (Modelica.Utilities.Strings.find(
          componentPath,
          "Parameter_Fault_Real",
          Index_LastDotInName) == 0);
        if IsFault then
          // if fault then save names and default values
          faultPathList[Counter_Fault] := componentPath;
          faultNamesList[Counter_Fault] := className + "." + componentName;
          // Increase FaultCounter
          Counter_Fault := Counter_Fault + 1;
        end if;
      end if;

    end if;
  end for;

  realFaultNames := faultNamesList[1:Counter_Fault - 1];
  realFaultPaths := faultPathList[1:Counter_Fault - 1];
end gatherParameterFaults;
