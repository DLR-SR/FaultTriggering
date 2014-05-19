within FaultTriggering.Utilities.Internal;
function readToLastDot "reads string before last dot"
input String  inputString="a.b.c" "string input";
output String beforeDot "part before last dot";
output Boolean dotFound "true if no dot is found";

protected
  Integer dotIndex "index of first dot";
algorithm
  dotIndex := Strings.findLast(inputString, ".");
  if dotIndex <> 0 then
         beforeDot := Strings.substring(
         inputString,
         1,
         dotIndex-1);
    dotFound := true;
  else
    beforeDot := inputString;
    dotFound  := false;
  end if;

  annotation (Documentation(info="<html>
<p>This fuction reads the string after the last dot. Helpfull for model names</p>
</html>"));
end readToLastDot;
