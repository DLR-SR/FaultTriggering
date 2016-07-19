within FaultTriggering.Examples.ActuatorExample;
package ActuatorPackage
import FaultTriggering;
extends FaultTriggering.Utilities.Icons.Fault;
model ActuatorWrapper
extends FaultTriggering.Examples.ActuatorExample.Actuator(driveline(
        disconnect(
constBooleanFault =                    faultTrigger.faultRecord.parameterFaults.booleanValue[1]),
        speedSensor(
constBooleanFault =                     faultTrigger.faultRecord.parameterFaults.booleanValue[2]),
        friction(
externalRealFault =                  FaultTriggering.Utilities.Types.Variable_Fault_Real(
            externalFaultOn=true,faultIndex=1,faultMode=faultTrigger.faultRecord.variableFaults.realFaultMode[1])),
        bearing(fault(
externalBooleanFault =                       FaultTriggering.Utilities.Types.Variable_Fault_Boolean(
            externalFaultOn=true,faultIndex=2,faultMode=faultTrigger.faultRecord.variableFaults.booleanFaultMode[2])))),
        motor(ktFault(
externalIntegerFault =             FaultTriggering.Utilities.Types.Variable_Fault_Integer(
            externalFaultOn=true,faultIndex=1,faultMode=faultTrigger.faultRecord.variableFaults.integerFaultMode[1])),
          speedSensor(
externalBooleanFault =                 FaultTriggering.Utilities.Types.Variable_Fault_Boolean(
            externalFaultOn=true,faultIndex=1,faultMode=faultTrigger.faultRecord.variableFaults.booleanFaultMode[1]))));
inner FaultTriggerController faultTrigger
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
    annotation (experiment(StopTime=10, Interval=0.001));
end ActuatorWrapper;

model FaultTriggerController
extends FaultTriggering.FaultOutput.Partial_FaultTrigger(realFaultSize = 1,integerFaultSize = 1,booleanFaultSize = 2);
parameter FaultRecord faultRecord;
  protected
ActuatorPackage.Interfaces.Faults faults
      annotation (Placement(transformation(extent={{84,-20},{124,20}})));
  public
    Modelica.Blocks.Sources.BooleanStep motorSpeedSensor(startTime=0.6)
      annotation (Placement(transformation(extent={{-40,-24},{-20,-4}})));
    Modelica.Blocks.Sources.BooleanStep drivelineBearing(startTime=0.8)
      annotation (Placement(transformation(extent={{-40,-54},{-20,-34}})));
    Modelica.Blocks.Sources.IntegerStep motorKtFailure(startTime=0.2, offset=1)
      annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
    Modelica.Blocks.Sources.Step drivelineFriction(startTime=0.4)
      annotation (Placement(transformation(extent={{-40,8},{-20,28}})));
