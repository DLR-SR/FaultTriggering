within FaultTriggering.FaultOutput.Internal;
block InternalConstantBooleanFault "Generate constant Fault of type Boolean"
  extends FaultTriggering.Utilities.Icons.BooleanFault;
  parameter FaultTriggering.Utilities.Types.Parameter_Fault_Boolean
                                                  constBooleanFault=false
    "Constant output value";

  annotation (
    Icon(coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100,-100},{100,100}},
      grid={2,2}), graphics={
        Text(
        extent={{-150,-140},{150,-110}},
        lineColor={0,0,0},
          textString="%constBooleanFault")}),
    Diagram(coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100,-100},{100,100}},
      grid={2,2}), graphics),
    Documentation(info="<html>
<p>This block is used to simulate a constant fault. Using the function <a href=\"FaultTriggering.GatherAndSetFaults\">FaultTriggering.GatherAndSetFaults</a> all the faults in the model can be found and set.</p>
<p>The Boolean output y is a constant signal: </p>
<p><img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/BooleanConstant.png\"/> </p>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td></td>
<td></td>
</tr>
</table>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td></td>
<td></td>
</tr>
</table>
</html>", revisions="<html>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><h4>Copyright &copy; DLR Institute of System Dynamics and Control </h4></td>
</tr>
</table>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td></td>
<td></td>
</tr>
</table>
</html>"));
end InternalConstantBooleanFault;
