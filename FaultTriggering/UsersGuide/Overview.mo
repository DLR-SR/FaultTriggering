within FaultTriggering.UsersGuide;
class Overview
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
<p>In this package, models are supplied to trigger faults in an consistent way. Several types of faults are included: </p>
<ul>
<li><b>Parameter Faults </b>(Real,Integer as well as Boolean). These can be set at the beginning of each simulation run.</li>
<li><b>Variable Faults</b> (Real,Integer as well as Boolean). Can be changed during simulation time.</li>
</ul>
<p>These blocks can be simply added as sources. The blocks have default values which can be used for testing or the case where the faults are not interesting. </p>
<p>An example model with integrated faults can look like this:</p>
<p><br><img src=\"modelica://FaultTriggering/Resources/Documentation/ClutchFault.png\"/></p>
<p>It is possible to identify the sources of the faults. Moreover it is possible to generate text-only models using internal fault sources.</p>
<p>An algorithm with searches the complete model on models which use a certain model type. The result of this seach is used to create a wrapper library where the user can specify the fault parameters in a central block.</p>
<p>Such a wrapper model can look like:</p>
<p><img src=\"modelica://FaultTriggering/Resources/Documentation/FaultPackageModel.png\"/></p>
<p>The faults can be set using the faultTrigger instance. Inside this model, the fault can be set as shown in the following figure:</p>
<p><img src=\"modelica://FaultTriggering/Resources/Documentation/ConnectBusToFault.png\"/></p>
<p>The parameter faults can be set directly in the model by ajusting the parameters of the fault block.</p>
</html>", revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2015, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end Overview;
