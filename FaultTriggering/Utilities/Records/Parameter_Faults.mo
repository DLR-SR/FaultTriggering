within FaultTriggering.Utilities.Records;
record Parameter_Faults "Parameter Faults"

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
          textString="Par")}),
    Documentation(revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2015, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end Parameter_Faults;
