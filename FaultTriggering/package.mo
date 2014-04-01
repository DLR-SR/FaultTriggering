within ;
package FaultTriggering "Library for fault triggering"
  extends FaultTriggering.Utilities.Icons.Package;

  import SI = Modelica.SIunits;
  import Modelica.Utilities.Streams;
  import Modelica.Utilities.Strings;


  annotation (uses(Modelica(version="3.2.1"), ModelManagement(version="1.1.1")),
    version="0.4.0",
    versionDate="2013-11-12",
    versionBuild=1,
    dateModified = "2013-06-26",
    revisionID="$Id:: package.mo 176 2014-03-26 13:09:14Z l#$",
preferredView="info",
   Documentation(info="<html>
<p>Library for fault Modelling</p>
<p><br/><b><a name=\"sec_library_structure\">S</a>tructure of the FaultTriggering library</b></p>
<p><ul>
<li><b>User&apos;s Guide</b>: Library description and user guide. </li>
<li><b>Examples</b>: Examples of how to use the library.</li>
<li><b>createFaultPackage</b>: Most important function of the library setting the faults and generating. </li>
<li><b>FaultOuput</b>: Models sources of faults. </li>
<li><b>Utilities</b>: Internal library functions.</li>
</ul></p>
<p>  </p>
<p><img src=\"modelica://FaultTriggering/Resources/Documentation/LibraryTree.png\"/></p>
<p>&nbsp; </p>
<p><b><a name=\"sec_release_notes\">R</a>elease Notes</b></p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><b>Version</b>&nbsp;&nbsp;</p></td>
<td><p><h4>Comments</h4></p></td>
</tr>
<tr>
<td><p>0.1</p></td>
<td><p>2012-07-25: First Beta</p></td>
</tr>
<tr>
<td><p>0.2</p></td>
<td><p>2012-08-29: Major naming convention updates</p></td>
</tr>
<tr>
<td><p>0.3</p></td>
<td><p>2012-12-18: FaultBus features added</p></td>
</tr>
<tr>
<td><p>0.3.5</p></td>
<td><p>2013-07-15: Usability upgrade, FaultBus now in extra package and documentation update</p></td>
</tr>
<tr>
<td><p>0.4</p></td>
<td><p>2013-11-12: Library is renamed to FaultTriggering. All internal names are updated from Failure to Fault. Icon update to match Modelica 3.2.1 standard. </p></td>
</tr>
</table>
<p><br/><br/><br/><br/>Point of contact: Frans van der Linden, franciscus.vanderlinden@dlr.de</p>
<p><br/><br/><br/><b>The FaultTriggering library is licensed to all ACTUATION 2015 partners from WP3.1. for use in the project and the duration of the project. The licensing of the library after the project is not yet determined. </b></p>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr>
<td><p><br/><br/><br/><img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\"/></p></td>
<td><p><h4>Copyright &copy; DLR Institute of System Dynamics and Control </h4></p></td>
</tr>
</table>
</html>", revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
      <td valign=\"center\"> <b>Copyright &copy; DLR Institute of System Dynamics and Control<b> </td>
  </tr>
 </table>
</html>"),
  Icon(graphics={
    Polygon(
      points={{72,92},{-20,12},{2,-8},{-68,-88},{32,-8},{12,12},{72,92}},
      smooth=Smooth.None,
      fillColor={255,0,0},
      fillPattern=FillPattern.Solid,
      lineThickness=0.5,
          pattern=LinePattern.None,
          lineColor={0,0,0})}));
end FaultTriggering;
