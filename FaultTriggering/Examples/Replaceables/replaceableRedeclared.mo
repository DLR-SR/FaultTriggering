within FaultTriggering.Examples.Replaceables;
model ReplaceableRedeclared
  ReplaceableTest replaceableTest(redeclare Parts.B partialModel1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
end ReplaceableRedeclared;
