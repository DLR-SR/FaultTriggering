within FaultTriggering.Examples.ActuatorExample.Parts.Motors;
model Simple "example of a simple motor with faults"

extends Modelica.Electrical.Machines.Icons.TransientMachine;
  Modelica.Mechanics.Rotational.Sources.Torque motor
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Sources.Constant bokenKt(k=0)
    annotation (Placement(transformation(extent={{-90,-80},{-70,-60}})));
  Modelica.Blocks.Sources.Constant halfBrokenKt(k=0.5)
    annotation (Placement(transformation(extent={{-90,-50},{-70,-30}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange1 "Flange of shaft"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia motorInertia(J=1e-3)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Routing.Extractor kt_selection(nin=3)
    annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex
    annotation (Placement(transformation(extent={{-50,-50},{-30,-30}})));
  Modelica.Blocks.Sources.Constant healthyKt(k=1)
    annotation (Placement(transformation(extent={{-90,-20},{-70,0}})));
  Modelica.Blocks.Interfaces.RealOutput speed "Connector of Real output signal"
    annotation (Placement(transformation(extent={{100,-90},{120,-70}})));
  Modelica.Blocks.Math.Product motorTorque
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  FaultSpeedSensor speedSensor
    annotation (Placement(transformation(extent={{60,-90},{80,-70}})));
  Modelica.Blocks.Interfaces.RealInput torqueReference "motorTorqueReference"
                           annotation (Placement(transformation(extent={{-140,40},
            {-100,80}}), iconTransformation(extent={{-80,40},{-40,80}})));
  FaultOutput.VariableIntegerFault ktFault(useModelModeSelection=false)
    annotation (Placement(transformation(extent={{-50,-80},{-30,-60}})));
equation
  connect(motor.flange,motorInertia. flange_a) annotation (Line(
      points={{40,0},{60,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(motorInertia.flange_b, flange1) annotation (Line(
      points={{80,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(halfBrokenKt.y, multiplex.u2[1])  annotation (Line(
      points={{-69,-40},{-52,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(healthyKt.y, multiplex.u1[1])  annotation (Line(
      points={{-69,-10},{-60,-10},{-60,-33},{-52,-33}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiplex.u3[1], bokenKt.y)          annotation (Line(
      points={{-52,-47},{-60,-47},{-60,-70},{-69,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(motorTorque.y,motor. tau) annotation (Line(
      points={{1,0},{18,0}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(multiplex.y, kt_selection.u)
                                    annotation (Line(
      points={{-29,-40},{-22,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(kt_selection.y, motorTorque.u2)
                                       annotation (Line(
      points={{1,-40},{4,-40},{4,-20},{-30,-20},{-30,-6},{-22,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(speedSensor.flange, motor.flange) annotation (Line(
      points={{60,-80},{50,-80},{50,0},{40,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(speedSensor.w, speed)      annotation (Line(
      points={{81,-80},{110,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(motorTorque.u1, torqueReference)      annotation (Line(
      points={{-22,6},{-30,6},{-30,60},{-120,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ktFault.y, kt_selection.index) annotation (Line(
      points={{-29,-70},{-10,-70},{-10,-52}},
      color={255,127,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics={Rectangle(
          extent={{10,30},{90,-30}},
          lineColor={0,0,255},
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid), Text(
          extent={{90,18},{10,30}},
          lineColor={0,0,255},
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid,
          textString="Motor")}), Icon(graphics={
                                        Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        lineColor={0,0,255})}),
    Documentation(info="<html>
<p>Simplified motor model with efficiency drop fault (Motor Fault) and SpeedSensor fault.</p>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><br/><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><p><h4>Copyright &copy; DLR Institute of System Dynamics and Control </h4></p></td>
</tr>
</table>
</html>"));
end Simple;
