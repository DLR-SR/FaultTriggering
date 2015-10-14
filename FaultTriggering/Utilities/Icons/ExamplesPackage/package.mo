within FaultTriggering.Utilities.Icons;
package ExamplesPackage "icon of example package"
extends Package;


annotation (Icon(graphics={
        Polygon(
          points={{-38,62},{62,2},{-38,-58},{-38,62}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid)}));
end ExamplesPackage;
