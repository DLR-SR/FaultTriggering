within FaultTriggering.UsersGuide.Tutorial;
class FaultSimulation "Fault Simulation"
extends FaultTriggering.Utilities.Icons.Information;
    annotation (Documentation(info="<html>
<p><h4><font color=\"#008000\">Modelica fault injection</font></h4></p>
<p>After the model setup and the wrapper generation using<a href=\" FaultTriggering.createFaultPackage\"> FaultTriggering.createFaultPackage</a>, the variable faults have to be connected to supply the variable values to the model. These faults all have to be fed into the hierarchical faultbus. The connector model from the FaultBus Package &QUOT;<a href=\"FaultBus.FaultTriggerController\">FaultTriggerController</a>&QUOT; has to be set up. Connecting a source to the bus, brings up a GUI where the user can select the individual fault to which this source should be coupled. Below an example of the GUI from Dymola is shown:</p>
<p><img src=\"modelica://FaultTriggering/Resources/Documentation/ConnectSourcesToBus.png\"/></p>
<p>Using this method all faults should be connected. Below an example of how this model can be connected is shown.</p>
<p><img src=\"modelica://FaultTriggering/Resources/Documentation/ConnectBusToFault.png\"/></p>
<p>After setting up this model, the simulation can be started. For the demo model <a href=\"FaultTriggering.Examples.ActuatorExample.Actuator\">Actuator</a> a complete set up of a faultwrapper library is given: <a href=\"FaultTriggering.Examples.ActuatorExample.ActuatorFaults\">FaultTriggering.Examples.ActuatorExample.ActuatorFaults</a>. In this library FaultTriggerController is pre-configured.</p>
<p><h4><font color=\"#008000\">Simulink fault injection</font></h4></p>
<p><br/>For the use in Simulink, it is possible to directly set the bus as an input. Use the supplied &QUOT;FaultsInput&QUOT; to set up the input for the usage with the simulink. First, the FaultTriggerController block should be editted. Add a FaultsInput bus and connect the two:</p>
<p><img src=\"modelica://FaultTriggering/Resources/Documentation/SimulinkFaultTriggerControllerSetup.png\"/></p>
<p><br/><br/>Also in the wraper model, a faultsInput bus should be added:</p>
<p><br/><br/><img src=\"modelica://FaultTriggering/Resources/Documentation/SimulinkWrapperSetup.png\"/></p>
<p>Using this setup, the model can be directly integrated in a simulink environment.</p>
<p><img src=\"modelica://FaultTriggering/Resources/Documentation/SimulinkDymolaBlock.png\"/></p>
</html>", revisions="<html>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><h4>Copyright &copy; DLR Institute of System Dynamics and Control </h4></td>
</tr>
</table>
</html>"));
end FaultSimulation;
