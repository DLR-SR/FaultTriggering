within FaultTriggering.Utilities.Icons;
model Motor

  annotation (Icon(graphics={
        Rectangle(
          extent={{-66,42},{24,-60}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={0,128,255}),
        Rectangle(
          extent={{-66,42},{-80,-60}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={128,128,128}),
        Rectangle(
          extent={{24,2},{52,-18}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={95,95,95})}));
end Motor;
