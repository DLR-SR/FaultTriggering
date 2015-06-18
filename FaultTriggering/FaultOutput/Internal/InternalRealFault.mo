within FaultTriggering.FaultOutput.Internal;
block InternalRealFault "Generate variable Fault of type Real"
  extends FaultTriggering.Utilities.Icons.RealFault;
  outer FaultTrigger faultTrigger;
  parameter Real fault_local = 1
    "Default fault value if no external triggering is used";
  parameter FaultTriggering.Utilities.Types.Variable_Fault_Real
                                                    externalRealFault = FaultTriggering.Utilities.Types.Variable_Fault_Real()
    "External Fault Triggering parameters";
  Modelica.Blocks.Interfaces.RealOutput fault "Final fault value";

protected
  FaultTriggering.Utilities.Types.Fault_SelectRealFault
                                                faultNumber;
equation
  faultNumber = externalRealFault.faultIndex;
  fault = if externalRealFault.externalFaultOn then faultTrigger.realFault[faultNumber] else
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
end InternalRealFault;
