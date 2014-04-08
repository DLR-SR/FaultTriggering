within FaultTriggering.Utilities.Internal;
function findInIntegerVector "finds the integer compareWith in the vector 
  inputVector. Output is a vector with the position of the found indexes 
  and the boolean isFound that shows if the vecor is found at all"
  input Integer[:] inputVector={6,1,2,3,4,5}
    "input Integer vector that is ssearched";
  input Integer compareWith=2 "Integer that is to be found";
  output Integer[:] findIndex
    "Vector with the indices where compareWith is found";
  output Boolean isFound "true if the boolean is found";

protected
  Integer vectorNr "loop counter";
  Integer integerCounter=0 "event counter";
  Integer[size(inputVector, 1)] tempFindIndex "temporary preallocated vector";
algorithm

// loop over vector to find the indeces where inputVector = compareWith
  for vectorNr in 1:size(inputVector, 1) loop
    if compareWith == inputVector[vectorNr] then
      integerCounter := integerCounter + 1;
      tempFindIndex[integerCounter] := vectorNr;
    end if;
  end for;
// create output with proper dimension
  findIndex := tempFindIndex[1:integerCounter];
// set isFound
  if integerCounter <> 0 then
    isFound :=true;
  else
    isFound :=false;
  end if;

  annotation (Documentation(info="<html>
<p>Function which finds the integer compareWith in the vector inputVector. Output is a vector with the position of the found indexes and the boolean isFound that shows if the vecor is found at all</p>
</html>"));
end findInIntegerVector;
