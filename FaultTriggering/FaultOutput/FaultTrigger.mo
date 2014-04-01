within FaultTriggering.FaultOutput;
model FaultTrigger
  "Standard Fault model that is used in the case that no FaultTrigger global is defined"
  extends FaultTriggering.FaultOutput.Partial_FaultTrigger;
equation
  for i in 1:realFaultSize loop
    realFault[i] = time * i;
  end for;
  for i in 1:integerFaultSize loop
    integerFault[i] = i;
  end for;
  for i in 1:booleanFaultSize loop
    booleanFault[i] = false;
  end for;

  annotation (defaultComponentPrefixes="inner",defaultComponentName="faultTrigger",Diagram(graphics), Icon(graphics),
    Documentation(info="<html>
<p>Default model of the FaultTrigger to supply all variable faults with values.</p>
<p>The default outputs of the fault channels is:</p>
<pre>&nbsp;&nbsp;realFault[1]&nbsp;=&nbsp;time;
&nbsp;&nbsp;realFault[2]&nbsp;=&nbsp;time*2;
&nbsp;&nbsp;realFault[3]&nbsp;=&nbsp;time*3;
&nbsp;&nbsp;realFault[4]&nbsp;=&nbsp;time*4;

&nbsp;&nbsp;integerFault[1]&nbsp;=&nbsp;0;
&nbsp;&nbsp;integerFault[2]&nbsp;=&nbsp;1;
&nbsp;&nbsp;integerFault[3]&nbsp;=&nbsp;2;
&nbsp;&nbsp;integerFault[4]&nbsp;=&nbsp;3;

&nbsp;&nbsp;booleanFault[1]&nbsp;=&nbsp;true;
&nbsp;&nbsp;booleanFault[2]&nbsp;=&nbsp;false;
&nbsp;&nbsp;booleanFault[3]&nbsp;=&nbsp;true;
&nbsp;&nbsp;booleanFault[4]&nbsp;=&nbsp;false;</pre>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td></td>
<td></td>
</tr>
</table>
</html>", revisions="<html>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><h4>Copyright &copy; DLR Institute of System Dynamics and Control </h4></td>
</tr>
</table>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td></td>
<td></td>
</tr>
</table>
</html>"));
end FaultTrigger;
