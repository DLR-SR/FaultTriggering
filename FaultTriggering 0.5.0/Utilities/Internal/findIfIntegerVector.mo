within FaultTriggering.Utilities.Internal;
function findIfIntegerVector
  "returns true if comparewith is found somewhere in inputVector"
  input Integer[:] inputVector={6,1,2,3,4,5};
  input Integer compareWith=2;
  output Boolean isFound;

protected
  Integer dummyI[:];
algorithm

  (dummyI,isFound) := FaultTriggering.Utilities.Internal.findInIntegerVector(
    inputVector, compareWith);

  annotation (Documentation(info="<html>
<p>Fuction which returns true if comparewith is found somewhere in inputVector</p>
</html>"));
end findIfIntegerVector;
