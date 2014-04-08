within FaultTriggering.Utilities.Internal.Records;
function BooleanVector2str
  input Boolean x[:];
  output String y;
protected
  String comma=", ";
algorithm
  if size(x, 1) > 0 then
    y := "{";
    for i in 1:size(x, 1) loop
      if i == size(x, 1) then
        comma := "";
      end if;
      y := y + Boolean2str(x[i])
         + comma;
    end for;
    y := y + "}";
  else
    y := "fill(true,0)";
  end if;
end BooleanVector2str;
