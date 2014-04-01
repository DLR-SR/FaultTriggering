within FaultTriggering.Utilities.Internal.Records;
function Boolean2str
  input Boolean x;
  output String y;
algorithm
  if x then
    y := "true";
  else
    y := "false";
  end if;
end Boolean2str;
