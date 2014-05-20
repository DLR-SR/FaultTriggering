within FaultTriggering.Utilities.Internal;
function getAllModelComponents
  "getAllModelComponents finds all model components of a model"
extends FaultTriggering.Utilities.Icons.ModelTree;

  input String modelName="FaultTriggering.Examples.ActuatorExample.Parts.Motors.Simple";
  input Integer maxSearchSize=100 "pre allocation size of the output matrices";

  output String[maxSearchSize] componentPath "Path to component";
  output String[maxSearchSize] componentNames "Component names";

protected
  String[maxSearchSize] stackPath;
  Boolean[maxSearchSize] isExternal;
  String[maxSearchSize] pathOut;
  Integer outputIndex;
  Integer stackIndex=1;
  Integer stackCounter;
  String actualPath;
//  String actualModelPath;
  ModelManagement.Structure.AST.ComponentAttributes componentAttributes[:]
    "Component Names";
  ModelManagement.Structure.AST.ExtendsAttributes extendsAttributes[:]
    "Extends Names";
  Integer stackAddCounter=1;

algorithm
  // Set start values
  stackPath[1] := modelName;
  pathOut[1] := modelName;
  componentPath[1] := modelName;
  actualPath := modelName;

 //Loop over complete stack to make sure all indexes are used.
  for stackCounter in 1:maxSearchSize loop
    actualPath := stackPath[stackCounter];
    if Modelica.Utilities.Strings.length(actualPath) <> 0 then
        // Process all components in "actualPath"
      componentAttributes :=
        ModelManagement.Structure.AST.ComponentsInClassAttributes(actualPath);
      for stackAddCounter in 1:size(componentAttributes, 1) loop
        // check if componentname is empty
        if (Modelica.Utilities.Strings.find(componentAttributes[stackAddCounter].fullTypeName,
            ".") <> 0) then
          stackIndex := stackIndex + 1;
          assert(stackIndex < maxSearchSize,"getAllModelComponents: the pre located size of the vectors is not big enough. Please increase maxSearchSize");
          outputIndex := outputIndex + 1;
          isExternal[stackIndex] := false;
          stackPath[stackIndex] := componentAttributes[stackAddCounter].fullTypeName;
          pathOut[stackIndex] := pathOut[stackCounter] + "." +
            componentAttributes[stackAddCounter].name;
          componentPath[outputIndex] := pathOut[stackIndex];
          componentNames[outputIndex] := stackPath[stackIndex];
        end if;
      end for;
        // Process all extends in "actualPath"
      extendsAttributes :=
        ModelManagement.Structure.AST.ExtendsInClassAttributes(actualPath);
      for stackAddCounter in 1:size(extendsAttributes, 1) loop
        // check if extendname is empty
        if (Modelica.Utilities.Strings.find(extendsAttributes[stackAddCounter].fullTypeName,
            ".") <> 0) then
          stackIndex := stackIndex + 1;
          assert(stackIndex < maxSearchSize,"getAllModelComponents: the pre located size of the vectors is not big enough. Please increase maxSearchSize");
          stackPath[stackIndex] := extendsAttributes[stackAddCounter].fullTypeName;
          pathOut[stackIndex] := pathOut[stackCounter];
          isExternal[stackIndex] := true;
        end if;
      end for;

    end if;
  end for;

  annotation(__Dymola_interactive=true,
    Icon(graphics),
    Diagram(graphics={
        Rectangle(
          extent={{-80,10},{-60,-10}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-20,74},{0,54}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-20,-46},{0,-66}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{40,100},{60,80}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{40,48},{60,28}},
          lineColor={0,0,255},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{40,-10},{60,-30}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{40,-46},{60,-66}},
          lineColor={0,0,255},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{40,-80},{60,-100}},
          lineColor={0,0,255},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-60,0},{-50,0},{-50,64},{-20,64}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-20,-56},{-50,-56},{-50,10}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{40,90},{30,90},{30,38},{40,38}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{40,-20},{30,-20},{30,-90},{40,-90}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{0,-56},{40,-56}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{0,64},{30,64}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.None)}),
    Documentation(info="<html>
<p>This function uses a stack with a maximal search size of <b>maxSearchSize</b> to seach all components from the model <b>modelName</b>. To use this function a working copy of the <code>ModelManagement</code> Library should be installed.</p>
<p>The output of the function are the names of the components as well as the path to the model.</p>
<p><b>maxSearchSize </b>must be big enough to fit all model components, if it is not big enough, the function will be aborted and an error will triggered.</p>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><br/><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><p><b>Copyright &copy; DLR Institute of System Dynamics and Control</b> </p></td>
</tr>
</table>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td></td>
<td></td>
</tr>
</table>
</html>"));
end getAllModelComponents;