equation
realFault[1] = faults.driveline.friction.externalRealFault;
integerFault[1] = faults.motor.ktFault.externalIntegerFault;
booleanFault[1] = faults.motor.speedSensor.externalBooleanFault;
booleanFault[2] = faults.driveline.bearing.fault.externalBooleanFault;
    connect(motorKtFailure.y, faults.motor.ktFault.externalIntegerFault)
      annotation (Line(
        points={{-19,50},{40,50},{40,0.1},{104.1,0.1}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(motorSpeedSensor.y, faults.motor.speedSensor.externalBooleanFault)
      annotation (Line(
        points={{-19,-14},{40,-14},{40,0.1},{104.1,0.1}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(drivelineFriction.y, faults.driveline.friction.externalRealFault)
      annotation (Line(
        points={{-19,18},{40,18},{40,0.1},{104.1,0.1}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(drivelineBearing.y, faults.driveline.bearing.fault.externalBooleanFault)
      annotation (Line(
        points={{-19,-44},{40,-44},{40,0.1},{104.1,0.1}},
        color={255,0,255},
        smooth=Smooth.None));
annotation (defaultComponentPrefixes="inner",defaultComponentName="faultTrigger",Diagram(graphics));
end FaultTriggerController;

record FaultRecord "Predefined Fault record"
extends FaultTriggering.Utilities.Records.Faults(
  parameterFaults = FaultTriggering.Utilities.Records.Parameter_Faults(
    realFaults=  {FaultTriggering.Utilities.Records.RealFaults(
      name=  "",
      path=  "")},
    realValue=  fill(0,0),
    integerFaults=  {FaultTriggering.Utilities.Records.IntegerFaults(
      name=  "",
      path=  "")},
    integerValue=  fill(0,0),
    booleanFaults=  {FaultTriggering.Utilities.Records.BooleanFaults(
      name=  "FaultTriggering.Utilities.Types.Parameter_Fault_Boolean",
      path=  "FaultTriggering.Examples.ActuatorExample.Actuator.driveline.disconnect.constBooleanFault"),
    FaultTriggering.Utilities.Records.BooleanFaults(
      name=  "FaultTriggering.Utilities.Types.Parameter_Fault_Boolean",
      path=  "FaultTriggering.Examples.ActuatorExample.Actuator.driveline.speedSensor.constBooleanFault")},
    booleanValue=  {false, false}),
  variableFaults = FaultTriggering.Utilities.Records.Variable_Faults(
    realFaults=  {FaultTriggering.Utilities.Records.RealFaults(
      name=  "FaultTriggering.Utilities.Types.Variable_Fault_Real",
      path=  "FaultTriggering.Examples.ActuatorExample.Actuator.driveline.friction.externalRealFault")},
    realFaultSelect=  {1},
    realFaultMode=  {1},
    realFaultDefault=  {0},
    integerFaults=  {FaultTriggering.Utilities.Records.IntegerFaults(
      name=  "FaultTriggering.Utilities.Types.Variable_Fault_Integer",
      path=  "FaultTriggering.Examples.ActuatorExample.Actuator.motor.ktFault.externalIntegerFault")},
    integerFaultSelect=  {1},
    integerFaultMode=  {1},
    integerFaultDefault=  {1},
    booleanFaults=  {FaultTriggering.Utilities.Records.BooleanFaults(
      name=  "FaultTriggering.Utilities.Types.Variable_Fault_Boolean",
      path=  "FaultTriggering.Examples.ActuatorExample.Actuator.motor.speedSensor.externalBooleanFault"),
    FaultTriggering.Utilities.Records.BooleanFaults(
      name=  "FaultTriggering.Utilities.Types.Variable_Fault_Boolean",
      path=  "FaultTriggering.Examples.ActuatorExample.Actuator.driveline.bearing.fault.externalBooleanFault")},
  booleanFaultSelect=  {1, 2},
    booleanFaultMode=  {1, 1},
    booleanFaultDefault=  {false, false}));
end FaultRecord;

connector FaultsInput = input ActuatorPackage.Interfaces.Faults
    "'input Faults' as connector"                                                              annotation (Icon(graphics={Rectangle(extent={{-8,4},{10,0}},lineColor={255,0,0},
            lineThickness =                                                                                                    0.5)}));
package Interfaces
extends FaultTriggering.Utilities.Icons.InterfacesPackage;
connector Faults
extends FaultTriggering.Utilities.Icons.FaultBus;
ActuatorPackage.Interfaces.driveline driveline annotation ();
ActuatorPackage.Interfaces.motor motor annotation ();
end Faults;

connector driveline
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackage.Interfaces.friction friction;
ActuatorPackage.Interfaces.bearing bearing;
end driveline;

connector friction
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackage.Interfaces.externalRealFault externalRealFault;
end friction;

connector externalRealFault = input Real "Real variable Fault";
connector motor
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackage.Interfaces.ktFault ktFault;
ActuatorPackage.Interfaces.speedSensor speedSensor;
end motor;

connector ktFault
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackage.Interfaces.externalIntegerFault externalIntegerFault;
end ktFault;

connector externalIntegerFault = input Integer "Integer variable Fault";
connector speedSensor
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackage.Interfaces.externalBooleanFault externalBooleanFault;
end speedSensor;

connector externalBooleanFault = input Boolean "Boolean variable Fault";
connector bearing
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackage.Interfaces.fault fault;
end bearing;

connector fault
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackage.Interfaces.externalBooleanFault externalBooleanFault;
end fault;
end Interfaces;
  annotation ();
end ActuatorPackage;
