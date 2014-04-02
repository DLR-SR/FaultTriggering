within FaultTriggering.Utilities.Types;
type FaultType = enumeration(
    realPar,
    intPar,
    boolPar,
    realVar,
    intVar,
    boolVar) annotation (Icon(graphics={
                             Text(
          extent={{-110,80},{30,-60}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold,TextStyle.Italic},
      textString="R"),       Text(
          extent={{-120,30},{20,-110}},
          lineColor={255,128,0},
          textStyle={TextStyle.Bold,TextStyle.Italic},
      textString="I"),       Text(
          extent={{-54,28},{86,-112}},
          lineColor={255,0,255},
          textStyle={TextStyle.Bold,TextStyle.Italic},
      textString="B")}), Documentation(revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2014, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
