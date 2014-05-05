within FaultTriggering.Examples.ActuatorExample.Parts.Bearings;
model Trivial
  extends FaultTriggering.Examples.ActuatorExample.Parts.Bearings.PartialBase;

equation
  connect(flange_a, flange_b) annotation (Line(
      points={{-100,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation ( Documentation(info="<html>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><br/><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><p><h4>Copyright &copy; DLR Institute of System Dynamics and Control </h4></p></td>
</tr>
</table>
</html>"));
end Trivial;
