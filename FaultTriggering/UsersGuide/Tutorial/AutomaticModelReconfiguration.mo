within FaultTriggering.UsersGuide.Tutorial;
model AutomaticModelReconfiguration "Automatic Model Reconfiguration"
  extends FaultTriggering.Utilities.Icons.Information;

  annotation (Documentation(info="<html>
<p>Model reconfiguration</p>
<p>Using the extra integer parameter that is transmitted with each variable fault, it is possible to use an automatic model reconfiguration to save resources in the case that no fault is modelled. In the figure below a setup of such a reconfiguration is given.</p>
<p><br/><img src=\"modelica://FaultTriggering/Resources/Documentation/AutomaticModelReconfiguration.png\"/></p>
<p>To trigger the reconfiguration, in the textlayer the switching has to be activated. In this case this is done using following code:</p>
<p><code>&nbsp;&nbsp;<font style=\"color: #ff0000; \">Trivial</font>&nbsp;trivial&nbsp;<font style=\"color: #0000ff; \">if&nbsp;</font>fault.externalBooleanFault.faultMode==1;</code></p>
<p><code>&nbsp;&nbsp;<font style=\"color: #ff0000; \">Blocked</font>&nbsp;blocked&nbsp;<font style=\"color: #0000ff; \">if&nbsp;</font>fault.externalBooleanFault.faultMode==2;</code></p>
<p><code>&nbsp;&nbsp;<font style=\"color: #ff0000; \">Simple </font>&nbsp;simple&nbsp; <font style=\"color: #0000ff; \">if&nbsp;</font>fault.externalBooleanFault.faultMode==3;</code></p>
<p><br/>This allows the local activation of the individual components. It is not necessary to define conditional connects, as they are automatically disregarded. It is good design practice, that in case of a model selection which is done on the equation layer, a note is made on hte diagram layer. Also using dashed lines helps understadning ht emodel for the end user.</p>
</html>"));
end AutomaticModelReconfiguration;
