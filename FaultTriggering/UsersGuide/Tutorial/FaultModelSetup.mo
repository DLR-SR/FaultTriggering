within FaultTriggering.UsersGuide.Tutorial;
class FaultModelSetup "Fault model setup"
extends FaultTriggering.Utilities.Icons.Information;
    annotation (Documentation(info="<html>
<p>To show how the FaultTriggering toolbox works, a complete rotational actuator <a href=\"FaultTriggering.Examples.ActuatorExample.Actuator\">model</a> with faults including a load is prepared.</p>
<p><h4><font color=\"#008000\">General Model</font></h4></p>
<p><br/>The actuator model is built of 2 main parts, the motor and the driveline. In the motor the following faults are implemented:</p>
<p><ol>
<li>Winding Fault (Integer Fault): the motor torque constant is reduced with the fault level</li>
<li>Sensor Fault (Boolean Fault): Disconnects the sensor output.</li>
</ol></p>
<p>The driveline has following faults:</p>
<p><ol>
<li>Driveline disconnect (Boolean parameter fault): disconnects the driveline</li>
<li>Drive friction (Real fault)</li>
<li>Sensor Fault (Boolean parameter fault): Disconnects the sensor output.</li>
<li>Bearing Fault (Boolean fault); using the advanced model reconfiguration functions.</li>
</ol></p>
<p><h4><font color=\"#008000\">Model for use with Dymola</font></h4></p>
<p>The faults in the model <a href=\"FaultTriggering.Examples.ActuatorExample.Actuator\">Actuator</a> can be found and triggered using the function <a href=\"FaultTriggering.createFaultPackage()\">FaultTriggering.createFaultPackage</a>. This function can be called (right click on function --&GT; call function) and needs 4 inputs:</p>
<p><ol>
<li>modelName (name of the model that should be analyzed)</li>
<li>scriptName (name of the script that stores all model information)</li>
<li>packageName (Name of the Fault package created by the function) </li>
<li>maxSearchSize (the maximum number of elements in the model for pre-allocation of the vectors)</li>
</ol></p>
<p><br/>Note that &QUOT;maxSearchSize&QUOT; must be set so that all model components can be allocated. If this is not big enough, the error &QUOT;<code>getAllModelComponents: the&nbsp;pre&nbsp;located&nbsp;size&nbsp;of&nbsp;the&nbsp;vectors&nbsp;is&nbsp;not&nbsp;big&nbsp;enough.&nbsp;Please&nbsp;increase&nbsp;maxSearchSize</code>&QUOT; will be issued.</p>
<p>Calling <a href=\" FaultTriggering.FaultProcessing()\">Fail</a><a href=\" FaultTriggering.faultProcessing()\">ureProce</a><a href=\" FaultTriggering.FaultProcessing()\">ssing</a> with the default inputs leads to an overview of all faults in the model. To get the default values, the model is translated. Therefore only complete models that can be translated can be used.</p>
<p><img src=\"modelica://FaultTriggering/Resources/Documentation/FaultOverview.png\"/></p>
<p><br/>The faults are sorted between Parameter Faults and Variable Faults. In each &QUOT;Fault Names&QUOT; subset the name and some of the properties of the fault are given. </p>
<p><img src=\"modelica://FaultTriggering/Resources/Documentation/BooleanFaultOverview.png\"/></p>
<p>In the &QUOT;Fault values&QUOT; subsets the properties of the fault can be set. In the example shown above the boolean variable faults are shown. It can be seen that both boolean faults are in the driveline: A disconnect and an speedsensor fault. Below the setup for the mode selection of the variable faults is shown. The setup of these modes is only necessary for faults where mode selection is triggered.</p>
<p>In the variableFaults part, the mode selection parts can be set and are treated as parameters.</p>
<p>All the settings made in the GUI are also saved into a plain text file &QUOT;scriptName&QUOT;. A plain text modelica script is generated, which summarizes all settings:</p>
<pre>driveline.friction.externalRealFault.faultIndex=1;//RealIndex&percnt;
driveline.friction.externalRealFault.faultMode=1;//RealMode&percnt;
driveline.friction.externalRealFault.externalFaultOn=1;//Boolean&percnt;
motor.ktFault.externalIntegerFault.faultIndex=1;//IntegerIndex&percnt;
motor.ktFault.externalIntegerFault.faultMode=1;//IntegerMode&percnt;
motor.ktFault.externalIntegerFault.externalFaultOn=1;//Boolean&percnt;
motor.speedSensor.externalBooleanFault.faultIndex=1;//BooleanIndex&percnt;
motor.speedSensor.externalBooleanFault.faultMode=1;//BooleanMode&percnt;
motor.speedSensor.externalBooleanFault.externalFaultOn=1;//Boolean&percnt;
driveline.bearing.fault.externalBooleanFault.faultIndex=2;//BooleanIndex&percnt;
driveline.bearing.fault.externalBooleanFault.faultMode=1;//BooleanMode&percnt;
driveline.bearing.fault.externalBooleanFault.externalFaultOn=1;//Boolean&percnt;
driveline.disconnect.constBooleanFault=0;//Boolean&percnt;
driveline.speedSensor.constBooleanFault=0;//Boolean&percnt;</pre>
<p>This script can be directly run in Dymola (and probably also other Modelica simulators) to set the values of the faults. It is also possible to modify this script for other purposes.</p>
<p>Moreover a library is generated and saved. In this library, the topmost model, which is named &QUOT;&LT;ModelName&GT;+Package&QUOT; is included. This model extends the original model and includes an inner model to control all variable faults as well as an paramter &QUOT;FaultRecord&QUOT; that controls all paramter faults. All values given in the GUI will be set. Manually editting can be by editting the faultTrigger block in the &QUOT;&LT;ModelName&GT;+Wrapper&QUOT; model. The the moment Dymola 2013FD01 has problems wenn single entires are changed in subrecords. If problems exist, the FaultRecord- Record has to be directly editted by hand.</p>
<p>An example of such a generated library is given in FaultTriggering.Examples.ActuatorExample.ActuatorFaults.</p>
<p><h4><font color=\"#008000\">Using the Fault toolbox in Simulink</font></h4></p>
<p>To use the fault toolbox with Simulink the model has to be set up like before, however, the faultbus should be defined as an input. <a href=\" FaultBus.FaultsInput\">FaultsInput</a> in the FaultBus package is a predefined input connector.</p>
<p>After the model is prepared in Dymola, it can be set up as usual in simulink. Please refer to the dymola documentation on how to set up dymola models in Simulink using a &QUOT;DymolaBlock&QUOT;.</p>
</html>", revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2014, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end FaultModelSetup;
