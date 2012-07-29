<%@ Page Language="C#" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Web.UI" %>

<script runat="server" Language="C#">
	void Page_load(object sender, EventArgs e)
	{
	    try
		{
			XmlTextReader oXMLReader = null;
			oXMLReader = new XmlTextReader(Server.MapPath("examples.xml"));
			while (oXMLReader.Read())
			{
				if (oXMLReader.NodeType == XmlNodeType.Element && oXMLReader.Name == "path")
				{
					lblPath.Text = "<b>Path to folder with Splitter examples: </b>" + oXMLReader.ReadString();
				}
			}
			oXMLReader.Close();
		}
		catch
		{
		}
	
		if (Request.QueryString["type"] != null)
		{
			ExamplesType.Value = Request.QueryString["type"].ToString();
		}
	}
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>obout ASP.NET Splitter examples</title>
    <style type="text/css">
		td.link{
			padding-left:30px;
			width:250px;			
		}
		
		td.header {
			padding-top:20px;
			border-bottom:1px solid #eeeeee;
			color:#555555;
		}
		
		.tdText {
			font:11px Verdana;
			color:#333333;
		}
		.option2{
			font:11px Verdana;
			color:#0033cc;
			background-color___:#f6f9fc;
			padding-left:4px;
			padding-right:4px;
		}
		a {
			font:11px Verdana;
			color:#315686;
			text-decoration:underline;
		}

		a:hover {
			color:#DC143C;
		}
	</style>
	<script type="text/javascript">
		function showexamples() {
			var exSelect = document.forms[0].exSelect;
			for(var i=0; i<exSelect.length; i++) {
				if(exSelect[i].checked == true) {
					document.getElementById(exSelect[i].value).style.display = "block";
				} else {
					document.getElementById(exSelect[i].value).style.display = "none";
				}
			}
		}
		function showExamplesFromSpan(index) {		   
		    document.forms[0].exSelect[index].checked = true;
		    showexamples(index);
		}
		window.onload = function() {
			var oExamplesType = document.getElementById("ExamplesType");
			if(oExamplesType.value == "ASPNET") {
				document.forms[0].exSelect[0].checked = true;
			} else if(oExamplesType.value == "CSHARP") {
				document.forms[0].exSelect[1].checked = true;
			} else if(oExamplesType.value == "VBNET") {
				document.forms[0].exSelect[2].checked = true;
			} else {
			    document.forms[0].exSelect[0].checked = true;
			}
			showexamples();
		}
	</script>
