within FaultTriggering.UsersGuide.Tutorial;
class FaultModelling "Fault Modelling"
extends FaultTriggering.Utilities.Icons.Information;
  annotation (Documentation(info="<html>
<h4>Getting started</h4>
<p>In this chapter is explained how to use the fault models. This will be done using using an example of a driveline. In this example, a boolean parameter fault that models a driveline breakage, and a variable real fault, leading to increased friction. </p>
<h4>1. Fault Modelling</h4>
<p>In Figure 1. the driveline of a <a href=\"FaultTriggering.Examples.ActuatorExample.Parts.Drivelines.Driveline\">rotational</a><a href=\"FaultTriggering.Examples.MotorExample.Driveline\"> actuator</a> is shown. Three triggerable faults can be identified:</p>
<ol>
<li>DrivelineDisconnect (Parameter boolean fault)</li>
<li>DriveFriction (Variable real fault)</li>
<li>Sensor fault (internal faults)</li>
</ol>
<p><img src=\"modelica://FaultTriggering/Resources/Documentation/ClutchFault.png\"/></p>
<p>Figure 1. Drivetrain Model</p>
<p>How to implement the faults will be explained below. have a look at the chapter: Parameter and Variable Faults</p>
<ol>
<li><h4>Parameter boolean fault</h4></li>
<p>A Boolean parameter fault can be modelled by using the <a href=\"FaultTriggering.FaultOutput.ConstantBooleanFault\">FaultTriggering.FaultOutput.ConstantBooleanFault</a> model and connecting it to the input of the fault case. In this case the boolean to real converter outputs 1 in case that the fault is false, and 0 otherwise. This engages or disconnects the driveline by disconnecting a <a href=\"Modelica.Mechanics.Rotational.Components.Clutch\">clutch</a>.</p>
<p>In the boolean parameter value block, it is possible to turn the fault on or off (default=off). <b>IMPORTANT:</b> Note that using an parameter to set the faults can lead to problems. See chapter &QUOT;<a href=\"FaultTriggering.UsersGuide.Tutorial.Important\">Important</a>&QUOT; for an explanation.</p>
<p><img src=\"modelica://FaultTriggering/Resources/Documentation/BooleanParameterFault.png\"/></p>
<p><i>Figure 2. User interface of the Boolean parameter fault block.</i></p>
<li><h4>Variable Fault</h4></li>
<p>The variable faults are handled just like parameter faults. In Figure 1 the DriveFriction is modelled with a <a href=\"FaultTriggering.FaultOutput.FaultReal\">real variable fault</a> which is connected to a <a href=\"Modelica.Mechanics.Rotational.Components.Brake\">brake</a> element.</p>
<p>The fault model can be configured by the user (see Figure 3). Unlike the Parameter Fault where only the default value can be set, it is possible to set the record <b>externalRealFault</b> (see Figure 4). In this record three parameters must be set; The boolean <b>externalFaultOn</b> is used to switch the input from the global Faulttriggering on or off. This makes it possible to use the predefined default value without using the global model. The optional integer paramter <b>faultMode</b> can be used by advanced users to automatically reconfigure models. This reconfiguration is handled in the chapter <a href=\"FaultTriggering.UsersGuide.Tutorial.AutomaticModelReconfiguration\">Automatic Model Reconfiguration</a>. In the &QUOT;advanced&QUOT; tab the parameter <b>faultIndex</b>, which indicates which output channel of the global model <a href=\"FaultTriggering.FaultOutput.FaultTrigger\">FaultTrigger</a> is used. This should not be set by the user unless for debugging purposes or experienced users.</p>
<p><b>IMPORTANT:</b> Note that using an parameter to set the faults can lead to problems. See chapter &QUOT;<a href=\"FaultTriggering.UsersGuide.Tutorial.Important\">Important</a>&QUOT; for an explanation!</p>
<p><img src=\"modelica://FaultTriggering/Resources/Documentation/RealVariableFault.png\"/></p>
<p><i>Figure 3. User interface of a Real variable fault block.</i></p>
<p><img src=\"modelica://FaultTriggering/Resources/Documentation/RealVariableFault_level2.png\"/></p>
<p><i>Figure 4. Record ExternalFault.</i></p>
<li><h4>Internal Fault</h4></li>
</ol>
<p>Using the models in the package <a href=\"FaultTriggering.FaultOutput.Internal\">FaultTriggering.FaultOutput.Internal</a>, it is possible to create broken models by using the &QUOT;<i>extends</i>&QUOT; functionality. An example of this possibility can be found in the sensor model <a href=\"FaultTriggering.Examples.MotorExample.FaultSpeedSensor\">FaultTriggering.Examples.MotorExample.FaultSpeedSensor</a> </p>
</html>", revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2014, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end FaultModelling;
