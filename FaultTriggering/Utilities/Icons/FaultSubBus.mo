within FaultTriggering.Utilities.Icons;
connector FaultSubBus "Icon for signal sub-bus"

  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Line(
          points={{-16,2},{16,2}},
          color={255,0,0},
          thickness=0.5),
        Rectangle(
          extent={{-10,8},{8,0}},
          lineColor={255,0,0},
          lineThickness=0.5),
        Polygon(
          points={{-80,50},{80,50},{100,30},{80,-40},{60,-50},{-60,-50},{-80,
              -40},{-100,30},{-80,50}},
          lineColor={0,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-55,25},{-45,15}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{45,25},{55,15}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-5,-15},{5,-25}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-20,4},{20,0}},
          lineColor={255,0,0},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          fillColor={255,0,0})}),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Polygon(
          points={{-40,25},{40,25},{50,15},{40,-20},{30,-25},{-30,-25},{-40,
              -20},{-50,15},{-40,25}},
          lineColor={0,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-22.5,7.5},{-17.5,12.5}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{17.5,12.5},{22.5,7.5}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-2.5,-7.5},{2.5,-12.5}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,70},{150,40}},
          lineColor={0,0,0},
          textString=
               "%name")}),
    Documentation(info="<html>
<p>
This icon is designed for a <b>sub-bus</b> in a signal connector.
</p>
</html>"));

end FaultSubBus;
