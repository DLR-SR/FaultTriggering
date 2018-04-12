within FaultTriggering.Examples.ActuatorExample.Parts;
model FaultSpeedSensor_ParameterFault
  "Example of simple sensor model with faults"

  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange
    "Flange of shaft from which sensor information shall be measured"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

  Modelica.Blocks.Interfaces.RealOutput w "Absolute angular velocity of flange"
    annotation (Placement(transformation(extent={{100,-10},{120,10}}),
        iconTransformation(extent={{100,-10},{120,10}})));
  extends FaultTriggering.FaultOutput.Internal.InternalConstantBooleanFault;
equation

 w = if constBooleanFault then 0 else der(flange.phi);
 flange.tau = 0;

  annotation ( Icon(graphics={
        Ellipse(
          extent={{-72,70},{68,-70}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-2.48,31.6},{16,26},{16,57.2},{-2.48,31.6}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(points={{-72,0},{-92,0}}, color={0,0,0}),
        Line(points={{68,0},{98,0}}, color={0,0,127}),
        Line(points={{-2,70},{-2,40}}, color={0,0,0}),
        Line(points={{20.9,32.8},{38.2,57.3}}, color={0,0,0}),
        Line(points={{-24.9,32.8},{-42.2,57.3}}, color={0,0,0}),
        Line(points={{35.6,13.7},{63.8,23.9}}, color={0,0,0}),
        Line(points={{-39.6,13.7},{-67.8,23.9}}, color={0,0,0}),
        Line(points={{-2,0},{7.02,28.6}}, color={0,0,0}),
        Ellipse(
          extent={{-7,5},{3,-5}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{68,-30},{118,-70}},
          lineColor={0,0,0},
          textString="w"),
        Text(
          extent={{-34,-40},{26,-100}},
          lineColor={0,0,0},
          textString="%faultNumber"),
    Polygon(
      points={{70,90},{-22,10},{0,-10},{-70,-90},{30,-10},{10,10},{70,90}},
      smooth=Smooth.None,
      fillColor={255,0,255},
      fillPattern=FillPattern.Solid,
      pattern=LinePattern.None)}),
    Documentation(info="<html>
<p>Basic rotational speed sensor with fault interface to set the actuator output to zero in case of a fault.</p>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><br/><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><p><h4>Copyright &copy; DLR Institute of System Dynamics and Control </h4></p></td>
</tr>
</table>
</html>"));
end FaultSpeedSensor_ParameterFault;
