within FaultTriggering.Utilities.Icons;
partial package Controller  
  extends FaultTriggering.Utilities.Icons.Package;


  annotation (Icon(graphics={
        Rectangle(
          extent={{-40,52},{20,22}},
          lineColor={0,0,255}),
        Polygon(
          points={{-40,38},{-70,48},{-70,28},{-40,38}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-40,-44},{-80,-44},{-80,38},{-40,38}}, color={0,0,255}),
        Rectangle(
          extent={{-40,-28},{20,-58}},
          lineColor={0,0,255}),
        Polygon(
          points={{50,-34},{20,-44},{50,-54},{50,-34}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,255}),
        Line(points={{20,38},{56,38},{56,-44},{20,-44}}, color={0,0,255}),
        Text(
          extent={{-100,150},{100,110}},
          textString="%name",
          lineColor={0,0,255})}));
end Controller;
