within FaultTriggering.Utilities.Internal;
function readAfterDot "reads string after last dot"
input String  inputString="a.b.c" "string input";
output String afterDot "part after first dot";
output Boolean dotFound "true if no dot is found";

protected
  Integer dotIndex "index of first dot";
algorithm
  dotIndex := Strings.findLast(inputString, ".");
  if dotIndex <> 0 then
   afterDot := Strings.substring(
         inputString,
         dotIndex+1,
         Strings.length(inputString));
    dotFound := true;
  else
    afterDot := inputString;
    dotFound  := false;
  end if;

  annotation (Documentation(info="<html>
<p>This fuction reads the string after the last dot. Helpfull for model names</p>
</html>"));
end readAfterDot;
