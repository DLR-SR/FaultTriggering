within FaultTriggering.Utilities.Icons;
package InterfacesPackage "icon of interfaces package"
extends Package;


annotation (Icon(graphics={
        Polygon(
          points={{-90,20},{-60,20},{-30,60},{-10,60},{-10,-60},{-30,-60},{-60,
            -20},{-90,-20},{-90,20}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={215,230,240},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{10,60},{30,60},{60,20},{90,20},{90,-20},{60,-20},{30,-60},{
            10,-60},{10,60}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid)}));
end InterfacesPackage;
