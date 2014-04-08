within FaultTriggering.Examples.ActuatorExample.Parts.Bearings;
model FaultSelector "Fault selector container model"
  extends Modelica.Mechanics.Rotational.Interfaces.PartialTwoFlanges;
  Trivial trivial if fault.externalBooleanFault.faultMode==1
    annotation (Placement(transformation(extent={{-10,38},{10,58}})));
  Blocked blocked if fault.externalBooleanFault.faultMode==2
    annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
  Simple simple if fault.externalBooleanFault.faultMode==3
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  FaultOutput.VariableBooleanFault fault
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));

equation
  connect(trivial.flange_b, flange_b)                                                                   annotation (Line(
      points={{10,48},{20,48},{20,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(simple.flange_b, flange_b)  annotation (Line(
      points={{10,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(blocked.flange_b, flange_b) annotation (Line(
      points={{10,-50},{20,-50},{20,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(flange_a, simple.flange_a) annotation (Line(
      points={{-100,0},{-10,0}},
      color={0,0,0},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(flange_a, trivial.flange_a) annotation (Line(
      points={{-100,0},{-20,0},{-20,48},{-10,48}},
      color={0,0,0},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(flange_a, blocked.flange_a) annotation (Line(
      points={{-100,0},{-20,0},{-20,-50},{-10,-50}},
      color={0,0,0},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(fault.y, trivial.u1) annotation (Line(
      points={{-39,50},{-34,50},{-34,54},{-10,54}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(fault.y, simple.u1) annotation (Line(
      points={{-39,50},{-34,50},{-34,6},{-10,6}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(fault.y, blocked.u1) annotation (Line(
      points={{-39,50},{-34,50},{-34,-44},{-10,-44}},
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
        Rectangle(
          extent={{-100,10},{100,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
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
          points={{60,-60},{60,-70},{75,-70},{75,-80},{-75,-80},{-75,-70},{-60,-70},
              {-60,-60},{60,-60}},
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
          points={{60,60},{60,70},{75,70},{75,80},{-75,80},{-75,70},{-60,70},{-60,
              60},{60,60}},
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
      pattern=LinePattern.None)}),Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                                          graphics={Text(
          extent={{2,84},{88,76}},
          lineColor={0,0,255},
          textString=
              "Modelselection is done by the modelmodeselection output from the \"fault\" block")}),
    Documentation(info="<html>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><br/><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><p><h4>Copyright &copy; DLR Institute of System Dynamics and Control </h4></p></td>
</tr>
</table>
</html>"));
end FaultSelector;
