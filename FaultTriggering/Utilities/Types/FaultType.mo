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
      textString="B")}));
