within FaultTriggering.UsersGuide.Tutorial;
model ParameterAndVariableFaults "Parameter and Variable Faults"
  extends Modelica.Icons.Information;
  annotation (Documentation(info="<html>
<p><b><font style=\"color: #008000; \">How to select the right FaultOutput block from the <a href=\"modelica://FaultTriggering.FaultOutput\">FaultOutput</a> package?</font></b></p>
<p>In the FaultOutput package, you will find several fault output models. To trigger the faults, the models ConstantRealFault up to VariableBooleanFault can be selected to trigger any faults.</p>
<p><h4><font color=\"#008000\">Parameter or Variable faults?</font></h4></p>
<p>There are two major types that can be selected; <b>Variable</b> and <b>Parameter</b> faults.</p>
<p><ol>
<li><b>Parameter Faults</b>: Faults that at set at the beginning of each simulation.</li>
<li><b>Variable Faults</b>: Faults that can vary during simulation time. Along with this, an advanced optional mode selection is available.</li>
</ol></p>
<p>To help to choose between the faults, a short description and some examples are given:</p>
<p><h5>Parameter Faults</h5></p>
<p>Parameter Faults should be used for faults that change very slowly in time with respect to the simulation time so that a constant fault value can be assumed.</p>
<p>Examples:</p>
<p><ul>
<li>Gearbox play</li>
<li>Degradation of capacitors</li>
<li>Oil viscosity degradation</li>
</ul></p>
<p><h5>Variable faults</h5></p>
<p>Variable faults should be used so simulate relatively fast faults with respect to simulation time, and no constant fault signal can be assumed during simulation time. When simulating this kind of faults, usually transient and dynamic effects are important.</p>
<p>Examples:</p>
<p><ul>
<li>IGBT internal shortcut</li>
<li>Breakage of hydraulic oil line</li>
<li>Gearbox tooth breakage</li>
<li>Actuator jam</li>
</ul></p>
<p><h4><font color=\"#008000\">Real, Integer or Boolean faults?</font></h4></p>
<p>The choice between Real, Integer and Boolean faults, can usually be mady by analysing the fault and the test procedures which are planned with it.</p>
<p>If a fault has a variable &quot;fault&quot; value (such as a friction increase), a Real fault is most appropriate. If the faultoutput is used to switch certain pre-defined fault cases (different fault modes of a bearing), an Integer fault should be used. If a fault only has an &quot;Off&quot; and an &quot;On&quot; state (such a short circuit or shaft breakage), a boolean fault should be used.</p>
</html>", revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2015, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end ParameterAndVariableFaults;
