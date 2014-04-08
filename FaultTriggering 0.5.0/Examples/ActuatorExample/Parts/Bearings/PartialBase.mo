within FaultTriggering.Examples.ActuatorExample.Parts.Bearings;
partial model PartialBase
extends Modelica.Mechanics.Rotational.Interfaces.PartialTwoFlanges;

  Modelica.Blocks.Interfaces.BooleanInput u1
    "Connector of Boolean input signal"
    annotation (Placement(transformation(extent={{-120,40},{-80,80}})));

  annotation (Icon(graphics={
        Rectangle(
          extent={{-100,10},{100,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
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
          points={{60,-60},{60,-70},{75,-70},{75,-80},{-75,-80},{-75,-70},{
              -60,-70},{-60,-60},{60,-60}},
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
          points={{60,60},{60,70},{75,70},{75,80},{-75,80},{-75,70},{-60,70},
              {-60,60},{60,60}},
          lineColor={0,0,0},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Line(points={{75,70},{75,10}}, color={0,0,0}),
        Line(
          points={{0,-80},{0,-100}},
          color={0,0,0},
          smooth=Smooth.None),
        Text(
          extent={{-140,140},{160,100}},
          textString="%name",
          lineColor={0,0,255}),
    Polygon(
      points={{70,90},{-22,10},{0,-10},{-70,-90},{30,-10},{10,10},{70,90}},
      smooth=Smooth.None,
      fillColor={255,0,255},
      fillPattern=FillPattern.Solid,
      pattern=LinePattern.None)}), Documentation(info="<html>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><br/><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><p><h4>Copyright &copy; DLR Institute of System Dynamics and Control </h4></p></td>
</tr>
</table>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td></td>
<td></td>
</tr>
</table>
</html>"));
end PartialBase;
