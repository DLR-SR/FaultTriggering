within FaultTriggering.Utilities.Internal.Records;
function Real2str
  input Real x;
  output String y;
protected
  Integer i;
  Integer i0;
  String char;
  Boolean ok;
algorithm
  y := OutputHandling.FormatReal(x, 16);
  ok := true;
  i := 1;
  while ok loop
    if OutputHandling.char(y, i) == " " then
      y := OutputHandling.substituteChar(
                  y,
                  i,
                  "");
    else
      i := i + 1;
    end if;
    if Modelica.Utilities.Strings.length(y) < i then
      ok := false;
    end if;
  end while;
end Real2str;
