within FaultTriggering.Utilities.Internal;
function checkInString "checks if stringIn exists in stringVector"

  input String    stringIn "input string";
  input String[:] stringVector "input string";
  output Boolean isFound=false "true if the string is found in the vector";

protected
  Integer loopNr "loop counter";
algorithm

for loopNr in 1: size(stringVector,1) loop
  if Strings.compare(stringIn,stringVector[loopNr])==Modelica.Utilities.Types.Compare.Equal then
    isFound := true;
    break; // break from loop is string is found
  end if;
end for;

  annotation (Documentation(info="<html>
<p>Function which checks if stringIn exists in stringVector</p>
</html>"));
end checkInString;
