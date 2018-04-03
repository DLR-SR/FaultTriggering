within FaultTriggering.UsersGuide.Tutorial;
class GettingStarted "Getting started"
extends Modelica.Icons.Information;
    annotation (Documentation(info="<html>
<p>The <b>FaultTriggering</b> Toolbox accommodates two fault types;</p>
<p><ol>
<li><b>Parameter Faults</b>: Faults that at set at the beginning of each simulation.</li>
<li><b>Variable Faults</b>: Faults that can vary during simulation time.</li>
</ol></p>
<p>Both Faults can be several data types:</p>
<p><ol>
<li><b>Boolean</b>: Triggering a hard fault like Actuator disconnects, Rollerscrew jam and the Breakage of electrical cable.</li>
<li><b>Integer</b>: Can trigger fault cases like Sensor faults (sensor has a zero output, sensor saturates, ...)</li>
<li><b>Real</b>: Can be used to set fault levels like bearing friction, increasing pressure losses.</li>
</ol></p>
<p>All Fault models are supplied in <b>FaultTriggering.FaultOutput</b>.</p>
<p>All Variable Faults are controlled by a global <a href=\"FaultTriggering.FaultOutput.FaultTrigger\">model</a> &QUOT;broadcasting&QUOT; the faults. Each variable fault therefore must be coupled to a fault channel from the global FaultTriggering model. This makes also external triggering of the faults (e.g. from Simulink) possible.</p>
<p><br/>Using these fault models all commonly known faults can be modelled. In <a href=\"FaultTriggering.UsersGuide.Tutorial.FaultModelling\">Fault Modelling</a> is explained how to use these blocks.</p>
</html>", revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2015, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end GettingStarted;
