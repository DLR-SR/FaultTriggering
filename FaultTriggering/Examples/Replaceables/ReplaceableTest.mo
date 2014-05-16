within FaultTriggering.Examples.Replaceables;
model ReplaceableTest
  replaceable Parts.A partialModel constrainedby Parts.partialModel
    annotation (Placement(transformation(extent={{-8,28},{12,48}})));
  replaceable Parts.A partialModel1 constrainedby Parts.partialModel
    annotation (Placement(transformation(extent={{-12,-34},{8,-14}})));
end ReplaceableTest;
