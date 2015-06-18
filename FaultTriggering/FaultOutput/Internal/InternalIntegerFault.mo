within FaultTriggering.FaultOutput.Internal;
block InternalIntegerFault "Generate variable Fault of type Integer"
  extends FaultTriggering.Utilities.Icons.IntegerFault;

  outer FaultTrigger faultTrigger;
  parameter Integer fault_local = 1
    "Default fault value if no external triggering is used";
  parameter FaultTriggering.Utilities.Types.Variable_Fault_Integer
                                                       externalIntegerFault = FaultTriggering.Utilities.Types.Variable_Fault_Integer()
    "External Fault Triggering parameters";
  Modelica.Blocks.Interfaces.IntegerOutput fault "Final fault value";

protected
  FaultTriggering.Utilities.Types.Fault_SelectIntegerFault
                                                   faultNumber;
equation
  faultNumber = externalIntegerFault.faultIndex;
  fault = if externalIntegerFault.externalFaultOn then faultTrigger.integerFault[faultNumber] else
fault_local;
  annotation (                             Icon(graphics={
                                        Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        lineColor={0,0,255})}),
    Documentation(info="<html>
</html>", revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2015, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end InternalIntegerFault;
