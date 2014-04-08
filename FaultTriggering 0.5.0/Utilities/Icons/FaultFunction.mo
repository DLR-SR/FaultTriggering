within FaultTriggering.Utilities.Icons;
partial function FaultFunction

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                   graphics={
        Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={200,200,200},
          fillPattern=FillPattern.Sphere,
          fillColor={248,248,248}),
                   Polygon(
          points={{80,14},{60,34},{40,34},{20,14},{-60,14},{-70,6},{-70,-6},{-60,
              -14},{22,-14},{40,-34},{60,-34},{80,-12},{56,-12},{48,-4},{48,6},{
              56,14},{80,14}},
          lineThickness=0.5,
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
    Polygon(
      points={{70,90},{-22,10},{0,-10},{-70,-90},{30,-10},{10,10},{70,90}},
      smooth=Smooth.None,
      fillColor={255,0,0},
      fillPattern=FillPattern.Solid,
      lineThickness=0.5,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Ellipse(extent={{-100,100},{100,-100}}, lineColor={135,135,135})}));
end FaultFunction;
