within FaultTriggering.Examples.ActuatorExample;
model Actuator_ParameterFaults "Actuator with faults everywhere"

  Parts.Motors.Simple_ParameterFaults                    motor
    annotation (Placement(transformation(extent={{-70,-50},{-50,-30}})));
  FaultTriggering.Examples.ActuatorExample.Parts.Drivelines.Driveline_ParamterFaults
    driveline
    annotation (Placement(transformation(extent={{-30,-50},{-10,-30}})));
  Modelica.Mechanics.Rotational.Sources.LinearSpeedDependentTorque load(
      tau_nominal=-0.1,w_nominal=1)
    annotation (Placement(transformation(extent={{60,-50},{40,-30}})));
  Modelica.Blocks.Sources.Constant speedReference(k=1)
    annotation (Placement(transformation(extent={{-90,0},{-70,20}})));
  Modelica.Blocks.Continuous.PID pID(
    initType=Modelica.Blocks.Types.InitPID.InitialState,
    Nd=1,
    Td=0,
    k=0.5,
    Ti=0.005)
           annotation (Placement(transformation(extent={{-28,0},{-8,20}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
equation
  connect(motor.flange1, driveline.flange_a1) annotation (Line(
      points={{-50.2,-40},{-30,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(driveline.flange_b1,load. flange)
    annotation (Line(
      points={{-10,-40},{40,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(feedback.y,pID. u) annotation (Line(
      points={{-41,10},{-30,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(speedReference.y, feedback.u1)         annotation (Line(
      points={{-69,10},{-58,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(driveline.ActuatorSpeed, feedback.u2) annotation (Line(
      points={{-9,-43},{0,-43},{0,-10},{-50,-10},{-50,2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pID.y, motor.torqueReference) annotation (Line(
      points={{-7,10},{10,10},{10,-20},{-72,-20},{-72,-34},{-66,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                      graphics={Rectangle(
          extent={{-100,-24},{20,40}},
          pattern=LinePattern.None,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}), Text(
          extent={{-100,26},{20,36}},
          pattern=LinePattern.None,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          textString="Actuator Speed Controler")}),
                                 Icon(graphics={
        Rectangle(
          extent={{-80,100},{-30,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={0,128,255}),
        Rectangle(
          extent={{-80,100},{-100,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={128,128,128}),
        Rectangle(
          extent={{-30,10},{-10,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={95,95,95}),
        Rectangle(
          extent={{0,80},{80,-80}},
          lineColor={0,0,0},
          pattern=LinePattern.Solid,
          lineThickness=0.25,
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Polygon(
          points={{-20,10},{-20,20},{0,40},{0,-40},{-20,-20},{-20,10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={128,128,128}),
        Polygon(
          points={{100,20},{80,40},{80,-40},{100,-20},{100,20}},
          lineColor={128,128,128},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid),
                                        Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        lineColor={0,0,255}),
        Ellipse(
          extent={{-70,-60},{-30,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-50,-70},{-50,-62}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{-54,-72},{-58,-64}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{-58,-74},{-64,-70}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{-46,-70},{-42,-64}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{-42,-74},{-36,-70}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Polygon(
          points={{-48,-72},{-42,-76},{-40,-64.8},{-48,-72}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-50,-80},{-46,-74}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Ellipse(
          extent={{40,-40},{80,-80}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{60,-50},{60,-42}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{56,-52},{52,-44}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{52,-54},{46,-50}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{64,-50},{68,-44}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{68,-54},{74,-50}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Polygon(
          points={{62,-52},{68,-56},{70,-44.8},{62,-52}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{60,-60},{64,-54}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{100,-60},{80,-60}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{100,-90},{-30,-90}},
          pattern=LinePattern.None,
          smooth=Smooth.None)}),
    Documentation(info="<html>
<p>The ActuatorInternalFault model is a basic rotational actuator model with faults. The goal of the model is the demonstration of various fault possibilities as well as how to moddel faults and to controll them. All faults can be set in the &QUOT;FaultTrigger&QUOT; model.</p>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><br/><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><p><h4>Copyright &copy; DLR Institute of System Dynamics and Control </h4></p></td>
</tr>
</table>
</html>", revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2014, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end Actuator_ParameterFaults;
