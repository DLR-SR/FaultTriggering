within FaultTriggering.Utilities.Icons;
partial package MotorController 
  extends FaultTriggering.Utilities.Icons.Package;


  annotation (Icon(graphics={
        Rectangle(
          extent={{-44,-24},{14,-74}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={0,128,255}),
        Rectangle(
          extent={{14,-46},{24,-54}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={95,95,95}),
        Polygon(
          points={{-32,44},{-32,12},{-28,12},{-28,22},{-22,28},{-10,12},{-4,12},
              {-18,32},{-6,44},{-12,44},{-28,28},{-28,44},{-32,44}},
          smooth=Smooth.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Line(
          points={{24,-50},{46,-50},{46,34},{24,34}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-60,32},{-80,32},{-80,-50},{-44,-50}},
          color={0,0,0},
          smooth=Smooth.None)}));
end MotorController;
