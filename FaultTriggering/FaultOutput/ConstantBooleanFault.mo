within FaultTriggering.FaultOutput;
block ConstantBooleanFault "Generate constant signal of type Boolean"
  extends FaultTriggering.FaultOutput.Internal.InternalConstantBooleanFault;
  extends Modelica.Blocks.Interfaces.BooleanSignalSource;

equation
  y = constBooleanFault;
  annotation (
    Icon(coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100,-100},{100,100}},
      grid={2,2}), graphics={Line(points={{-80,0},{80,0}}, color={0,0,0}),
        Text(
        extent={{-150,-140},{150,-110}},
        lineColor={0,0,0},
          textString="%constBooleanFault"),
                             Polygon(
          points={{70,90},{-22,10},{0,-10},{-70,-90},{30,-10},{10,10},{70,90}},
          smooth=Smooth.None,
          fillColor={255,0,255},
          fillPattern=FillPattern.Solid,
        pattern=LinePattern.None)}),
    Diagram(coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100,-100},{100,100}},
      grid={2,2}), graphics={
      Line(
        points={{-70,0},{80,0}},
        color={0,0,255},
        thickness=0.5),
      Text(
        extent={{-69,20},{-49,0}},
        lineColor={0,0,0},
        textString="k"),
      Text(
        extent={{-96,6},{-76,-4}},
        lineColor={0,0,0},
        textString="true"),
      Text(
        extent={{-98,-58},{-72,-68}},
        lineColor={0,0,0},
        textString="false"),
    Line(points={{-70,68},{-70,-80}}, color={95,95,95}),
    Text(
      extent={{-73,92},{-20,74}},
      lineColor={0,0,0},
      textString="y"),
    Polygon(
      points={{-70,90},{-76,68},{-64,68},{-70,90}},
      lineColor={95,95,95},
      fillColor={95,95,95},
      fillPattern=FillPattern.Solid),
    Line(points={{-80,-70},{92,-70}}, color={95,95,95}),
    Text(
      extent={{80,-80},{104,-100}},
      lineColor={0,0,0},
      textString="time"),
    Polygon(
      points={{100,-70},{78,-64},{78,-76},{100,-70}},
      lineColor={95,95,95},
      fillColor={95,95,95},
      fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>This block is used to simulate a constant fault. Using the function <a href=\"FaultTriggering.createFaultPackage\">FaultTriggering.createFaultPackage</a> all the faults in the model can be found and set.</p>
<p>The Boolean output y is a constant signal: </p>
<p><img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/BooleanConstant.png\"/> </p>
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
end ConstantBooleanFault;
