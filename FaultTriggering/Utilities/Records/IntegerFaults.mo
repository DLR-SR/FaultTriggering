within FaultTriggering.Utilities.Records;
record IntegerFaults "Name and property of the Integer Value"
  String name="" "Full name of model parameter";
  String path="" "Component Name";
  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={255,170,0},
          textStyle={TextStyle.Bold,TextStyle.Italic},
      textString="I")}));
end IntegerFaults;
