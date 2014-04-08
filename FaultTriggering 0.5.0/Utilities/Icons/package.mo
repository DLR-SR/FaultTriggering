within FaultTriggering.Utilities;
package Icons 
  extends FaultTriggering.Utilities.Icons.Package;


  annotation (Icon(graphics={ Polygon(
          points={{34,54},{16,74},{-4,74},{-24,54},{-88,54},{-96,46},{-96,36},{-88,
              28},{-22,28},{-4,10},{16,10},{36,30},{8,30},{0,36},{0,48},{8,54},{
              34,54}},
          lineThickness=0.5,
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-72,-36},{-34,-72}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(
          extent={{-80,-50},{-72,-58}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Ellipse(
          extent={{-2,-16},{70,-88}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{4,-22},{64,-82}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={0,174,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{26,-40},{38,-40},{38,-64},{44,-64},{44,-70},{32,-70},{32,-46},
              {26,-46},{26,-40}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          smooth=Smooth.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{26,-30},{38,-36}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-34,-50},{-26,-58}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192})}));
end Icons;
