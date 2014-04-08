within FaultTriggering.Utilities.Icons;
model Information

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,81,0},
          fillPattern=FillPattern.Sphere,
          fillColor={0,147,0}),            Polygon(
            origin={-8.167,-17},
            fillColor={255,255,255},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            points={{-15.833,20.0},{-15.833,30.0},{14.167,40.0},{24.167,20.0},{
                4.167,-30.0},{14.167,-30.0},{24.167,-30.0},{24.167,-40.0},{-5.833,
                -50.0},{-15.833,-30.0},{4.167,20.0},{-5.833,20.0}},
            smooth=Smooth.Bezier,
            lineColor={0,0,0}), Ellipse(
            origin={-0.5,56.5},
            fillColor={255,255,255},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            extent={{-12.5,-12.5},{12.5,12.5}},
            lineColor={0,0,0})}));
end Information;
