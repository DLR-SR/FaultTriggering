within FaultTriggering.FaultOutput;
block ConstantIntegerFault
  extends Modelica.Blocks.Interfaces.IntegerSO;
  extends FaultTriggering.FaultOutput.Internal.InternalConstantIntegerFault;
equation
  y = constIntegerFault;
  annotation (defaultComponentName="integerFaultConst",
    Icon(coordinateSystem(
    preserveAspectRatio=true,
    extent={{-100,-100},{100,100}},
    grid={2,2}), graphics={
    Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
    Polygon(
      points={{-80,90},{-88,68},{-72,68},{-80,90}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
    Polygon(
      points={{90,-70},{68,-62},{68,-78},{90,-70}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-80,0},{80,0}}, color={0,0,0}),
    Text(
      extent={{-150,-150},{150,-110}},
      lineColor={0,0,0},
          textString="%constIntegerFault"),
                             Polygon(
          points={{70,90},{-22,10},{0,-10},{-70,-90},{30,-10},{10,10},{
          70,90}},
          smooth=Smooth.None,
          fillColor={255,128,0},
          fillPattern=FillPattern.Solid,
      pattern=LinePattern.None,
      lineColor={0,0,0})}),
    Diagram(coordinateSystem(
    preserveAspectRatio=true,
    extent={{-100,-100},{100,100}},
    grid={2,2}), graphics={
    Polygon(
      points={{-80,90},{-86,68},{-74,68},{-80,90}},
      lineColor={95,95,95},
      fillColor={95,95,95},
      fillPattern=FillPattern.Solid),
    Line(points={{-80,68},{-80,-80}}, color={95,95,95}),
    Line(
      points={{-80,0},{80,0}},
      color={0,0,255},
      thickness=0.5),
    Line(points={{-90,-70},{82,-70}}, color={95,95,95}),
    Polygon(
      points={{90,-70},{68,-64},{68,-76},{90,-70}},
      lineColor={95,95,95},
      fillColor={95,95,95},
      fillPattern=FillPattern.Solid),
    Text(
      extent={{-83,92},{-30,74}},
      lineColor={0,0,0},
      textString="y"),
    Text(
      extent={{70,-80},{94,-100}},
      lineColor={0,0,0},
      textString="time"),
    Text(
      extent={{-101,8},{-81,-12}},
      lineColor={0,0,0},
      textString="k")}),
Documentation(info="<html>
<p>This block is used to simulate a constant fault. Using the function<a href=\"FaultTriggering.createFaultPackage\">FaultTriggering.createFaultPackage</a> all the faults in the model can be found and set.</p>
<p>The Real output y is a constant signal: </p>
<p><img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Constant.png\"/> </p>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td></td>
<td></td>
</tr>
</table>
</html>", revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2015, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end ConstantIntegerFault;
