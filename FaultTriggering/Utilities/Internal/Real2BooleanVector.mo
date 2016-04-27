within FaultTriggering.Utilities.Internal;
function Real2BooleanVector "converts a real to a boolean"
  input Real x[:] "input";
  input Real t=0.5 "threshold";
  output Boolean y[size(x,1)] "output";

algorithm
  if size(x, 1) > 0 then
    for i in 1:size(x, 1) loop
      y[i] :=x[i] >= t;
    end for;
  else
    y := fill(true,0);
  end if;
end Real2BooleanVector;
