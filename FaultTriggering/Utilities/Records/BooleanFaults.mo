within FaultTriggering.Utilities.Records;
record BooleanFaults "Name and property of the Boolean Value"
  String name="" "Full name of model parameter";
  String path="" "ComponentName";
  annotation (Icon(graphics={Text(
          extent={{-100,100},{100,-100}},
          lineColor={255,0,255},
          textStyle={TextStyle.Bold,TextStyle.Italic},
      textString="B")}));
end BooleanFaults;
