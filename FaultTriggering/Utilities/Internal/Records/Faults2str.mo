within FaultTriggering.Utilities.Internal.Records;
function Faults2str
  input FaultTriggering.Utilities.Records.Faults faults=
      FaultTriggering.Utilities.Records.Faults(parameterFaults=
      FaultTriggering.Utilities.Records.Parameter_Faults(
      realFaults={FaultTriggering.Utilities.Records.RealFaults(name=
        "FaultTriggering.Utilities.Types.Parameter_Fault_Real", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.driveline.realFaultConst.constRealFault")},
      realValue={1},
      integerFaults={FaultTriggering.Utilities.Records.IntegerFaults(name=
        "FaultTriggering.Utilities.Types.Parameter_Fault_Integer", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.driveline.integerFaultConst.constIntegerFault")},
      integerValue={1},
      booleanFaults={FaultTriggering.Utilities.Records.BooleanFaults(name=
        "FaultTriggering.Utilities.Types.Parameter_Fault_Boolean", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.driveline.disconnect.constBooleanFault"),
        FaultTriggering.Utilities.Records.BooleanFaults(name=
        "FaultTriggering.Utilities.Types.Parameter_Fault_Boolean", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.driveline.constantBooleanFault.constBooleanFault")},
      booleanValue={true,false}), variableFaults=
      FaultTriggering.Utilities.Records.Variable_Faults(
      realFaults={FaultTriggering.Utilities.Records.RealFaults(name=
        "FaultTriggering.Utilities.Types.Variable_Fault_Real", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.driveline.friction.externalRealFault")},
      realFaultSelect={1},
      realFaultMode={1},
      realFaultDefault=  {0.0},
      integerFaults={FaultTriggering.Utilities.Records.IntegerFaults(name=
        "FaultTriggering.Utilities.Types.Variable_Fault_Integer", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.motor.ktFault.externalIntegerFault")},
      integerFaultSelect={1},
      integerFaultMode={1},
      integerFaultDefault=  {1},
      booleanFaults={FaultTriggering.Utilities.Records.BooleanFaults(name=
        "FaultTriggering.Utilities.Types.Variable_Fault_Boolean", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.loadSpeedSensor.externalBooleanFault"),
        FaultTriggering.Utilities.Records.BooleanFaults(name=
        "FaultTriggering.Utilities.Types.Variable_Fault_Boolean", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.motor.speedSensor.externalBooleanFault"),
        FaultTriggering.Utilities.Records.BooleanFaults(name=
        "FaultTriggering.Utilities.Types.Variable_Fault_Boolean", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.driveline.speedSensor.externalBooleanFault"),
        FaultTriggering.Utilities.Records.BooleanFaults(name=
        "FaultTriggering.Utilities.Types.Variable_Fault_Boolean", path=
        "FaultTriggering.Examples.ActuatorExample.ActuatorFaultBus.driveline.bearing.fault.externalBooleanFault")},
      booleanFaultSelect={1,2,3,4},
      booleanFaultMode={1,1,1,1},
      booleanFaultDefault={true,true,false,false}));
  input String comma=",";
  input Integer level=0;
  output String y[:];
algorithm
  y := cat(
    1,
    y,
    {Indention(level) + "FaultTriggering.Utilities.Records.Faults("});

// ---------------------------------------------------
// ------------------ Parameter faults --------------
// ---------------------------------------------------

  y := cat(
    1,
    y,
    {Indention(level + 1) + "parameterFaults = FaultTriggering.Utilities.Records.Parameter_Faults("});

// ---------------------------------------------------
// ------------------- Real faults -----------------
// ---------------------------------------------------

// check if fault size is zero
  if size(faults.parameterFaults.realFaults, 1) == 0 then
    y := cat(
      1,
      y,
      {Indention(level + 2) + "realFaults = {FaultTriggering.Utilities.Records.RealFaults("});
    y := cat(
      1,
      y,
      {Indention(level + 3) + "name = \"\","});
    y := cat(
      1,
      y,
      {Indention(level + 3) + "path = \"\""});
    y := cat(
      1,
      y,
      {Indention(level + 2) + ")},"});
  else
      // loop over array size
    for i in 1:size(faults.parameterFaults.realFaults, 1) loop
      if i == 1 then
                   // defines only the first time the name
        y := cat(
          1,
          y,
          {Indention(level + 2) + "realFaults = {FaultTriggering.Utilities.Records.RealFaults("});
      else
        y := cat(
          1,
          y,
          {Indention(level + 2) + "FaultTriggering.Utilities.Records.RealFaults("});
      end if;
      y := cat(
        1,
        y,
        {Indention(level + 3) + "name = \"" + faults.parameterFaults.realFaults[
          i].name + "\","});
      y := cat(
        1,
        y,
        {Indention(level + 3) + "path = \"" + faults.parameterFaults.realFaults[
          i].path + "\""});
      if not (i == size(faults.parameterFaults.realFaults, 1)) then
                                                                        // adds comma or closes the array
        y := cat(
          1,
          y,
          {Indention(level + 2) + "),"});
      else
        y := cat(
          1,
          y,
          {Indention(level + 2) + ")},"});
      end if;
    end for;
  end if;
// add values
  y := cat(
    1,
    y,
    {Indention(level + 2) + "realValue = " + RealVector2str(faults.parameterFaults.realValue)
       + ","});

// ---------------------------------------------------
// ------------------- Integer faults --------------
// ---------------------------------------------------
// check if fault size is zero
  if size(faults.parameterFaults.integerFaults, 1) == 0 then
    y := cat(
      1,
      y,
      {Indention(level + 2) + "integerFaults = {FaultTriggering.Utilities.Records.IntegerFaults("});
    y := cat(
      1,
      y,
      {Indention(level + 3) + "name = \"\","});
    y := cat(
      1,
      y,
      {Indention(level + 3) + "path = \"\""});
    y := cat(
      1,
      y,
      {Indention(level + 2) + ")},"});
  else
      // loop over array size
    for i in 1:size(faults.parameterFaults.integerFaults, 1) loop
      if i == 1 then
                   // defines only the first time the name
        y := cat(
          1,
          y,
          {Indention(level + 2) + "integerFaults = {FaultTriggering.Utilities.Records.IntegerFaults("});
      else
        y := cat(
          1,
          y,
          {Indention(level + 2) + "FaultTriggering.Utilities.Records.IntegerFaults("});
      end if;
      y := cat(
        1,
        y,
        {Indention(level + 3) + "name = \"" + faults.parameterFaults.integerFaults[
          i].name + "\","});
      y := cat(
        1,
        y,
        {Indention(level + 3) + "path = \"" + faults.parameterFaults.integerFaults[
          i].path + "\""});
      if not (i == size(faults.parameterFaults.integerFaults, 1)) then
                                                                           // adds comma or closes the array
        y := cat(
          1,
          y,
          {Indention(level + 2) + "),"});
      else
        y := cat(
          1,
          y,
          {Indention(level + 2) + ")},"});
      end if;

    end for;
  end if;
// add values
  y := cat(
    1,
    y,
    {Indention(level + 2) + "integerValue = " + RealVector2str(faults.parameterFaults.integerValue)
       + ","});

  // ---------------------------------------------------
  // ------------------- Boolean faults --------------
  // ---------------------------------------------------
// check if fault size is zero
  if size(faults.parameterFaults.booleanFaults, 1) == 0 then
    y := cat(
      1,
      y,
      {Indention(level + 2) + "booleanFaults = {FaultTriggering.Utilities.Records.BooleanFaults("});
    y := cat(
      1,
      y,
      {Indention(level + 3) + "name = \"\","});
    y := cat(
      1,
      y,
      {Indention(level + 3) + "path = \"\""});
    y := cat(
      1,
      y,
      {Indention(level + 2) + ")},"});
  else
      // loop over array size
    for i in 1:size(faults.parameterFaults.booleanFaults, 1) loop
      if i == 1 then // defines only the first time the name
        y := cat(
          1,
          y,
          {Indention(level + 2) + "booleanFaults = {FaultTriggering.Utilities.Records.BooleanFaults("});
      else
        y := cat(
          1,
          y,
          {Indention(level + 2) + "FaultTriggering.Utilities.Records.BooleanFaults("});
      end if;
      y := cat(
        1,
        y,
        {Indention(level + 3) + "name = \"" + faults.parameterFaults.booleanFaults[
          i].name + "\","});
      y := cat(
        1,
        y,
        {Indention(level + 3) + "path = \"" + faults.parameterFaults.booleanFaults[
          i].path + "\""});
      if not (i == size(faults.parameterFaults.booleanFaults, 1)) then // adds comma or closes the array
        y := cat(
          1,
          y,
          {Indention(level + 2) + "),"});
      else
        y := cat(
          1,
          y,
          {Indention(level + 2) + ")},"});
      end if;

    end for;
  end if;
   // add values
  y := cat(
    1,
    y,
    {Indention(level + 2) + "booleanValue = " + BooleanVector2str(faults.parameterFaults.booleanValue)});

  // close parameter faults
  y := cat(
    1,
    y,
    {Indention(level + 1) + "),"});

 // ---------------------------------------------------
 // ------------------ Variable faults --------------
 // ---------------------------------------------------

  y := cat(
    1,
    y,
    {Indention(level + 1) + "variableFaults = FaultTriggering.Utilities.Records.Variable_Faults("});

 // ---------------------------------------------------
 // ------------------- Real faults -----------------
 // ---------------------------------------------------
  if size(faults.variableFaults.realFaults, 1) == 0 then
    y := cat(
      1,
      y,
      {Indention(level + 2) + "realFaults = {FaultTriggering.Utilities.Records.RealFaults("});
    y := cat(
      1,
      y,
      {Indention(level + 3) + "name = \"\","});
    y := cat(
      1,
      y,
      {Indention(level + 3) + "path = \"\""});
    y := cat(
      1,
      y,
      {Indention(level + 2) + ")},"});
  else
   // loop over array size
    for i in 1:size(faults.variableFaults.realFaults, 1) loop
      if i == 1 then// defines only the first time the name
        y := cat(
          1,
          y,
          {Indention(level + 2) + "realFaults = {FaultTriggering.Utilities.Records.RealFaults("});
      else
        y := cat(
          1,
          y,
          {Indention(level + 2) + "FaultTriggering.Utilities.Records.RealFaults("});
      end if;
      y := cat(
        1,
        y,
        {Indention(level + 3) + "name = \"" + faults.variableFaults.realFaults[
          i].name + "\","});
      y := cat(
        1,
        y,
        {Indention(level + 3) + "path = \"" + faults.variableFaults.realFaults[
          i].path + "\""});
      if not (i == size(faults.variableFaults.realFaults, 1)) then// adds comma or closes the array
        y := cat(
          1,
          y,
          {Indention(level + 2) + "),"});
      else
        y := cat(
          1,
          y,
          {Indention(level + 2) + ")},"});
      end if;

    end for;
  end if;
 // add values
  y := cat(
    1,
    y,
    {Indention(level + 2) + "realFaultSelect = " + RealVector2str(faults.variableFaults.realFaultSelect)
       + ","});
  y := cat(
    1,
    y,
    {Indention(level + 2) + "realFaultMode = " + RealVector2str(faults.variableFaults.realFaultMode)
       + ","});
  y := cat(
    1,
    y,
    {Indention(level + 2) + "realFaultDefault = " + RealVector2str(faults.variableFaults.realFaultDefault)
       + ","});

  // ---------------------------------------------------
  // ------------------- Integer faults --------------
  // ---------------------------------------------------
  if size(faults.variableFaults.integerFaults, 1) == 0 then
    y := cat(
      1,
      y,
      {Indention(level + 2) + "integerFaults = {FaultTriggering.Utilities.Records.IntegerFaults("});
    y := cat(
      1,
      y,
      {Indention(level + 3) + "name = \"\","});
    y := cat(
      1,
      y,
      {Indention(level + 3) + "path = \"\""});
    y := cat(
      1,
      y,
      {Indention(level + 2) + ")},"});
  else
    // loop over array size
    for i in 1:size(faults.variableFaults.integerFaults, 1) loop
      if i == 1 then // defines only the first time the name
        y := cat(
          1,
          y,
          {Indention(level + 2) + "integerFaults = {FaultTriggering.Utilities.Records.IntegerFaults("});
      else
        y := cat(
          1,
          y,
          {Indention(level + 2) + "FaultTriggering.Utilities.Records.IntegerFaults("});
      end if;
      y := cat(
        1,
        y,
        {Indention(level + 3) + "name = \"" + faults.variableFaults.integerFaults[
          i].name + "\","});
      y := cat(
        1,
        y,
        {Indention(level + 3) + "path = \"" + faults.variableFaults.integerFaults[
          i].path + "\""});
      if not (i == size(faults.variableFaults.integerFaults, 1)) then // adds comma or closes the array
        y := cat(
          1,
          y,
          {Indention(level + 2) + "),"});
      else
        y := cat(
          1,
          y,
          {Indention(level + 2) + ")},"});
      end if;

    end for;
  end if;
  // add values
  y := cat(
    1,
    y,
    {Indention(level + 2) + "integerFaultSelect = " + RealVector2str(faults.variableFaults.integerFaultSelect)
       + ","});
  y := cat(
    1,
    y,
    {Indention(level + 2) + "integerFaultMode = " + RealVector2str(faults.variableFaults.integerFaultMode)
       + ","});
  y := cat(
    1,
    y,
    {Indention(level + 2) + "integerFaultDefault = " + RealVector2str(faults.variableFaults.integerFaultDefault)
       + ","});

  // ---------------------------------------------------
  // ------------------- Boolean faults --------------
  // ---------------------------------------------------
// check if fault size is zero
  if size(faults.variableFaults.booleanFaults, 1) == 0 then
    y := cat(
      1,
      y,
      {Indention(level + 2) + "booleanFaults = {FaultTriggering.Utilities.Records.BooleanFaults("});
    y := cat(
      1,
      y,
      {Indention(level + 3) + "name = \"\","});
    y := cat(
      1,
      y,
      {Indention(level + 3) + "path = \"\""});
    y := cat(
      1,
      y,
      {Indention(level + 2) + ")},"});
  else
    // loop over array size
    for i in 1:size(faults.variableFaults.booleanFaults, 1) loop
      if i == 1 then // defines only the first time the name
        y := cat(
          1,
          y,
          {Indention(level + 2) + "booleanFaults = {FaultTriggering.Utilities.Records.BooleanFaults("});
      else
        y := cat(
          1,
          y,
          {Indention(level + 2) + "FaultTriggering.Utilities.Records.BooleanFaults("});
      end if;
      y := cat(
        1,
        y,
        {Indention(level + 3) + "name = \"" + faults.variableFaults.booleanFaults[
          i].name + "\","});
      y := cat(
        1,
        y,
        {Indention(level + 3) + "path = \"" + faults.variableFaults.booleanFaults[
          i].path + "\""});
      if not (i == size(faults.variableFaults.booleanFaults, 1)) then // adds comma or closes the array
        y := cat(
          1,
          y,
          {Indention(level + 2) + "),"});
      else
        y := cat(
          1,
          y,
          {Indention(level + 2) + ")},"});
      end if;

    end for;
  end if;
  // add values
  y := cat(
    1,
    y,
    {Indention(level + 1) + "booleanFaultSelect = " + RealVector2str(faults.variableFaults.booleanFaultSelect)
       + ","});
  y := cat(
    1,
    y,
    {Indention(level + 2) + "booleanFaultMode = " + RealVector2str(faults.variableFaults.booleanFaultMode)
       + ","});
  y := cat(
    1,
    y,
    {Indention(level + 2) + "booleanFaultDefault = " + BooleanVector2str(faults.variableFaults.booleanFaultDefault)});

 // close variable faults
  y := cat(
    1,
    y,
    {Indention(level + 1) + ")"});

// close record
  y := cat(
    1,
    y,
    {Indention(level) + ")"});

end Faults2str;
