within FaultTriggering.Examples.ActuatorExample.Parts.Bearings;
model Simple
  extends FaultTriggering.Examples.ActuatorExample.Parts.Bearings.PartialBase;

  Modelica.Mechanics.Rotational.Components.BearingFriction bearingFriction
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
equation
  connect(bearingFriction.flange_a, flange_a) annotation (Line(
      points={{-10,0},{-100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(bearingFriction.flange_b, flange_b) annotation (Line(
      points={{10,0},{100,0}},
      color={0,0,0},
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
        Line(points={{-75,70},{-75,10}}, color={0,0,0}),
        Line(points={{75,70},{75,10}}, color={0,0,0}),
        Line(
          points={{0,-80},{0,-100}},
          color={0,0,0},
          smooth=Smooth.None)}),    Documentation(info="<html>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><br/><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><p><h4>Copyright &copy; DLR Institute of System Dynamics and Control </h4></p></td>
</tr>
</table>
</html>"));
end Simple;
