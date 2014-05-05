within FaultTriggering.Utilities.Internal.Records.OutputHandling;
function substituteChar
  "A single character of a string str is substituted by a given character c at index i."
  import Modelica.Utilities.Strings.*;
  extends Modelica.Icons.Function;
  input String str "string to be considered";
  input Integer i "index of character inside str to be substituted";
  input String c "character that replaces the character in str at index i";
  output String str2 "result string";
protected
  Integer len_str;
algorithm
  assert(length(c) <= 1, "Length of String c must be <= 1.");
  len_str := length(str);
  if i == 1 then
    if len_str == 1 then
      str2 := c;
    else
      str2 := c + substring(
              str,
              i + 1,
              len_str);
    end if;
  elseif i == len_str then
    str2 := substring(
            str,
            1,
            i - 1) + c;
  else
    str2 := substring(
            str,
            1,
            i - 1) + c + substring(
            str,
            i + 1,
            len_str);
  end if;
  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
str2 = substituteChar(str, i, c);
</pre></blockquote>
<h4>Description</h4>
<p>
A single character of a string str is substituted by a given character c at index i.
</p>
<h4>Example</h4>
<blockquote><pre>
  str2 := substituteChar(\"Hello\", 2, \"a\");
               -> str2 = \"Hallo\"

  str2 := substituteChar(\"Hello\", 3, \"\");
               -> str2 = \"Helo\"
</pre></blockquote>
</html>"));
end substituteChar;
