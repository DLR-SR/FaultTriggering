within FaultTriggering.Utilities.Internal.Records.FMU;
record ScalarVariable
  String name;
  FaultTriggering.Utilities.Internal.Records.FMU.InternalRecords.OptionalString
    description;
  Integer valueReference;
  FMU.Enumerations.Causality causality;
  Enumerations.Variability variability;
  Enumerations.Initial initialDefinition;
  FMU.InternalRecords.OptionalInteger
    previous;
  Enumerations.Type variableType;
  InternalRecords.RealAttributes
    realAttributes;
  InternalRecords.IntegerAttributes
    integerAttributes;
  InternalRecords.BooleanAttributes
    booleanAttributes;
  InternalRecords.StringAttributes
    stringAttributes;
  InternalRecords.IntegerAttributes
    enumerationAttributes;
end ScalarVariable;
