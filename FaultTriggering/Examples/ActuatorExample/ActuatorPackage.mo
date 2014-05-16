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
            externalFaultOn=true,faultIndex=1,faultMode=1)),
        bearing(fault(
externalBooleanFault =                       FaultTriggering.Utilities.Types.Variable_Fault_Boolean(
            externalFaultOn=true,faultIndex=2,faultMode=1)))), motor(ktFault(
externalIntegerFault =             FaultTriggering.Utilities.Types.Variable_Fault_Integer(
            externalFaultOn=true,faultIndex=1,faultMode=1)), speedSensor(
externalBooleanFault =                 FaultTriggering.Utilities.Types.Variable_Fault_Boolean(
            externalFaultOn=true,faultIndex=1,faultMode=1))));
inner FaultTriggerController faultTrigger
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
    annotation (Documentation(revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2014, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end ActuatorWrapper;

model FaultTriggerController
extends FaultTriggering.FaultOutput.Partial_FaultTrigger(realFaultSize = 1,integerFaultSize = 1,booleanFaultSize = 2);
parameter FaultRecord faultRecord;
  protected
ActuatorPackage.Interfaces.Faults faults
      annotation (Placement(transformation(extent={{84,-20},{124,20}})));
  public
    Modelica.Blocks.Sources.BooleanStep motorSpeedSensor(startTime=0.6)
      annotation (Placement(transformation(extent={{-8,-26},{12,-6}})));
    Modelica.Blocks.Sources.BooleanStep drivelineBearing(startTime=0.8)
      annotation (Placement(transformation(extent={{-8,-56},{12,-36}})));
    Modelica.Blocks.Sources.IntegerStep motorKtFailure(startTime=0.2)
      annotation (Placement(transformation(extent={{-10,38},{10,58}})));
    Modelica.Blocks.Sources.Step drivelineFriction(startTime=0.4)
      annotation (Placement(transformation(extent={{-10,6},{10,26}})));
equation
realFault[1] = faults.driveline.friction.externalRealFault;
integerFault[1] = faults.motor.ktFault.externalIntegerFault;
booleanFault[1] = faults.motor.speedSensor.externalBooleanFault;
booleanFault[2] = faults.driveline.bearing.fault.externalBooleanFault;
    connect(motorKtFailure.y, faults.motor.ktFault.externalIntegerFault)
      annotation (Line(
        points={{11,48},{80,48},{80,0},{104,0}},
        color={255,127,0},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(drivelineFriction.y, faults.driveline.friction.externalRealFault)
      annotation (Line(
        points={{11,16},{80,16},{80,0},{104,0}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(motorSpeedSensor.y, faults.motor.speedSensor.externalBooleanFault)
      annotation (Line(
        points={{13,-16},{80,-16},{80,0},{104,0}},
        color={255,0,255},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(drivelineBearing.y, faults.driveline.bearing.fault.externalBooleanFault)
      annotation (Line(
        points={{13,-46},{80,-46},{80,0},{104,0}},
        color={255,0,255},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
annotation (defaultComponentPrefixes="inner",defaultComponentName="faultTrigger",      Documentation(revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2014, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
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
    integerFaults=  {FaultTriggering.Utilities.Records.IntegerFaults(
      name=  "FaultTriggering.Utilities.Types.Variable_Fault_Integer",
      path=  "FaultTriggering.Examples.ActuatorExample.Actuator.motor.ktFault.externalIntegerFault")},
    integerFaultSelect=  {1},
    integerFaultMode=  {1},
    booleanFaults=  {FaultTriggering.Utilities.Records.BooleanFaults(
      name=  "FaultTriggering.Utilities.Types.Variable_Fault_Boolean",
      path=  "FaultTriggering.Examples.ActuatorExample.Actuator.motor.speedSensor.externalBooleanFault"),
    FaultTriggering.Utilities.Records.BooleanFaults(
      name=  "FaultTriggering.Utilities.Types.Variable_Fault_Boolean",
      path=  "FaultTriggering.Examples.ActuatorExample.Actuator.driveline.bearing.fault.externalBooleanFault")},
  booleanFaultSelect=  {1, 2},
    booleanFaultMode=  {1, 1}));
    annotation (Documentation(revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2014, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end FaultRecord;

expandable connector FaultsInput = input ActuatorPackage.Interfaces.Faults
    "'input Faults' as connector"                                                                         annotation (Icon(graphics={Rectangle(extent={{-8,4},{10,0}},lineColor={255,0,0},
            lineThickness=                                                                                                    0.5)}),
      Documentation(revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2014, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
package Interfaces
extends FaultTriggering.Utilities.Icons.InterfacesPackage;
expandable connector Faults
extends FaultTriggering.Utilities.Icons.FaultBus;
ActuatorPackage.Interfaces.driveline driveline;
ActuatorPackage.Interfaces.motor motor;
end Faults;

expandable connector driveline
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackage.Interfaces.friction friction;
ActuatorPackage.Interfaces.bearing bearing;
end driveline;

expandable connector friction
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackage.Interfaces.externalRealFault externalRealFault;
end friction;

type externalRealFault = Real "Real parameter Fault";
expandable connector motor
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackage.Interfaces.ktFault ktFault;
ActuatorPackage.Interfaces.speedSensor speedSensor;
end motor;

expandable connector ktFault
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackage.Interfaces.externalIntegerFault externalIntegerFault;
end ktFault;

type externalIntegerFault = Integer "Integer parameter Fault";
expandable connector speedSensor
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackage.Interfaces.externalBooleanFault externalBooleanFault;
end speedSensor;

type externalBooleanFault = Boolean "Boolean parameter Fault";
expandable connector bearing
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackage.Interfaces.fault fault;
end bearing;

expandable connector fault
extends FaultTriggering.Utilities.Icons.FaultSubBus;
ActuatorPackage.Interfaces.externalBooleanFault externalBooleanFault;
end fault;
end Interfaces;
  annotation (Documentation(revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2014, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end ActuatorPackage;
