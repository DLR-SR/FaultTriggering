within FaultTriggering.Utilities.Internal.Records.OutputHandling;
function FormatReal
  "A user friendly format of the real value val with nDec decimals is returned."
  import Modelica.Utilities.Streams.*;
  import Modelica.Utilities.Strings.*;
  extends Modelica.Icons.Function;
  input Real val "Value to be formatted";
  input Integer nDec(min=1) "Number of decimals of val to be shown";
  output String str "Formatted return string";
protected
  Integer len_str;
  Integer i;
  Integer n_space;
  Integer e_index;
  Integer nDecimals;
algorithm
  nDecimals := nDec;
  if nDecimals < 1 then
    nDecimals := 1;
  elseif nDecimals > 16 then
    nDecimals := 16;
  end if;
  if (abs(val) < 1000) and (abs(val) > 1e-2) or (val == 0.0) then
    str := String(val, format=String(5 + nDecimals) + "." + String(
      nDecimals) + "f");
    len_str := length(str);
    for k in 1:nDecimals loop
      i := len_str - k + 1;
      if char(str, i) == "0" then
        str := substituteChar(
                str,
                i,
                " ");
      else
        break;
      end if;
    end for;
    // eliminate "."
    if char(str, len_str - nDecimals + 1) == " " then
      str := substituteChar(
              str,
              len_str - nDecimals,
              " ");
    end if;
    str := str + repeat(5, " ");
  else
    str := String(val, format=String(10 + nDecimals) + "." + String(
      nDecimals) + "e");
    len_str := length(str);
    // find "e"
    e_index := 0;
    for k in len_str:-1:1 loop
      if char(str, k) == "e" then
        e_index := k;
        break;
      end if;
    end for;
    if e_index == 0 then
      break;
    end if;
    n_space := 0;
    for k in 1:nDecimals loop
      i := e_index - k;
      if char(str, i) == "0" then
        str := substituteChar(
                str,
                i,
                "") + " ";
        n_space := n_space + 1;
      else
        break;
      end if;
    end for;
    // eliminate "."
    if char(str, e_index - nDecimals) == "e" then
      str := substituteChar(
              str,
              e_index - nDecimals - 1,
              "") + " ";
      n_space := n_space + 1;
    end if;
    i := e_index - n_space + 2;
    for k in 1:3 loop
      if char(str, i) == "0" then
        str := substituteChar(
                str,
                i,
                "") + " ";
      elseif e_index > len_str - 4 then
        str := str + Modelica.Utilities.Strings.repeat(4 - (len_str -
          e_index), " ");
        str := substituteChar(
                str,
                4 - (len_str - e_index),
                "");
        break;
      else
        break;
      end if;
    end for;
  end if;
  annotation (Documentation(info="<html>
<p><h4>Syntax</h4></p>
<blockquote><pre>str = FormatReal(val, nDec);</pre></blockquote>
<p><h4>Description</h4></p>
<p>A user friendly format of the real value val with nDec decimals is returned. </p>
<p><h4>Example</h4></p>
<blockquote><pre>  str1 := FormatReal(Modelica.Constants.pi, 5);              
  str2 := FormatReal(1e25*Modelica.Constants.pi, 5);  
  str3 := FormatReal(1e2*Modelica.Constants.pi, 5);            
  str4 := FormatReal(1e-2*Modelica.Constants.pi, 5);               
  str5 := FormatReal(1e-3*Modelica.Constants.pi, 5);
  
               -&GT; str1 = &QUOT;   3.14159     &QUOT;
               -&GT; str2 = &QUOT;   3.14159e+25 &QUOT;
               -&GT; str3 = &QUOT; 314.15927     &QUOT;
               -&GT; str4 = &QUOT;   0.03142     &QUOT;
               -&GT; str5 = &QUOT;   3.14159e-3  &QUOT;              </pre></blockquote>
</html>"));
end FormatReal;
