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
  annotation (Diagram(graphics),
                             Icon(graphics={
                                        Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        lineColor={0,0,255})}),
    Documentation(info="<html>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><br/><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><p><h4>Copyright &copy; DLR Institute of System Dynamics and Control </h4></p></td>
</tr>
</table>
</html>"));
end InternalRealFault;
