within FaultTriggering.FaultOutput;
model ExternalFaultTrigger
  "Fault model to use with external inputs. Note this model is made only for advanced users who thouroughly understand the advantages and disadvantages"
  extends FaultTriggering.FaultOutput.Partial_FaultTrigger;
  Modelica.Blocks.Interfaces.RealInput realFaultInput[realFaultSize]
    "Connector of Real input signals"
    annotation (Placement(transformation(extent={{-120,60},{-80,100}}),
        iconTransformation(extent={{-120,60},{-80,100}})));
  Modelica.Blocks.Interfaces.IntegerInput integerFaultInput[
    integerFaultSize] "Connector of Real input signals"
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.BooleanInput booleanFaultInput[
    booleanFaultSize] "Connector of Real input signals"
    annotation (Placement(transformation(extent={{-120,-100},{-80,-60}})));

equation
  realFault    = realFaultInput;
  integerFault = integerFaultInput;
  booleanFault = booleanFaultInput;
  annotation (defaultComponentPrefixes="inner",defaultComponentName="faultTrigger",Diagram(graphics), Icon(graphics),
    Documentation(info="<html>
<p>The outer model FaultTriggering.FaultOutput.ExternalFaultTrigger is used to supply the fault channels for all variable faults. In this block these faults can be externally controlled using the block inuts. Using the supplied matlab m-functions, this block makes it possible to trigger faults from Matlab/Simulink.</p>
</html>", revisions="<html>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><h4>Copyright &copy; DLR Institute of System Dynamics and Control </h4></td>
</tr>
</table>
</html>"));
end ExternalFaultTrigger;
