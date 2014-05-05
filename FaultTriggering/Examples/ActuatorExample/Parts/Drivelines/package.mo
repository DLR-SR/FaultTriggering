within FaultTriggering.Examples.ActuatorExample.Parts;
package Drivelines


  annotation (Icon(graphics={
        Rectangle(
          extent={{-100,10},{-60,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(
          extent={{60,10},{100,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(
          extent={{-40,60},{40,-60}},
          lineColor={0,0,0},
          pattern=LinePattern.Solid,
          lineThickness=0.25,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Polygon(
          points={{-60,10},{-60,20},{-40,40},{-40,-40},{-60,-20},{-60,10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={128,128,128}),
        Polygon(
          points={{60,20},{40,40},{40,-40},{60,-20},{60,20}},
          lineColor={128,128,128},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-60,-80},{-46,-80},{-20,-20},{20,-20},{46,-80},{60,-80},{60,
              -90},{-60,-90},{-60,-80}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
                                        Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        lineColor={0,0,255})}));
end Drivelines;
