within FaultTriggering.Utilities.Records;
record RealFaults "Name and property of the Real Value"
  String name="" "Full name of model parameter";
  String path="" "Component Name";
  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold,TextStyle.Italic},
      textString="R")}));
end RealFaults;
