within FaultTriggering.Utilities.Internal.Records.FMU;
record ScalarVariable
  String name;
  FaultTriggering.Utilities.Internal.Records.FMU.InternalRecords.OptionalString
    description;
  Integer valueReference;
  FaultTriggering.Utilities.Internal.Records.FMU.Enumerations.Causality causality;
  FaultTriggering.Utilities.Internal.Records.FMU.Enumerations.Variability variability;
  FaultTriggering.Utilities.Internal.Records.FMU.Enumerations.Initial initialDefinition;
  FaultTriggering.Utilities.Internal.Records.FMU.InternalRecords.OptionalInteger
    previous;
  FaultTriggering.Utilities.Internal.Records.FMU.Enumerations.Type variableType;
  FaultTriggering.Utilities.Internal.Records.FMU.InternalRecords.RealAttributes
    realAttributes;
  FaultTriggering.Utilities.Internal.Records.FMU.InternalRecords.IntegerAttributes
    integerAttributes;
  FaultTriggering.Utilities.Internal.Records.FMU.InternalRecords.BooleanAttributes
    booleanAttributes;
  FaultTriggering.Utilities.Internal.Records.FMU.InternalRecords.StringAttributes
    stringAttributes;
  FaultTriggering.Utilities.Internal.Records.FMU.InternalRecords.IntegerAttributes
    enumerationAttributes;
end ScalarVariable;
