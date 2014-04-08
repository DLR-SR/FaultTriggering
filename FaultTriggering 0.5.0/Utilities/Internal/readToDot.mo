within FaultTriggering.Utilities.Internal;
function readToDot "reads string to the first dot"
input String  inputString="a.b.c" "string input";
output String beforeDot "part till first dot";
output String afterDot "part after first dot";
output Boolean dotFound "true if no dot is found";

protected
  Integer dotIndex "index of first dot";
algorithm
  dotIndex := Strings.find(inputString, ".");
  if dotIndex <> 0 then
  beforeDot := Strings.substring(
        inputString,
        1,
        dotIndex - 1);
   afterDot := Strings.substring(
         inputString,
         dotIndex+1,
         Strings.length(inputString));
    dotFound := true;
  else
    beforeDot := inputString;
    afterDot  := "";
    dotFound  := false;
  end if;

  annotation (Documentation(info="<html>
<p>This fuction reads the string up to the first dot. Helpfull to obtain the package name of a model.</p>
</html>"));
end readToDot;
