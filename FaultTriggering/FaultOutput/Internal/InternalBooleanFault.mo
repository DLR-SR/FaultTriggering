within FaultTriggering.FaultOutput.Internal;
block InternalBooleanFault "Generate variable Fault of type Boolean"
  extends FaultTriggering.Utilities.Icons.BooleanFault;

  outer FaultTrigger faultTrigger;
  parameter Boolean fault_local = false
    "Default fault value if no external triggering is used";
  parameter FaultTriggering.Utilities.Types.Variable_Fault_Boolean
                                                       externalBooleanFault = FaultTriggering.Utilities.Types.Variable_Fault_Boolean()
    "External Fault Triggering parameters";
  Modelica.Blocks.Interfaces.BooleanOutput fault "Final fault value";
protected
  FaultTriggering.Utilities.Types.Fault_SelectBooleanFault
                                                   faultNumber;
equation
  faultNumber = externalBooleanFault.faultIndex;
  fault = if externalBooleanFault.externalFaultOn then faultTrigger.booleanFault[faultNumber] else
fault_local;
  annotation (Diagram(graphics),
                             Icon(graphics={
                                        Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        lineColor={0,0,255})}),
    Documentation(info="<html>
</html>", revisions="<html>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><h4>Copyright &copy; DLR Institute of System Dynamics and Control </h4></td>
</tr>
</table>
</html>"));
end InternalBooleanFault;
