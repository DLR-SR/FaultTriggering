within FaultTriggering.Utilities.Internal;
function gatherParameterFaults
  import Modelica.Utilities.Streams.print;

  //   input String className="FaultTriggering.Examples.ActuatorExample.Actuator_ParameterFaults";
  input String className="FaultTriggering.Examples.ActuatorExample.Actuator";
  input Boolean translateModel=true "If true then model will be translated";

  output String[:] BooleanfaultPaths "Path to component";
  output String[:] BooleanfaultNames "Component names";
  output String[:] integerFaultPaths "Path to component";
  output String[:] integerFaultNames "Component names";
  output String[:] realFaultPaths "Path to component";
  output String[:] realFaultNames "Component names";
protected
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

  String[:] faultNamesList;
  String[:] faultFromNamesList;
  String[:] faultPathList;
algorithm

  // translate model to FMU 2.0
  if translateModel then
    translateModelFMU(
      className,
      false,
      "",
      "2",
      "me");
  end if;
  // load results
  if FaultTriggering.Utilities.Internal.isWindows() then
    vars := importScalarVariables("~FMUOutput/modelDescription.xml");
  else
    vars := importScalarVariables(".FMUOutput/modelDescription.xml");
  end if;

  componentNames := vars[:].name;
  declaredBooleanType := vars[:].realAttributes.declaredType;
  declaredIntegerType := vars[:].integerAttributes.declaredType;
  declaredRealType := vars[:].booleanAttributes.declaredType;

  // Initiate faultNamesList, faultFromNamesList and faultPathList with a string array of the size of the array.
  faultNamesList := componentNames;
  faultFromNamesList := componentNames;
  faultPathList := componentNames;

  // Get Boolean Faults
  Counter_Fault := 1;
  for Counter_Component in 1:size(componentNames, 1) loop
    componentPath := declaredBooleanType[Counter_Component].Value;
    componentName := componentNames[Counter_Component];
    Index_LastDotInName := Modelica.Utilities.Strings.findLast(componentPath,
      ".");
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
  // Cut the initiated records to the proper length
  BooleanfaultNames := faultNamesList[1:Counter_Fault - 1];
  BooleanfaultPaths := faultPathList[1:Counter_Fault - 1];

  // Get Integer Faults
  Counter_Fault := 1;
  for Counter_Component in 1:size(componentNames, 1) loop

    componentPath := declaredIntegerType[Counter_Component].Value;
    componentName := componentNames[Counter_Component];
    Index_LastDotInName := Modelica.Utilities.Strings.findLast(componentPath,
      ".");
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
  // Cut the initiated records to the proper length
  integerFaultNames := faultNamesList[1:Counter_Fault - 1];
  integerFaultPaths := faultPathList[1:Counter_Fault - 1];

  // Get Real Faults
  Counter_Fault := 1;
  for Counter_Component in 1:size(componentNames, 1) loop

    componentPath := declaredRealType[Counter_Component].Value;
    componentName := componentNames[Counter_Component];
    Index_LastDotInName := Modelica.Utilities.Strings.findLast(componentPath,
      ".");
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
  // Cut the initiated records to the proper length
  realFaultNames := faultNamesList[1:Counter_Fault - 1];
  realFaultPaths := faultPathList[1:Counter_Fault - 1];

  annotation (__Dymola_interactive=true);
end gatherParameterFaults;
