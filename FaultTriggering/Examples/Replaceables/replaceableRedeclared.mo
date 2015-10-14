within FaultTriggering.Examples.Replaceables;
model ReplaceableRedeclared

  ReplaceableTest replaceableTest(redeclare Parts.A partialModel,
    redeclare Parts.B partialModel1,
    redeclare Parts.C partialModel2)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
end ReplaceableRedeclared;
