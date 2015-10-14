within FaultTriggering.Examples.Replaceables;
model ReplaceableTest
  replaceable Parts.A partialModel constrainedby Parts.partialModel
    annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  replaceable Parts.A partialModel1 constrainedby Parts.partialModel
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  replaceable Parts.A partialModel2 constrainedby Parts.partialModel
    annotation (Placement(transformation(extent={{-10,-52},{10,-32}})));
end ReplaceableTest;
