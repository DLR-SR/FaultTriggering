within FaultTriggering;
package FaultOutput "Fault Modelling tools"
  extends FaultTriggering.Utilities.Icons.Package;


  annotation (Icon(graphics={
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
      points={{-82,-18},{-72,-2},{-62,4},{-38,-6},{-24,-38},{-12,-56},{-2,-64},
              {6,-64},{14,-58},{22,-46},{32,-28},{44,-4},{62,18},{76,28}},
      color={0,0,0},
      smooth=Smooth.None),
    Polygon(
      points={{70,90},{-22,10},{0,-10},{-70,-90},{30,-10},{10,10},{70,90}},
      smooth=Smooth.None,
      fillColor={255,0,0},
      fillPattern=FillPattern.Solid,
      lineThickness=0.5,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
    Text(
      extent={{-100,100},{98,132}},
      lineColor={0,0,255},
      lineThickness=0.5,
      fillColor={255,255,0},
      fillPattern=FillPattern.Solid,
      textString="%name")}));
end FaultOutput;
