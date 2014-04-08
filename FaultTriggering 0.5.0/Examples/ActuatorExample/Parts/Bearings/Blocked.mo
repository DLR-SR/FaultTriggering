within FaultTriggering.Examples.ActuatorExample.Parts.Bearings;
model Blocked
  extends FaultTriggering.Examples.ActuatorExample.Parts.Bearings.PartialBase;

  Modelica.Mechanics.Rotational.Components.BearingFriction bearingFriction
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Mechanics.Rotational.Components.Brake brake(fn_max=100)
    annotation (Placement(transformation(extent={{28,-10},{48,10}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=1, realFalse=0)
    annotation (Placement(transformation(extent={{-20,50},{0,70}})));
equation
  connect(bearingFriction.flange_a, flange_a) annotation (Line(
      points={{-40,0},{-100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(brake.flange_a, bearingFriction.flange_b) annotation (Line(
      points={{28,0},{-20,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(brake.flange_b, flange_b) annotation (Line(
      points={{48,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(booleanToReal.y, brake.f_normalized) annotation (Line(
      points={{1,60},{38,60},{38,11}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanToReal.u, u1) annotation (Line(
      points={{-22,60},{-100,60}},
      color={255,0,255},
      smooth=Smooth.None));
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
        Line(points={{-75,-10},{-75,-70}}, color={0,0,0}),
        Line(points={{75,-10},{75,-70}}, color={0,0,0}),
        Rectangle(extent={{-60,60},{60,10}}, lineColor={0,0,0}),
        Line(points={{-75,70},{-75,10}}, color={0,0,0}),
        Line(points={{75,70},{75,10}}, color={0,0,0}),
        Line(
          points={{0,-80},{0,-100}},
          color={0,0,0},
          smooth=Smooth.None)}), Diagram(graphics),
    Documentation(info="<html>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><br/><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><p><h4>Copyright &copy; DLR Institute of System Dynamics and Control </h4></p></td>
</tr>
</table>
</html>"));
end Blocked;
