within FaultTriggering.Utilities.Internal.Records;
function Indention
  input Integer level=0;
  output String space;
protected
  Integer blanksPerLevel=2;
algorithm
  space := Modelica.Utilities.Strings.repeat(level*blanksPerLevel, " ");
end Indention;
