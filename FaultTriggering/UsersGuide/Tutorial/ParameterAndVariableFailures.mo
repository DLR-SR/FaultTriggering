within FaultTriggering.UsersGuide.Tutorial;
model ParameterAndVariableFailures "Parameter and Variable Failures"
  extends FaultTriggering.Utilities.Icons.Information;
  annotation (Documentation(info="<html>
<p><b><font style=\"color: #008000; \">How to select the right FaultOutput block from the <a href=\"modelica://FailureTriggering.FaultOutput\">FaultOutput</a> package?</font></b></p>
<p>In the FaultOutput package, you will find several fault output models. To trigger the failures, the models ConstantRealFailure up to VariableBooleanFailure can be selected to trigger any failures.</p>
<p><h4><font color=\"#008000\">Parameter or Variable failures?</font></h4></p>
<p>There are two major types that can be selected; <b>Variable</b> and <b>Parameter</b> faults.</p>
<p><ol>
<li><b>Parameter Faults</b>: Faults that at set at the beginning of each simulation.</li>
<li><b>Variable Faults</b>: Faults that can vary during simulation time. Along with this, an advanced optional mode selection is available.</li>
</ol></p>
<p>To help to choose between the failures, a short description and some examples are given:</p>
<p><h5>Parameter Faults</h5></p>
<p>Parameter Faults shoul be used for failures that change very slowly in time with respect to the simulation time so that a constant failure value can be assumed.</p>
<p>Examples:</p>
<p><ul>
<li>Gearbox play</li>
<li>Degradation of capacitors</li>
<li>Oil viscosity degradation</li>
</ul></p>
<p><h5>Variable failures</h5></p>
<p>Variable failures should be used so simulate relatively fast failures with respect to simulation time, and no constant failure signal can be assumed during simulation time. When simulationg this kind of failures, usually transient and dynamic effects are important.</p>
<p>Examples:</p>
<p><ul>
<li>IGBT internal shortcut</li>
<li>Breakage of hydraulic oil line</li>
<li>Gearbox tooth breakage</li>
<li>Actuator jam</li>
</ul></p>
<p><h4><font color=\"#008000\">Real, Integer or Boolean failures?</font></h4></p>
<p>The choice between Real, Integer and Boolean failures, can usually be mady by analysing the failure and the test procedures which are planned with it.</p>
<p>If a failure has a variable &QUOT;fault&QUOT; value (such as a friction increase), a Real failure is most appropriate. If the failureoutput is used to switch certain pre-defined failure cases (different failure modes of a bearing), an Integer failure should be used. If a failure only has an &QUOT;Off&QUOT; and an &QUOT;On&QUOT; state (such a short circuit or shaft breakage), a boolean failure should be used.</p>
</html>"));
end ParameterAndVariableFailures;
