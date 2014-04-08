within FaultTriggering.Utilities.Internal.Records;
function StringVector2str
  input String x[:];
  input String comma=",";
  input Integer level=0;
  output String y[:];
protected
  String comma3=",";
  String line;
algorithm
  if size(x, 1) > 0 then
    line := Indention(level)
       + "{";
    y := cat(   1,
                y,
                {line});
    for i in 1:size(x, 1) loop
      if i == size(x, 1) then
        comma3 := "";
      end if;
      line := Indention(level
         + 1) + "\"" + x[i] + "\"" + comma3;
      y := cat(   1,
                  y,
                  {line});
    end for;
    y := cat(
        1,
        y,
        {Indention(level) +
        "}" + comma});
  else
    y := cat(
        1,
        y,
        {Indention(level) +
        "fill(\"\",0)" + comma});
  end if;
end StringVector2str;
