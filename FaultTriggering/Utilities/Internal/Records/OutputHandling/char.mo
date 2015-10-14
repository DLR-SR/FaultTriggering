within FaultTriggering.Utilities.Internal.Records.OutputHandling;
function char "The character of a given string str at index i is returned."
  import Modelica.Utilities.Strings.*;
  extends Modelica.Icons.Function;
  input String str "string to be considered";
  input Integer i "index of chararcter inside str";
  output String str2=substring(
            str,
            i,
            i) "result character";
algorithm

  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
str2 = char(str, i);
</pre></blockquote>
<h4>Description</h4>
<p>
The character of a given string str at index i is returned.
</p>
<h4>Example</h4>
<blockquote><pre>
  str2 := char(\"Hello\", 2);
      -> str2 = \"e\"
</pre></blockquote>
</html>"));
end char;
