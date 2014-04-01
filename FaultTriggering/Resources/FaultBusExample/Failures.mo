package ActuatorPackage
import FailureTriggering;
extends FailureTriggering.Utilities.Icons.Failure;
model ActuatorWrapper
extends  FailureTriggering.Examples.ActuatorExample.Actuator(
driveline.disconnect.constBooleanFault=failureTrigger.failureRecord.parameterFailures.booleanValue[1]
,
driveline.speedSensor.constBooleanFault=failureTrigger.failureRecord.parameterFailures.booleanValue[2]
,
driveline.friction.externalRealFault=FailureTriggering.Utilities.Types.Variable_Fault_Real(
            externalFaultOn=true,faultIndex=1,failureMode=1)
,
motor.ktFailure.externalIntegerFault=FailureTriggering.Utilities.Types.Variable_Fault_Integer(
            externalFaultOn=true,faultIndex=1,failureMode=1)
,
motor.speedSensor.externalBooleanFault=FailureTriggering.Utilities.Types.Variable_Fault_Boolean(
            externalFaultOn=true,faultIndex=1,failureMode=1)
,
driveline.bearing.failure.externalBooleanFault=FailureTriggering.Utilities.Types.Variable_Fault_Boolean(
            externalFaultOn=true,faultIndex=2,failureMode=1)
);
inner FailureTriggerController failureTrigger
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
end ActuatorWrapper;
model FailureTriggerController
extends FailureTriggering.FaultOutput.Partial_FailureTrigger(realFaultSize = 1,integerFaultSize = 1,booleanFaultSize = 2);
parameter FailureRecord failureRecord;
protected
ActuatorPackage.Interfaces.Failures failures annotation (Placement(transformation(extent={{84,-20},{124,20}})));
equation
realFault[1] = failures.driveline.friction.externalRealFault;
integerFault[1] = failures.motor.ktFailure.externalIntegerFault;
booleanFault[1] = failures.motor.speedSensor.externalBooleanFault;
booleanFault[2] = failures.driveline.bearing.failure.externalBooleanFault;
annotation (defaultComponentPrefixes="inner",defaultComponentName="failureTrigger",Diagram(graphics));
end FailureTriggerController;
record FailureRecord "Predefined Failure record"
extends 
FailureTriggering.Utilities.Records.Failures(
  parameterFailures = FailureTriggering.Utilities.Records.Parameter_Failures(
    realFailures = {FailureTriggering.Utilities.Records.RealFailures(
      name = "",
      path = ""
    )},
    realValue = fill(0,0),
    integerFailures = {FailureTriggering.Utilities.Records.IntegerFailures(
      name = "",
      path = ""
    )},
    integerValue = fill(0,0),
    booleanFailures = {FailureTriggering.Utilities.Records.BooleanFailures(
      name = "FailureTriggering.Utilities.Types.Parameter_Fault_Boolean",
      path = "FailureTriggering.Examples.ActuatorExample.Actuator.driveline.disconnect.constBooleanFault"
    ),
    FailureTriggering.Utilities.Records.BooleanFailures(
      name = "FailureTriggering.Utilities.Types.Parameter_Fault_Boolean",
      path = "FailureTriggering.Examples.ActuatorExample.Actuator.driveline.speedSensor.constBooleanFault"
    )},
    booleanValue = {false, false}
  ),
  variableFailures = FailureTriggering.Utilities.Records.Variable_Failures(
    realFailures = {FailureTriggering.Utilities.Records.RealFailures(
      name = "FailureTriggering.Utilities.Types.Variable_Fault_Real",
      path = "FailureTriggering.Examples.ActuatorExample.Actuator.driveline.friction.externalRealFault"
    )},
    realFailureSelect = {1},
    realFailureMode = {1},
    integerFailures = {FailureTriggering.Utilities.Records.IntegerFailures(
      name = "FailureTriggering.Utilities.Types.Variable_Fault_Integer",
      path = "FailureTriggering.Examples.ActuatorExample.Actuator.motor.ktFailure.externalIntegerFault"
    )},
    integerFailureSelect = {1},
    integerFailureMode = {1},
    booleanFailures = {FailureTriggering.Utilities.Records.BooleanFailures(
      name = "FailureTriggering.Utilities.Types.Variable_Fault_Boolean",
      path = "FailureTriggering.Examples.ActuatorExample.Actuator.motor.speedSensor.externalBooleanFault"
    ),
    FailureTriggering.Utilities.Records.BooleanFailures(
      name = "FailureTriggering.Utilities.Types.Variable_Fault_Boolean",
      path = "FailureTriggering.Examples.ActuatorExample.Actuator.driveline.bearing.failure.externalBooleanFault"
    )},
  booleanFailureSelect = {1, 2},
    booleanFailureMode = {1, 1}
  )
)
;
end FailureRecord;
expandable connector FailuresInput = input ActuatorPackage.Interfaces.Failures "'input Failures' as connector"  annotation (Icon(graphics={Rectangle(extent={{-8,4},{10,0}},lineColor={255,0,0},lineThickness=0.5)}));
package Interfaces
extends Modelica.Icons.InterfacesPackage;
expandable connector Failures
extends FailureTriggering.Utilities.Icons.FailureBus;
ActuatorPackage.Interfaces.driveline driveline;
ActuatorPackage.Interfaces.motor motor;
end Failures;
expandable connector driveline
extends FailureTriggering.Utilities.Icons.FailureSubBus;
ActuatorPackage.Interfaces.friction friction;
ActuatorPackage.Interfaces.bearing bearing;
end driveline;
expandable connector friction
extends FailureTriggering.Utilities.Icons.FailureSubBus;
ActuatorPackage.Interfaces.externalRealFault externalRealFault;
end friction;
type externalRealFault = Real "Real parameter Failure" ;
expandable connector motor
extends FailureTriggering.Utilities.Icons.FailureSubBus;
ActuatorPackage.Interfaces.ktFailure ktFailure;
ActuatorPackage.Interfaces.speedSensor speedSensor;
end motor;
expandable connector ktFailure
extends FailureTriggering.Utilities.Icons.FailureSubBus;
ActuatorPackage.Interfaces.externalIntegerFault externalIntegerFault;
end ktFailure;
type externalIntegerFault = Integer "Integer parameter Failure" ;
expandable connector speedSensor
extends FailureTriggering.Utilities.Icons.FailureSubBus;
ActuatorPackage.Interfaces.externalBooleanFault externalBooleanFault;
end speedSensor;
type externalBooleanFault = Boolean "Boolean parameter Failure" ;
expandable connector bearing
extends FailureTriggering.Utilities.Icons.FailureSubBus;
ActuatorPackage.Interfaces.failure failure;
end bearing;
expandable connector failure
extends FailureTriggering.Utilities.Icons.FailureSubBus;
ActuatorPackage.Interfaces.externalBooleanFault externalBooleanFault;
end failure;
end Interfaces;
end ActuatorPackage;
