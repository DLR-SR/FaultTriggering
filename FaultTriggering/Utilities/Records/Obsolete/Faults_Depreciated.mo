within FaultTriggering.Utilities.Records.Obsolete;
record Faults_Depreciated "Fault information"
  extends Modelica.Icons.ObsoleteModel;
//  CaseDefinition Definition[:] annotation (Dialog(label="Name / Active"));

// ------- --------------------------------------------
// ------- Parameter Faults -------------------------
// ------- --------------------------------------------

parameter FaultTriggering.Utilities.Records.Parameter_Faults parameterFaults;

// ------- --------------------------------------------
// ------- Variable Faults -------------------------
// ------- --------------------------------------------

  parameter
    FaultTriggering.Utilities.Records.Obsolete.Variable_Faults_Depreciated
    variableFaults;

  annotation (Icon(graphics={Polygon(
          points={{70,90},{-22,10},{0,-10},{-70,-90},{30,-10},{10,10},{70,90}},
          smooth=Smooth.None,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          lineThickness=0.5,
          pattern=LinePattern.None),
                              Text(
          extent={{-150,150},{150,110}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          textString="%name")}), Documentation(revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2015, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>",
        info="<html>
<p>Legacy version of the Fault Record without default variable values.</p>
</html>"));

end Faults_Depreciated;
