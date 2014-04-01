within FaultTriggering.Examples.ActuatorExample.Parts;
package Bearings "simple bearing package"


  annotation (Icon(graphics={
        Line(
          visible=not useSupport,
          points={{-50,-120},{-30,-100}},
          color={0,0,0}),
        Line(
          visible=not useSupport,
          points={{-30,-120},{-10,-100}},
          color={0,0,0}),
        Line(
          visible=not useSupport,
          points={{-10,-120},{10,-100}},
          color={0,0,0}),
        Line(
          visible=not useSupport,
          points={{10,-120},{30,-100}},
          color={0,0,0}),
        Line(
          visible=not useSupport,
          points={{-30,-100},{30,-100}},
          color={0,0,0}),
        Rectangle(
          extent={{-100,10},{100,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(extent={{-60,-10},{60,-60}}, lineColor={0,0,0}),
        Rectangle(
          extent={{-60,-10},{60,-25}},
          lineColor={0,0,0},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,-45},{60,-61}},
          lineColor={0,0,0},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-50,-18},{50,-50}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{60,-60},{60,-70},{75,-70},{75,-80},{-75,-80},{-75,-70},{-60,
              -70},{-60,-60},{60,-60}},
          lineColor={0,0,0},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Line(points={{-75,-10},{-75,-70}}, color={0,0,0}),
        Line(points={{75,-10},{75,-70}}, color={0,0,0}),
        Rectangle(extent={{-60,60},{60,10}}, lineColor={0,0,0}),
        Rectangle(
          extent={{-60,60},{60,45}},
          lineColor={0,0,0},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,25},{60,10}},
          lineColor={0,0,0},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-50,51},{50,19}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-75,70},{-75,10}}, color={0,0,0}),
        Polygon(
          points={{60,60},{60,70},{75,70},{75,80},{-75,80},{-75,70},{-60,70},{
              -60,60},{60,60}},
          lineColor={0,0,0},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Line(points={{75,70},{75,10}}, color={0,0,0}),
        Line(
          points={{0,-80},{0,-100}},
          color={0,0,0},
          smooth=Smooth.None)}));
end Bearings;