</head>
<body style="margin-left:30px;">
    <form id="form1" runat="server">
    	
	<input id="ExamplesType" type="hidden" runat="server" />
	
    <span class="tdText">
        <a href="../Default.aspx">« Back to Suite Examples</a>
        <br /><br /><br />
        <span style="font-weight:bold;">obout ASP.NET Splitter examples</span> (version 2.3.11, released on August 6, 2008)
        <br />
        <br />
        Select the examples you want to see:&#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(0)" value="divASPNET" class="tdText"/><span style="cursor: pointer" onclick="showExamplesFromSpan(0)">ASP.NET</span> &#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(1)" value="divCSharp" class="tdText"/><span style="cursor: pointer" onclick="showExamplesFromSpan(1)">C#</span> &#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(2)" value="divVBNET" class="tdText"/><span style="cursor: pointer" onclick="showExamplesFromSpan(2)">VB.NET</span> &#160;&#160;&#160;
        <br /><br />
        <asp:Label runat="server" ID="lblPath"></asp:Label>
        <br /> 
        <br />
        <table>
            <tr>
                <td>
                    <div id="divASPNET">
                        <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
                        	            <tr>
				                            <td class="header" colspan="2"><b>Appearance - 13</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_default.aspx" style="margin-right:100px;">Default</a>
				                            </td>
					                        <td>aspnet_default.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_default2.aspx">Default2</a>
				                            </td>
					                        <td>aspnet_default2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_default_light.aspx" style="margin-right:100px;">Default Light</a>
				                            </td>
					                        <td>aspnet_default_light.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_icq.aspx" style="margin-right:100px;">Icq</a>
				                            </td>
					                        <td>aspnet_icq.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_mcenter.aspx" style="margin-right:100px;">XP Media Center</a>
				                            </td>
					                        <td>aspnet_mcenter.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_obout.aspx" style="margin-right:100px;">Obout Inc</a>
				                            </td>
					                        <td>aspnet_obout.aspx</td>
			                            </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_addressbook.aspx">Address Book</a>
					                        </td>
					                        <td>aspnet_addressbook.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_emailclient.aspx">Email Client</a>
					                        </td>
					                        <td>aspnet_emailclient.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_dynamicsizeemailclient.aspx">Dynamic size Email Client</a>
					                        </td>
					                        <td>aspnet_dynamicsizeemailclient.aspx</td>
				                        </tr>
										<%--<tr>
					                        <td class="link">
						                        <a href="aspnet_filebrowser.aspx">File Browser</a>
					                        </td>
					                        <td>aspnet_filebrowser.aspx</td>
				                        </tr>--%>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_pdflibrary.aspx">PDF Library</a>
					                        </td>
					                        <td>aspnet_pdflibrary.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_thumbnails.aspx">Thumbnails Resize</a>
					                        </td>
					                        <td>aspnet_thumbnails.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_company.aspx">Company Details</a>
					                        </td>
					                        <td>aspnet_company.aspx</td>
				                        </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Horizontal - 8</b></td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_horizontal1.aspx">Full window width and height</a>
					                        </td>
					                        <td>aspnet_horizontal1.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_horizontal2.aspx">HeightDefault property of the top panel</a>
					                        </td>
					                        <td>aspnet_horizontal2.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_horizontal3.aspx">HeightDefault property of the bottom panel</a>
					                        </td>
					                        <td>aspnet_horizontal3.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_horizontal4.aspx">Inside a div with fixed size</a>
					                        </td>
					                        <td>aspnet_horizontal4.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_horizontal5.aspx">Inside a div with dynamic size</a>
					                        </td>
					                        <td>aspnet_horizontal5.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_horizontal_minmaxsize1.aspx">Top panel min and max</a>
					                        </td>
					                        <td>aspnet_horizontal_minmaxsize1.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_horizontal_minmaxsize2.aspx">Bottom panel min and max</a>
					                        </td>
					                        <td>aspnet_horizontal_minmaxsize2.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_horizontal_minmaxsize3.aspx">Top / Bottom panel min</a>
					                        </td>
					                        <td>aspnet_horizontal_minmaxsize3.aspx</td>
				                        </tr>
				                        
				                        <tr>
				                            <td class="header" colspan="2"><b>Vertical - 9</b></td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_vertical1.aspx">Full window width and height</a>
					                        </td>
					                        <td>aspnet_vertical1.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_vertical2.aspx">WidthDefault property of the left panel</a>
					                        </td>
					                        <td>aspnet_vertical2.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_vertical3.aspx">WidthDefault property of the right panel</a>
					                        </td>
					                        <td>aspnet_vertical3.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_vertical4.aspx">With header and footer</a>
					                        </td>
					                        <td>aspnet_vertical4.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_vertical5.aspx">Inside a div with fixed size</a>
					                        </td>
					                        <td>aspnet_vertical5.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_vertical6.aspx">Inside a div with dynamic size</a>
					                        </td>
					                        <td>aspnet_vertical6.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_vertical_minmaxsize1.aspx">Left panel min and max</a>
					                        </td>
					                        <td>aspnet_vertical_minmaxsize1.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_vertical_minmaxsize2.aspx">Right panel min and max</a>
					                        </td>
					                        <td>aspnet_vertical_minmaxsize2.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_vertical_minmaxsize3.aspx">Left / Right panel min</a>
					                        </td>
					                        <td>aspnet_vertical_minmaxsize3.aspx</td>
				                        </tr>
				                        
										<tr>
				                            <td class="header" colspan="2"><b>Integration - 5</b></td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_withtreeview.aspx">Default with TreeView</a>
					                        </td>
					                        <td>aspnet_withtreeview.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_slidemenu.aspx">With Slide Menu</a>
					                        </td>
					                        <td>aspnet_slidemenu.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_flyout.aspx">With Flyout</a>
					                        </td>
					                        <td>aspnet_flyout.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_easymenu.aspx">With Easy Menu</a>
					                        </td>
					                        <td>aspnet_easymenu.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_window.aspx">With Window</a>
					                        </td>
					                        <td>aspnet_window.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_verticalwithmasterpage.aspx">Vertical with Master Page</a>
					                        </td>
					                        <td>aspnet_verticalwithmasterpage.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_horizontalwithmasterpage.aspx">Horizontal with Master Page</a>
					                        </td>
					                        <td>aspnet_horizontalwithmasterpage.aspx</td>
				                        </tr>
				                        
				                   </table>
                        	    <td style="width:50px">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>  
									    				
                        	            <tr>
				                            <td class="header" colspan="2"><b>Nested Splitters - 4</b></td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_outlook.aspx">Outlook</a>
					                        </td>
					                        <td>aspnet_outlook.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_2vertical.aspx">2 Vertical</a>
					                        </td>
					                        <td>aspnet_2vertical.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_2horizontal.aspx">2 Horizontal</a>
					                        </td>
					                        <td>aspnet_2horizontal.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_3nested.aspx">3 Nested</a>
					                        </td>
					                        <td>aspnet_3nested.aspx</td>
				                        </tr>
				                        
										<tr>
				                            <td class="header" colspan="2"><b>Right panel loading - 4</b> </td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_loadingPages_url.aspx" style="margin-right:100px;">Set URL on server</a>
				                            </td>
					                        <td>aspnet_loadingPages_url.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_loadingPages_loadPage.aspx" style="margin-right:100px;">Open URL on click</a>
				                            </td>
					                        <td>aspnet_loadingPages_loadPage.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_myfavorites.aspx" style="margin-right:100px;">My Favorites</a>
				                            </td>
					                        <td>aspnet_myfavorites.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_panelrefresh.aspx" style="margin-right:100px;">Panel Refresh</a>
				                            </td>
					                        <td>aspnet_panelrefresh.aspx</td>
			                            </tr>
										

										<tr>
				                            <td class="header" colspan="2"><b>Resize splitter panels - 3</b> </td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_defaultresize.aspx">Default Resize</a>
					                        </td>
					                        <td>aspnet_defaultresize.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_liveresize.aspx">Live Resize</a>
					                        </td>
					                        <td>aspnet_liveresize.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_fixedsplitter.aspx">Fixed Splitter</a>
					                        </td>
					                        <td>aspnet_fixedsplitter.aspx</td>
				                        </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Other Features - 21</b></td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_synchronizescroll.aspx">Synchronize Scroll</a>
					                        </td>
					                        <td>aspnet_synchronizescroll.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_rememberscroll.aspx">Remember Scroll Position</a>
					                        </td>
					                        <td>aspnet_rememberscroll.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_collapseexpandpanel.aspx">Collapse/Expand Panel </a>
					                        </td>
					                        <td>aspnet_collapseexpandpanel.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_moveseparator.aspx">Move Separator by Value</a>
					                        </td>
					                        <td>aspnet_moveseparator.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_getpanelsize.aspx">Get Panel Size</a>
					                        </td>
					                        <td>aspnet_getpanelsize.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_cookiedays.aspx">CookieDays</a>
					                        </td>
					                        <td>aspnet_cookiedays.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_hidebeforeload_both.aspx">HideBeforeLoad - Both</a>
					                        </td>
					                        <td>aspnet_hidebeforeload_both.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_hidebeforeload_left.aspx">HideBeforeLoad - Left</a>
					                        </td>
					                        <td>aspnet_hidebeforeload_left.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_hidebeforeload_right.aspx">HideBeforeLoad - Right</a>
					                        </td>
					                        <td>aspnet_hidebeforeload_right.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_hidebeforeload_none.aspx">HideBeforeLoad - None</a>
					                        </td>
					                        <td>aspnet_hidebeforeload_none.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_panelresizable_left.aspx">Panel Resizable - Left</a>
					                        </td>
					                        <td>aspnet_panelresizable_left.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_panelresizable_right.aspx">Panel Resizable - Right</a>
					                        </td>
					                        <td>aspnet_panelresizable_right.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_initialcollapsedpanel.aspx">Initial Collapsed Panel</a>
					                        </td>
					                        <td>aspnet_initialcollapsedpanel.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_collapsedpanel_afterpostback.aspx">Collapsed panel - postback</a>
					                        </td>
					                        <td>aspnet_collapsedpanel_afterpostback.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_headerandfooter.aspx">Optional Header and Footer</a>
					                        </td>
					                        <td>aspnet_headerandfooter.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <nobr><a href="aspnet_multiplesplitters_differentstyle.aspx">Multiple Splitters - different style</a> <b style="color:crimson">New</b></nobr>
					                        </td>
					                        <td>aspnet_multiplesplitters_differentstyle.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_multiplesplitters_samestyle.aspx">Multiple Splitters - same style</a> <b style="color:crimson">New</b>
					                        </td>
					                        <td>aspnet_multiplesplitters_samestyle.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_accessfromusercontrol.aspx">Access from User Control</a>
					                        </td>
					                        <td>aspnet_accessfromusercontrol.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_insideusercontrol.aspx">Inside User Control</a>
					                        </td>
					                        <td>aspnet_insideusercontrol.aspx</td>
				                        </tr>
				                      <%--  <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_adding_nodes2.aspx">Control left panel from right panel</a>
					                        </td>
					                        <td>aspnet_adding_nodes2.aspx, aspnet_adding_nodes2_addpage.aspx</td>
				                        </tr>--%>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_adding_nodes3.aspx">Control left panel from right panel2</a>
					                        </td>
					                        <td>aspnet_adding_nodes3.aspx, aspnet_adding_nodes2_treeview.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_accesssplitterfrompanel_page.aspx">Access Splitter client object from panel</a>
					                        </td>
					                        <td>aspnet_accesssplitterfrompanel.aspx, aspnet_accessplitterfrompanel_page.aspx</td>
				                        </tr>
				                        
				                    </table>							
                        	    </td>
                        	</tr>

			            </table>
            			
			            <br />
			            <br />
			            <span class="tdText">
				            You can find the ASP.NET examples in the <b>Splitter</b> folder.<br />
				            They have the <b>aspnet_</b> prefix.
			            </span>
                    </div>  
                    
                    <div id="divCSharp">
			            <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
                        	            <tr>
				                            <td class="header" colspan="2"><b>Appearance - 12</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_default.aspx" style="margin-right:100px;">Default</a>
				                            </td>
					                        <td>cs_default.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_default2.aspx">Default2</a> 
				                            </td>
					                        <td>cs_default2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_default_light.aspx" style="margin-right:100px;">Default Light</a>
				                            </td>
					                        <td>cs_default_light.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_icq.aspx" style="margin-right:100px;">Icq</a>
				                            </td>
					                        <td>cs_icq.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_mcenter.aspx" style="margin-right:100px;">XP Media Center</a>
				                            </td>
					                        <td>cs_mcenter.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_obout.aspx" style="margin-right:100px;">Obout Inc</a>
				                            </td>
					                        <td>cs_obout.aspx</td>
			                            </tr>
			                            
				                      <%--  <tr>
					                        <td class="link">
						                        <a href="cs_addressbook.aspx">Address Book</a>
					                        </td>
					                        <td>cs_addressbook.aspx</td>
				                        </tr>--%>
										<%--<tr>
					                        <td class="link">
						                        <a href="cs_emailclient.aspx">Email Client</a>
					                        </td>
					                        <td>cs_emailclient.aspx</td>
				                        </tr>--%>
										<%--<tr>
					                        <td class="link">
						                        <a href="cs_filebrowser.aspx">File Browser</a> 
					                        </td>
					                        <td>cs_filebrowser.aspx</td>
				                        </tr>--%>
										<tr>
					                        <td class="link">
						                        <a href="cs_pdflibrary.aspx">PDF Library</a> 
					                        </td>
					                        <td>cs_pdflibrary.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_thumbnails.aspx">Thumbnails Resize</a>
					                        </td>
					                        <td>cs_thumbnails.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_company.aspx">Company Details</a>
					                        </td>
					                        <td>cs_company.aspx</td>
				                        </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Integration - 3</b> </td>
				                        </tr>
				                     <%--   <tr>
					                        <td class="link">
						                        <a href="cs_withtreeview.aspx">Default with TreeView</a>
					                        </td>
					                        <td>cs_withtreeview.aspx</td>
				                        </tr>--%>
										<tr>
					                        <td class="link">
						                        <a href="cs_withslidemenu.aspx">With Slide Menu</a>
					                        </td>
					                        <td>cs_withslidemenu.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_withmasterpage.aspx">With Master Page</a>
					                        </td>
					                        <td>cs_withmasterpage.aspx</td>
				                        </tr>
				                        
				                        <tr>
				                            <td class="header" colspan="2"><b>Right panel loading - 4</b> </td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_loadingPages_url.aspx" style="margin-right:100px;">Set URL on server</a>
				                            </td>
					                        <td>cs_loadingPages_url.aspx</td>
			                            </tr>
										<%--<tr>
				                            <td class="link">
					                            <a href="cs_loadingPages_loadPage.aspx" style="margin-right:100px;">Open URL on click</a>
				                            </td>
					                        <td>cs_loadingPages_loadPage.aspx</td>
			                            </tr>--%>
										<%--<tr>
				                            <td class="link">
					                            <a href="cs_myfavorites.aspx" style="margin-right:100px;">My Favorites</a>
				                            </td>
					                        <td>cs_myfavorites.aspx</td>
			                            </tr>--%>
										<tr>
				                            <td class="link">
					                            <a href="cs_panelrefresh.aspx" style="margin-right:100px;">Panel Refresh</a>
				                            </td>
					                        <td>cs_panelrefresh.aspx</td>
			                            </tr>
				                    </table>
                        	    </td>
                        	    
                        	    <td style="width:50px">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>  
									
										<tr>
				                            <td class="header" colspan="2"><b>Resize splitter panels - 3</b> </td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_defaultresize.aspx">Default Resize</a>
					                        </td>
					                        <td>cs_defaultresize.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_liveresize.aspx">Live Resize</a>
					                        </td>
					                        <td>cs_liveresize.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_fixedsplitter.aspx">Fixed Splitter</a>
					                        </td>
					                        <td>cs_fixedsplitter.aspx</td>
				                        </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Other Features - 15</b></td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_synchronizescroll.aspx">Synchronize Scroll</a>
					                        </td>
					                        <td>cs_synchronizescroll.aspx</td>
				                        </tr>
										<%--<tr>
					                        <td class="link">
						                        <a href="cs_rememberscroll.aspx">Remember Scroll Position</a>
					                        </td>
					                        <td>cs_rememberscroll.aspx</td>
				                        </tr>--%>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_collapseexpandpanel.aspx">Collapse/Expand Panel </a>
					                        </td>
					                        <td>cs_collapseexpandpanel.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_moveseparator.aspx">Move Separator by Value</a>
					                        </td>
					                        <td>cs_moveseparator.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_getpanelsize.aspx">Get Panel Size</a>
					                        </td>
					                        <td>cs_getpanelsize.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_cookiedays.aspx">CookieDays</a>
					                        </td>
					                        <td>cs_cookiedays.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_hidebeforeload_both.aspx">HideBeforeLoad - Both</a>
					                        </td>
					                        <td>cs_hidebeforeload_both.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_hidebeforeload_left.aspx">HideBeforeLoad - Left</a>
					                        </td>
					                        <td>cs_hidebeforeload_left.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_hidebeforeload_right.aspx">HideBeforeLoad - Right</a>
					                        </td>
					                        <td>cs_hidebeforeload_right.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_hidebeforeload_none.aspx">HideBeforeLoad - None</a>
					                        </td>
					                        <td>cs_hidebeforeload_none.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_panelresizable_left.aspx">Panel Resizable - Left</a>
					                        </td>
					                        <td>cs_panelresizable_left.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_panelresizable_right.aspx">Panel Resizable - Right</a>
					                        </td>
					                        <td>cs_panelresizable_right.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_headerandfooter.aspx">Optional Header and Footer</a>
					                        </td>
					                        <td>cs_headerandfooter.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_multiplesplitters.aspx">Multiple Splitters</a>
					                        </td>
					                        <td>cs_multiplesplitters.aspx</td>
				                        </tr>
				                        <%--<tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="cs_adding_nodes.aspx">Control left panel from right panel</a>
					                        </td>
					                        <td>cs_adding_nodes.aspx</td>
				                        </tr>--%>
				                    </table>
                        	    </td>
                        	</tr>

			            </table>
            			
			            <br />
			            <br />
			            <span class="tdText">
				            You can find the C# examples in the <b>Splitter</b> folder.<br />
				            They have the <b>cs_</b> prefix.
			            </span>
                    </div> 
                    
                    <div id="divVBNET">
			            <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
                        	            <tr>
				                            <td class="header" colspan="2"><b>Appearance - 12</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_default.aspx" style="margin-right:100px;">Default</a>
				                            </td>
					                        <td>vb_default.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_default2.aspx">Default2</a> 
				                            </td>
					                        <td>vb_default2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_default_light.aspx" style="margin-right:100px;">Default Light</a>
				                            </td>
					                        <td>vb_default_light.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_icq.aspx" style="margin-right:100px;">Icq</a>
				                            </td>
					                        <td>vb_icq.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_mcenter.aspx" style="margin-right:100px;">XP Media Center</a>
				                            </td>
					                        <td>vb_mcenter.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_obout.aspx" style="margin-right:100px;">Obout Inc</a>
				                            </td>
					                        <td>vb_obout.aspx</td>
			                            </tr>
				                       <%-- <tr>
					                        <td class="link">
						                        <a href="vb_addressbook.aspx">Address Book</a>
					                        </td>
					                        <td>vb_addressbook.aspx</td>
				                        </tr>--%>
										<%--<tr>
					                        <td class="link">
						                        <a href="vb_emailclient.aspx">Email Client</a>
					                        </td>
					                        <td>vb_emailclient.aspx</td>
				                        </tr>--%>
										<%--<tr>
					                        <td class="link">
						                        <a href="vb_filebrowser.aspx">File Browser</a> 
					                        </td>
					                        <td>vb_filebrowser.aspx</td>
				                        </tr>--%>
										<tr>
					                        <td class="link">
						                        <a href="vb_pdflibrary.aspx">PDF Library</a> 
					                        </td>
					                        <td>vb_pdflibrary.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_thumbnails.aspx">Thumbnails Resize</a>
					                        </td>
					                        <td>vb_thumbnails.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_company.aspx">Company Details</a>
					                        </td>
					                        <td>vb_company.aspx</td>
				                        </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Integration - 3</b> </td>
				                        </tr>
				                       <%-- <tr>
					                        <td class="link">
						                        <a href="vb_withtreeview.aspx">Default with TreeView</a>
					                        </td>
					                        <td>vb_withtreeview.aspx</td>
				                        </tr>--%>
										<tr>
					                        <td class="link">
						                        <a href="vb_withslidemenu.aspx">With Slide Menu</a>
					                        </td>
					                        <td>vb_withslidemenu.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_withmasterpage.aspx">With Master Page</a>
					                        </td>
					                        <td>vb_withmasterpage.aspx</td>
				                        </tr>
				                        <tr>
				                            <td class="header" colspan="2"><b>Right panel loading - 4</b> </td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_loadingPages_url.aspx" style="margin-right:100px;">Set URL on server</a>
				                            </td>
					                        <td>vb_loadingPages_url.aspx</td>
			                            </tr>
										<%--<tr>
				                            <td class="link">
					                            <a href="vb_loadingPages_loadPage.aspx" style="margin-right:100px;">Open URL on click</a>
				                            </td>
					                        <td>vb_loadingPages_loadPage.aspx</td>
			                            </tr>--%>
										<%--<tr>
				                            <td class="link">
					                            <a href="vb_myfavorites.aspx" style="margin-right:100px;">My Favorites</a>
				                            </td>
					                        <td>vb_myfavorites.aspx</td>
			                            </tr>--%>
										<tr>
				                            <td class="link">
					                            <a href="vb_panelrefresh.aspx" style="margin-right:100px;">Panel Refresh</a>
				                            </td>
					                        <td>vb_panelrefresh.aspx</td>
			                            </tr>
			                            
				                    </table>
                        	    </td>
                        	    
                        	    <td style="width:50px">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>  

										<tr>
				                            <td class="header" colspan="2"><b>Resize splitter panels - 3</b> </td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_defaultresize.aspx">Default Resize</a>
					                        </td>
					                        <td>vb_defaultresize.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_liveresize.aspx">Live Resize</a>
					                        </td>
					                        <td>vb_liveresize.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_fixedsplitter.aspx">Fixed Splitter</a>
					                        </td>
					                        <td>vb_fixedsplitter.aspx</td>
				                        </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Other Features - 15</b></td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_synchronizescroll.aspx">Synchronize Scroll</a>
					                        </td>
					                        <td>vb_synchronizescroll.aspx</td>
				                        </tr>
										<%--<tr>
					                        <td class="link">
						                        <a href="vb_rememberscroll.aspx">Remember Scroll Position</a>
					                        </td>
					                        <td>vb_rememberscroll.aspx</td>
				                        </tr>--%>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_collapseexpandpanel.aspx">Collapse/Expand Panel </a>
					                        </td>
					                        <td>vb_collapseexpandpanel.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_moveseparator.aspx">Move Separator by Value</a>
					                        </td>
					                        <td>vb_moveseparator.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_getpanelsize.aspx">Get Panel Size</a>
					                        </td>
					                        <td>vb_getpanelsize.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_cookiedays.aspx">CookieDays</a>
					                        </td>
					                        <td>vb_cookiedays.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_hidebeforeload_both.aspx">HideBeforeLoad - Both</a>
					                        </td>
					                        <td>vb_hidebeforeload_both.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_hidebeforeload_left.aspx">HideBeforeLoad - Left</a>
					                        </td>
					                        <td>vb_hidebeforeload_left.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_hidebeforeload_right.aspx">HideBeforeLoad - Right</a>
					                        </td>
					                        <td>vb_hidebeforeload_right.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_hidebeforeload_none.aspx">HideBeforeLoad - None</a>
					                        </td>
					                        <td>vb_hidebeforeload_none.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_panelresizable_left.aspx">Panel Resizable - Left</a>
					                        </td>
					                        <td>vb_panelresizable_left.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_panelresizable_right.aspx">Panel Resizable - Right</a>
					                        </td>
					                        <td>vb_panelresizable_right.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_headerandfooter.aspx">Optional Header and Footer</a>
					                        </td>
					                        <td>vb_headerandfooter.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_multiplesplitters.aspx">Multiple Splitters</a>
					                        </td>
					                        <td>vb_multiplesplitters.aspx</td>
				                        </tr>
				                       <%-- <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="vb_adding_nodes.aspx">Control left panel from right panel</a>
					                        </td>
					                        <td>vb_adding_nodes.aspx</td>
				                        </tr>--%>
				                         
				                    </table>
                        	    </td>
                        	</tr>

			            </table>
			            
			            <br /><br />
			            <span class="tdText">
				            You can find the VB.NET examples in the <b>Splitter</b> folder.<br />
				            They have the <b>vb_</b> prefix.
			            </span>
                    </div> 
                </td>
			</tr>
        </table>
        <br />
        <br />
        <a href="http://www.obout.com/splitter/">obout ASP.NET Splitter home</a>
        <br />
        <a href="http://www.obout.com">obout inc home</a>
       </span>                             
    </form>
</body>
</html>
