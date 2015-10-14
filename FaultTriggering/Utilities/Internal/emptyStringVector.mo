within FaultTriggering.Utilities.Internal;
function emptyStringVector "empties a string vector"
  input String[:] stringIn "input string";
  output String[size(stringIn,1)] stringOut "output string";

algorithm
// nothing is needed since only a new vector of the same size is preallocated.

  annotation (Documentation(info="<html>
<p>Function which empies a string vector.</p>
</html>"));
end emptyStringVector;
