within FaultTriggering.FaultOutput;
block VariableBooleanFault "Generate variable signal of type Real"
extends FaultTriggering.FaultOutput.Internal.InternalBooleanFault;
parameter Boolean useModelModeSelection = false
    "toggles external output for mode selection" annotation(choices(checkBox=true));
  Modelica.Blocks.Interfaces.BooleanOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}}),
    iconTransformation(extent={{100,-10},{120,10}})));

  Modelica.Blocks.Interfaces.IntegerOutput mode = externalBooleanFault.faultMode if useModelModeSelection
    "Connector of Integer output signal"
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));

equation
  y = fault;

  annotation (Diagram(graphics={
    Polygon(
      points={{68,90},{-24,10},{-2,-10},{-72,-90},{28,-10},{8,10},{68,
          90}},
      lineColor={0,0,255},
      smooth=Smooth,
      fillColor={0,0,255},
      fillPattern=FillPattern.Solid,
      lineThickness=0.5),
    Rectangle(
      extent={{-100,-100},{100,100}},
      lineColor={0,0,127},
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid),
    Line(points={{-82,68},{-82,-80}}, color={192,192,192}),
    Polygon(
      points={{-82,90},{-90,68},{-74,68},{-82,90}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-92,-70},{80,-70}}, color={192,192,192}),
    Polygon(
      points={{88,-70},{66,-62},{66,-78},{88,-70}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Polygon(
      points={{70,88},{-22,8},{0,-12},{-70,-92},{30,-12},{10,8},{70,88}},
      lineColor={255,0,255},
      smooth=Smooth.None,
      fillColor={255,0,255},
      fillPattern=FillPattern.Solid,
      lineThickness=0.5),
    Text(
      extent={{-100,100},{98,132}},
      lineColor={0,0,255},
      lineThickness=0.5,
      fillColor={255,255,0},
      fillPattern=FillPattern.Solid,
      textString="%name"),
    Line(
      points={{-82,24},{-58,24},{-58,-70},{-38,-70},{-38,26},{-8,26},{-8,-70},{6,
              -70},{6,26},{42,26},{42,-70},{60,-70},{60,28},{76,28}},
      color={0,0,0},
      smooth=Smooth.None,
          thickness=0.5)}),  Icon(graphics={
    Polygon(
      points={{68,90},{-24,10},{-2,-10},{-72,-90},{28,-10},{8,10},{68,
          90}},
      lineColor={0,0,255},
      smooth=Smooth,
      fillColor={0,0,255},
      fillPattern=FillPattern.Solid,
      lineThickness=0.5),
    Rectangle(
      extent={{-100,-100},{100,100}},
      lineColor={255,0,255},
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid),
    Line(points={{-82,68},{-82,-80}}, color={192,192,192}),
    Polygon(
      points={{-82,90},{-90,68},{-74,68},{-82,90}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(points={{-92,-70},{80,-70}}, color={192,192,192}),
    Polygon(
      points={{88,-70},{66,-62},{66,-78},{88,-70}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(
      points={{-82,24},{-58,24},{-58,-70},{-38,-70},{-38,26},{-8,26},{-8,-70},{6,
              -70},{6,26},{42,26},{42,-70},{60,-70},{60,28},{76,28}},
      color={0,0,0},
      smooth=Smooth.None),
    Polygon(
      points={{70,88},{-22,8},{0,-12},{-70,-92},{30,-12},{10,8},{70,88}},
      smooth=Smooth.None,
      fillColor={255,0,255},
      fillPattern=FillPattern.Solid,
          pattern=LinePattern.None)}),
    Documentation(info="<html>
<p>This block is used to simulate a variable fault. Using the function <a href=\"FaultTriggering.createFaultPackage\">FaultTriggering.createFaultPackage</a> all the faults in the model can be found and set.</p>
</html>", revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2015, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end VariableBooleanFault;
