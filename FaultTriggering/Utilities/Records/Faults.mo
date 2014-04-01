within FaultTriggering.Utilities.Records;
record Faults "Fault information"
//  CaseDefinition Definition[:] annotation (Dialog(label="Name / Active"));

// ------- --------------------------------------------
// ------- Parameter Faults -------------------------
// ------- --------------------------------------------

parameter FaultTriggering.Utilities.Records.Parameter_Faults parameterFaults;

// ------- --------------------------------------------
// ------- Vairable Faults -------------------------
// ------- --------------------------------------------

parameter FaultTriggering.Utilities.Records.Variable_Faults variableFaults;

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
          textString="%name")}));

end Faults;
