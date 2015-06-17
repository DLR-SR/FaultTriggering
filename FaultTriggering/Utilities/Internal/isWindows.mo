within FaultTriggering.Utilities.Internal;
function isWindows
  output Boolean isWin;
protected
  String OS;
  String OSTYPE;
  Boolean determine;
algorithm
  determine := true;
  OS := Modelica.Utilities.System.getEnvironmentVariable("OS");
  OSTYPE := Modelica.Utilities.System.getEnvironmentVariable("OSTYPE");
  if Modelica.Utilities.Strings.length(OS) > 3 then
if Modelica.Utilities.Strings.compare(
          Modelica.Utilities.Strings.substring(
            OS,
            1,
            3),
          "win",
          false) == Modelica.Utilities.Types.Compare.Equal then
  isWin := true;
elseif Modelica.Utilities.Strings.compare(
          Modelica.Utilities.Strings.substring(
            OS,
            1,
            3),
          "lin",
          false) == Modelica.Utilities.Types.Compare.Equal then
  isWin := false;
else
  determine := false;
end if;
  elseif Modelica.Utilities.Strings.length(OSTYPE) > 3 then
if Modelica.Utilities.Strings.compare(
          Modelica.Utilities.Strings.substring(
            OSTYPE,
            1,
            3),
          "win",
          false) == Modelica.Utilities.Types.Compare.Equal then
  isWin := true;
elseif Modelica.Utilities.Strings.compare(
          Modelica.Utilities.Strings.substring(
            OSTYPE,
            1,
            3),
          "lin",
          false) == Modelica.Utilities.Types.Compare.Equal then
  isWin := false;
else
  determine := false;
end if;
  else
determine := false;
  end if;
  assert(determine,
"Cannot determine a known operating system. Please ensure that there exists an environment variable OS or OSTYPE with the name of your operating system (windows or linux)!");
end isWindows;
