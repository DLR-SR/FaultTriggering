within FaultTriggering.Examples.ActuatorExample.Parts.Drivelines;
model Driveline_ParamterFaults "Example of a simple driveline with faults"

extends Modelica.Mechanics.Rotational.Icons.Gearbox;
  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=0, realFalse=1)
    annotation (Placement(transformation(extent={{-68,40},{-48,60}})));
  Modelica.Mechanics.Rotational.Components.Clutch driveline_Break(fn_max=
        100)
    annotation (Placement(transformation(extent={{-44,-10},{-24,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=1e-3)
    annotation (Placement(transformation(extent={{-16,-10},{4,10}})));
  Modelica.Mechanics.Rotational.Components.Brake brake(fn_max=100)
    annotation (Placement(transformation(extent={{14,-10},{34,10}})));
  Modelica.Blocks.Interfaces.RealOutput ActuatorSpeed
    "Absolute angular velocity of flange"
    annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a1
    "Left flange of compliant 1-dim. rotational component"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b1
    "Flange of right shaft"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio=2)
    annotation (Placement(transformation(extent={{-84,-10},{-64,10}})));
  FaultOutput.ConstantBooleanFault disconnect(constBooleanFault=false)
    annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  FaultSpeedSensor_ParamterFault
                     speedSensor(constBooleanFault=false)
    annotation (Placement(transformation(extent={{52,-40},{72,-20}})));
  FaultOutput.ConstantRealFault friction(constRealFault=0)
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
equation
  connect(booleanToReal.y,driveline_Break. f_normalized) annotation (Line(
      points={{-47,50},{-34,50},{-34,11}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(driveline_Break.flange_b,inertia. flange_a) annotation (Line(
      points={{-24,0},{-16,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inertia.flange_b,brake. flange_a) annotation (Line(
      points={{4,0},{14,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(brake.flange_b, flange_b1) annotation (Line(
      points={{34,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flange_a1, idealGear.flange_a) annotation (Line(
      points={{-100,0},{-84,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealGear.flange_b,driveline_Break. flange_a) annotation (Line(
      points={{-64,0},{-44,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(speedSensor.flange, brake.flange_b) annotation (Line(
      points={{51.8,-30},{40,-30},{40,0},{34,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(speedSensor.w, ActuatorSpeed) annotation (Line(
      points={{73,-30},{110,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(friction.y, brake.f_normalized)      annotation (Line(
      points={{21,30},{24,30},{24,11}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(disconnect.y, booleanToReal.u)          annotation (Line(
      points={{-79,50},{-70,50}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (Diagram(graphics), Icon(graphics={
                                        Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        lineColor={0,0,255})}),
    Documentation(info="<html>
<p>Simple drive line of a rotational actuator.</p>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><br/><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><p><h4>Copyright &copy; DLR Institute of System Dynamics and Control </h4></p></td>
</tr>
</table>
</html>"));
end Driveline_ParamterFaults;
