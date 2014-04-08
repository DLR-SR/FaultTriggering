within FaultTriggering.Utilities.Internal.Records;
function RealVector2str
  input Real x[:];
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
      y := y + Real2str(x[i])
         + comma;
    end for;
    y := y + "}";
  else
    y := "fill(0,0)";
  end if;
end RealVector2str;
