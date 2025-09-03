within FaultTriggering.Utilities.Icons;
partial package TranslationalActuators  


  annotation (Icon(graphics={
  Text(
extent={{-150,140},{150,100}},
lineColor={0,0,255},
textString="%name"),
        Rectangle(
          extent={{-38,-70},{16,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={0,128,255}),
        Rectangle(
          extent={{70,10},{92,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={95,95,95}),
        Rectangle(
          extent={{-80,100},{40,48}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-80,-100},{-100,100}},
          fillColor={132,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-80,46},{-38,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={0,127,127}),
        Rectangle(
          extent={{-38,46},{70,-46}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,128,0})}));
end TranslationalActuators;
