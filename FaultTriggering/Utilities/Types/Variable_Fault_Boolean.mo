within FaultTriggering.Utilities.Types;
record Variable_Fault_Boolean "External Fault Triggering parameters"
  Boolean externalFaultOn=false "External fault controlling (true = global)" annotation (Dialog);
  Integer faultIndex = 1 "External fault index" annotation (Dialog(tab = "Advanced"));
  Integer faultMode = 1 "Optional fault mode for model reconfiguration";
  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={255,0,255},
          textStyle={TextStyle.Bold,TextStyle.Italic},
      textString="B")}));
end Variable_Fault_Boolean;
