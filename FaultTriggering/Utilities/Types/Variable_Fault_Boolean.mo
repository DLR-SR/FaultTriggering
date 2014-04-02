within FaultTriggering.Utilities.Types;
record Variable_Fault_Boolean "External Fault Triggering parameters"
  Boolean externalFaultOn=false "External fault controlling (true = global)" annotation (Dialog);
  Integer faultIndex = 1 "External fault index" annotation (Dialog(tab = "Advanced"));
  Integer faultMode = 1 "Optional fault mode for model reconfiguration";
  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={255,0,255},
          textStyle={TextStyle.Bold,TextStyle.Italic},
      textString="B")}), Documentation(revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2014, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end Variable_Fault_Boolean;
