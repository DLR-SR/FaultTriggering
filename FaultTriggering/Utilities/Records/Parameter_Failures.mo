within FaultTriggering.Utilities.Records;
record Parameter_Failures "Paramter Failures"

// ------- --------------------------------------------
// ------- Parameter Failures -------------------------
// ------- --------------------------------------------

// ------- Real Parameter Failures ------------
// ------- --------------------------------------------

parameter FailureTriggering.Utilities.Records.RealFailures realFailures[:]
                                         annotation (Dialog( label="Real Parameter Failure names"));

parameter FailureTriggering.Utilities.Records.RealFaultValue realValue[:]
    "Real Parameter Failure Values"      annotation (
      Dialog(
      label="Real Parameter Failure values",
      treeView=true,
      rowHeadings=realFailures.path,
      columnHeadings={"Real Failure"}));
// ------- Integer Parameter Failures ------------
// ------- --------------------------------------------
parameter FailureTriggering.Utilities.Records.IntegerFailures integerFailures[:]
                                         annotation (Dialog(label="Integer Parameter Failure names",
        button="Select parameters",
        onlyStart=true,
        fields(name=initialName, unit=initialValue.path)));

parameter FailureTriggering.Utilities.Records.IntegerFaultValue integerValue[:]
    "Integer Parameter Failure Values"   annotation (
      Dialog(
      label="Integer Parameter Failure values",
      treeView=true,
      rowHeadings=integerFailures.path,
      columnHeadings={"Integer Failure"}));
// ------- Boolean Parameter Failures ------------
// ------- --------------------------------------------
parameter FailureTriggering.Utilities.Records.BooleanFailures booleanFailures[:]
                                         annotation (Dialog(label="Boolean Failure names", treeView=true, enable= false));

parameter FailureTriggering.Utilities.Records.BooleanFaultValue booleanValue[:]
    "Boolean Parameter Failure Values"   annotation (
      Dialog(
      label="Boolean Parameter Failure values",
      rowHeadings=booleanFailures.path,
      columnHeadings={"Boolean Failure"},
      treeView=true));

  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="P")}), Diagram(graphics={Text(
          extent={{-100,-60},{100,60}},
          lineColor={0,0,255},
          textString="Par")}));
end Parameter_Failures;
