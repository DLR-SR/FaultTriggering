within FaultTriggering.Utilities.Records;
record Parameter_Faults "Paramter Faults"

// ------- --------------------------------------------
// ------- Parameter Faults -------------------------
// ------- --------------------------------------------

// ------- Real Parameter Faults ------------
// ------- --------------------------------------------

parameter FaultTriggering.Utilities.Records.RealFaults realFaults[:]
    annotation (Dialog(label="Real Parameter Fault names"));

parameter FaultTriggering.Utilities.Records.RealFaultValue realValue[:]
    "Real Parameter Fault Values" annotation (Dialog(
      label="Real Parameter Fault values",
      treeView=true,
      rowHeadings=realFaults.path,
      columnHeadings={"Real Fault"}));
// ------- Integer Parameter Faults ------------
// ------- --------------------------------------------
parameter FaultTriggering.Utilities.Records.IntegerFaults integerFaults[:]
    annotation (Dialog(
      label="Integer Parameter Fault names",
      button="Select parameters",
      onlyStart=true,
      fields(name=initialName, unit=initialValue.path)));

parameter FaultTriggering.Utilities.Records.IntegerFaultValue integerValue[:]
    "Integer Parameter Fault Values" annotation (Dialog(
      label="Integer Parameter Fault values",
      treeView=true,
      rowHeadings=integerFaults.path,
      columnHeadings={"Integer Fault"}));
// ------- Boolean Parameter Faults ------------
// ------- --------------------------------------------
parameter FaultTriggering.Utilities.Records.BooleanFaults booleanFaults[:]
    annotation (Dialog(
      label="Boolean Fault names",
      treeView=true,
      enable=false));

parameter FaultTriggering.Utilities.Records.BooleanFaultValue booleanValue[:]
    "Boolean Parameter Fault Values" annotation (Dialog(
      label="Boolean Parameter Fault values",
      rowHeadings=booleanFaults.path,
      columnHeadings={"Boolean Fault"},
      treeView=true));

  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="P")}), Diagram(graphics={Text(
          extent={{-100,-60},{100,60}},
          lineColor={0,0,255},
          textString="Par")}));
end Parameter_Faults;
