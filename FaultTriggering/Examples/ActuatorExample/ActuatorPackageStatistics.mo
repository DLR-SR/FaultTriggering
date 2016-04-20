within FaultTriggering.Examples.ActuatorExample;
package ActuatorPackageStatistics
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
end ActuatorWrapper;

model FaultTriggerController
extends FaultTriggering.FaultOutput.Partial_FaultTrigger(realFaultSize = 1,integerFaultSize = 1,booleanFaultSize = 2);
parameter FaultRecord faultRecord;

ActuatorPackageStatistics.Interfaces.Faults faults
    annotation (Placement(transformation(extent={{84,-20},{124,20}})));

    Modelica.Blocks.Sources.IntegerConstant
                                        motorKtFailure(k=1)
      annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
    Modelica.Blocks.Sources.Constant
                                 drivelineFriction(k=0)
      annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  AdvancedNoise.Statistics.FaultTrigger motorSpeedSensor(reset=false)
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Blocks.Sources.Constant failureRateMotorSpeedSensor(k=0.1)
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  AdvancedNoise.Statistics.FaultTrigger drivelineBearing(reset=false)
    annotation (Placement(transformation(extent={{-40,-80},{-20,-60}})));
  Modelica.Blocks.Sources.Constant failureRateDrivelineBearing(k=0.1)
    annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=true)
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
equation
realFault[1] = faults.driveline.friction.externalRealFault;
integerFault[1] = faults.motor.ktFault.externalIntegerFault;
booleanFault[1] = faults.motor.speedSensor.externalBooleanFault;
booleanFault[2] = faults.driveline.bearing.fault.externalBooleanFault;
    connect(motorKtFailure.y, faults.motor.ktFault.externalIntegerFault)
      annotation (Line(
        points={{-19,40},{40,40},{40,0.1},{104.1,0.1}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(drivelineFriction.y, faults.driveline.friction.externalRealFault)
      annotation (Line(
        points={{-19,10},{40,10},{40,0.1},{104.1,0.1}},
        color={0,0,127},
        smooth=Smooth.None));
  connect(failureRateMotorSpeedSensor.y, motorSpeedSensor.u)
    annotation (Line(points={{-59,-30},{-59,-30},{-42,-30}}, color={0,0,127}));
  connect(failureRateDrivelineBearing.y, drivelineBearing.u)
    annotation (Line(points={{-59,-70},{-59,-70},{-42,-70}}, color={0,0,127}));
  connect(motorSpeedSensor.y, faults.motor.speedSensor.externalBooleanFault)
    annotation (Line(points={{-19,-30},{10,-30},{40,-30},{40,0.1},{104.1,0.1}},
        color={255,0,255}));
  connect(drivelineBearing.y, faults.driveline.bearing.fault.externalBooleanFault)
    annotation (Line(points={{-19,-70},{40,-70},{40,0.1},{104.1,0.1}}, color={255,
          0,255}));
annotation (defaultComponentPrefixes="inner",defaultComponentName="faultTrigger",Diagram(graphics));
end FaultTriggerController;

record FaultRecord "Predefined Fault record"
extends FaultTriggering.Utilities.Records.Faults(
  parameterFaults = FaultTriggering.Utilities.Records.Parameter_Faults(
    realFaults = {FaultTriggering.Utilities.Records.RealFaults(
      name = "",
      path = "")},
    realValue = fill(0,0),
    integerFaults = {FaultTriggering.Utilities.Records.IntegerFaults(
      name = "",
      path = "")},
    integerValue = fill(0,0),
    booleanFaults = {FaultTriggering.Utilities.Records.BooleanFaults(
      name = "FaultTriggering.Utilities.Types.Parameter_Fault_Boolean",
      path = "FaultTriggering.Examples.ActuatorExample.Actuator.driveline.disconnect.constBooleanFault"),
    FaultTriggering.Utilities.Records.BooleanFaults(
      name = "FaultTriggering.Utilities.Types.Parameter_Fault_Boolean",
      path = "FaultTriggering.Examples.ActuatorExample.Actuator.driveline.speedSensor.constBooleanFault")},
    booleanValue = {false, false}),
  variableFaults = FaultTriggering.Utilities.Records.Variable_Faults(
    realFaults = {FaultTriggering.Utilities.Records.RealFaults(
      name = "FaultTriggering.Utilities.Types.Variable_Fault_Real",
      path = "FaultTriggering.Examples.ActuatorExample.Actuator.driveline.friction.externalRealFault")},
    realFaultSelect = {1},
    realFaultMode = {1},
    integerFaults = {FaultTriggering.Utilities.Records.IntegerFaults(
      name = "FaultTriggering.Utilities.Types.Variable_Fault_Integer",
      path = "FaultTriggering.Examples.ActuatorExample.Actuator.motor.ktFault.externalIntegerFault")},
    integerFaultSelect = {1},
    integerFaultMode = {1},
    booleanFaults = {FaultTriggering.Utilities.Records.BooleanFaults(
      name = "FaultTriggering.Utilities.Types.Variable_Fault_Boolean",
      path = "FaultTriggering.Examples.ActuatorExample.Actuator.motor.speedSensor.externalBooleanFault"),
    FaultTriggering.Utilities.Records.BooleanFaults(
      name = "FaultTriggering.Utilities.Types.Variable_Fault_Boolean",
      path = "FaultTriggering.Examples.ActuatorExample.Actuator.driveline.bearing.fault.externalBooleanFault")},
  booleanFaultSelect = {1, 2},
    booleanFaultMode = {1, 2}));
end FaultRecord;

connector FaultsInput = input ActuatorPackageStatistics.Interfaces.Faults
    "'input Faults' as connector"                                                              annotation (Icon(graphics={Rectangle(extent={{-8,4},{10,0}},lineColor={255,0,0},
            lineThickness =                                                                                                    0.5)}));
package Interfaces
extends FaultTriggering.Utilities.Icons.InterfacesPackage;
connector Faults
extends FaultTriggering.Utilities.Icons.FaultBus;
ActuatorPackageStatistics.Interfaces.driveline driveline annotation ();
ActuatorPackageStatistics.Interfaces.motor motor annotation ();
end Faults;

connector driveline
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackageStatistics.Interfaces.friction friction;
ActuatorPackageStatistics.Interfaces.bearing bearing;
end driveline;

connector friction
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackageStatistics.Interfaces.externalRealFault externalRealFault;
end friction;

connector externalRealFault = input Real "Real variable Fault";
connector motor
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackageStatistics.Interfaces.ktFault ktFault;
ActuatorPackageStatistics.Interfaces.speedSensor speedSensor;
end motor;

connector ktFault
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackageStatistics.Interfaces.externalIntegerFault externalIntegerFault;
end ktFault;

connector externalIntegerFault = input Integer "Integer variable Fault";
connector speedSensor
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackageStatistics.Interfaces.externalBooleanFault externalBooleanFault;
end speedSensor;

connector externalBooleanFault = input Boolean "Boolean variable Fault";
connector bearing
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackageStatistics.Interfaces.fault fault;
end bearing;

connector fault
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackageStatistics.Interfaces.externalBooleanFault externalBooleanFault;
end fault;
end Interfaces;
  annotation (Documentation(info="<html>
<p>This package shows the use of a stochastical fault in a simulation. For more information, please see the AdvancedNoise Library on <a href=\"https://github.com/DLR-SR/AdvancedNoise\">https://github.com/DLR-SR/AdvancedNoise</a>.</p>
<p><br>Using such simulations can help to trigger stochastical faults during a simulation. Such simulations can be done to see if monitoring algorithms can cope with the different times where the faults are triggered. </p>
</html>"));
end ActuatorPackageStatistics;
