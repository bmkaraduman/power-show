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
					lblPath.Text = "<b>Path to folder with EasyMenu examples: </b>" + oXMLReader.ReadString();
				}
			}
			oXMLReader.Close();
		}
        catch (Exception ex)
        {
            if (ex != null) { ex = null; }
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
    <title>obout ASP.NET Easy Menu examples</title>
    <style type="text/css">
		td.link{
			padding-left:30px;
			
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
			color:crimson;
		}
		
		.headerNumber {
		    color:crimson;
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
	
    <div class="tdText">
        <a href="../Default.aspx">« Back to Suite Examples</a>
        <br /><br /><br />
        <span style="font-weight:bold;">obout ASP.NET Easy Menu examples</span> (version 3.10.9.0, released on September 14, 2010)
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
				                            <td class="header" colspan="2"><b>Appearance - Horizontal</b> - <span class="headerNumber">15</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_horizontal_1.aspx" style="margin-right:100px;">Horizontal 1</a>
				                            </td>
					                        <td>aspnet_horizontal_1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_horizontal_2.aspx" style="margin-right:100px;">Horizontal 2</a>
				                            </td>
					                        <td>aspnet_horizontal_2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_horizontal_3.aspx" style="margin-right:100px;">Horizontal 3</a>
				                            </td>
					                        <td>aspnet_horizontal_3.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_horizontal_4.aspx" style="margin-right:100px;">Horizontal 4</a>
				                            </td>
					                        <td>aspnet_horizontal_4.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_horizontal_5.aspx" style="margin-right:100px;">Horizontal 5</a>
				                            </td>
					                        <td>aspnet_horizontal_5.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_horizontal_6.aspx" style="margin-right:100px;">Horizontal 6</a>
				                            </td>
					                        <td>aspnet_horizontal_6.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_horizontal_7.aspx" style="margin-right:100px;">Horizontal 7</a>
				                            </td>
					                        <td>aspnet_horizontal_7.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_horizontal_8.aspx" style="margin-right:100px;">Horizontal 8</a>
				                            </td>
					                        <td>aspnet_horizontal_8.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_horizontal_9.aspx" style="margin-right:100px;">Horizontal 9</a>
				                            </td>
					                        <td>aspnet_horizontal_9.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_msdn.aspx">MSDN</a>
				                            </td>
					                        <td>aspnet_msdn.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_horizontalmsdn.aspx">MSDN 2</a>
				                            </td>
					                        <td>aspnet_horizontalmsdn.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_ex_tabstrip.aspx">With rounded corners</a>
				                            </td>
					                        <td>aspnet_ex_tabstrip.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_horizontal_keepopen.aspx">KeepOpen</a><b style="color:crimson">New</b>
				                            </td>
					                        <td>aspnet_horizontal_keepopen.aspx</td>
			                            </tr>	

										<tr>
				                            <td class="link">
					                            <a href="aspnet_horizontal_rtl.aspx" style="margin-right:100px;">Horizontal Right to Left</a>
				                            </td>
					                        <td>aspnet_horizontal_rtl.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_emoverflash.aspx" style="margin-right:100px;">Transparent - over flash</a>
				                            </td>
					                        <td>aspnet_emoverflash.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_emoveriframe.aspx" style="margin-right:100px;">Transparent - over iframe</a>
				                            </td>
					                        <td>aspnet_emoveriframe.aspx</td>
			                            </tr>
											

										<tr>
				                            <td class="header" colspan="2"><b>Appearance - Vertical</b> - <span class="headerNumber">2</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_vertical_1.aspx" style="margin-right:100px;">Vertical 1</a>
				                            </td>
					                        <td>aspnet_vertical_1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_vertical_rtl.aspx" style="margin-right:100px;">Vertical Right to Left</a>
				                            </td>
					                        <td>aspnet_vertical_rtl.aspx</td>
			                            </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Populating with Data</b> - <span class="headerNumber">4</span> <b style="color:crimson">New</b></td>
				                        </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_data_sources_datareader.aspx" style="margin-right:100px;">Binding to DataReader</a>
				                            </td>
					                        <td>aspnet_data_sources_datareader.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_data_sources_datatable.aspx" style="margin-right:100px;">Binding to DataTable</a>
				                            </td>
					                        <td>aspnet_data_sources_datatable.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_data_sources_ods.aspx" style="margin-right:100px;">Binding to ObjectDataSource</a>
				                            </td>
					                        <td>aspnet_data_sources_ods.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_data_sources_sds.aspx" style="margin-right:100px;">Binding to SqlDataSource</a>
				                            </td>
					                        <td>aspnet_data_sources_sds.aspx</td>
			                            </tr>
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Multi Column Menu</b> - <span class="headerNumber">2</span><b style="color:crimson"> New</b></td>
				                        </tr>
				                        
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_multicolumn_submenu.aspx" style="margin-right:100px;">Multi column submenu</a>
				                            </td>
					                        <td>aspnet_multicolumn_submenu.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_multicolumn_submenu_icons.aspx" style="margin-right:100px;">Multi Column Easy Menu with Icons</a>
				                            </td>
					                        <td>aspnet_multicolumn_submenu_icons.aspx</td>
			                            </tr>
				                        
										<tr>
				                            <td class="header" colspan="2"><b>Integration</b> - <span class="headerNumber">7</span></td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_insideusercontrol.aspx">Inside User Control</a>
					                        </td>
					                        <td>aspnet_insideusercontrol.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_masterpage.aspx">With Master Page</a> 
					                        </td>
					                        <td>aspnet_masterpage.aspx</td>
				                        </tr>
										<%--<tr>
					                        <td class="link">
						                        <a href="aspnet_withtreeview.aspx">With TreeView</a>
					                        </td>
					                        <td>aspnet_withtreeview.aspx</td>
				                        </tr>--%>
										<%--<tr>
					                        <td class="link">
						                        <a href="aspnet_treeviewinsideeasymenu.aspx">TreeView inside Easy Menu</a>
					                        </td>
					                        <td>aspnet_treeviewinsideeasymenu.aspx</td>
				                        </tr>--%>
				                       <%-- <tr>
					                        <td class="link">
						                        <a href="aspnet_dynloading.aspx">Dynamic Loading</a>
					                        </td>
					                        <td>aspnet_dynloading.aspx, aspnet_dyntreeview</td>
				                        </tr>--%>
				                       <%-- <tr>
					                        <td class="link">
						                        <a href="aspnet_eminsidecallbackpanel.aspx">Inside callback panel</a>
					                        </td>
					                        <td>aspnet_eminsidecallbackpanel.aspx</td>
				                        </tr>--%>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_grid_with_easymenu.aspx">Use With Grid</a>
					                        </td>
					                        <td>aspnet_grid_with_easymenu.aspx</td>
				                        </tr>
				                        
				                    </table>
                        	    </td>
                        	    
                        	    <td style="width:50px">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>  
										<tr>
				                            <td class="header" colspan="2"><b>Appearance - Context Menu</b> - <span class="headerNumber">12</span></td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_default.aspx">Default</a>
					                        </td>
					                        <td>aspnet_default.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_futura.aspx">Futura</a>
					                        </td>
					                        <td>aspnet_futura.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_vsnet.aspx">VSNET</a>
					                        </td>
					                        <td>aspnet_vsnet.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_windows.aspx">Windows</a>
					                        </td>
					                        <td>aspnet_windows.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_windowsxp.aspx">Windows XP</a>
					                        </td>
					                        <td>aspnet_windowsxp.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_righttoleft.aspx">Right to Left</a>
					                        </td>
					                        <td>aspnet_righttoleft.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_style1.aspx">Style 1</a>
					                        </td>
					                        <td>aspnet_style1.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_style2.aspx">Style 2</a>
					                        </td>
					                        <td>aspnet_style2.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_style3.aspx">Style 3</a>
					                        </td>
					                        <td>aspnet_style3.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_style9.aspx">Style 9</a>
					                        </td>
					                        <td>aspnet_style9.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_style10.aspx">Style 10</a>
					                        </td>
					                        <td>aspnet_style10.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_style13.aspx">Style 13</a>
					                        </td>
					                        <td>aspnet_style13.aspx</td>
				                        </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Appearance - Tab Strip</b>  - <span class="headerNumber">15 </span><b style="color:crimson">New</b></td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_tabstrip.aspx">Tab Strip</a>
					                        </td>
					                        <td>aspnet_tabstrip.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_tabstrip1.aspx">TabStrip1 Style</a>
					                        </td>
					                        <td>aspnet_tabstrip1.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_tabstrip2.aspx">TabStrip2 Style</a>
					                        </td>
					                        <td>aspnet_tabstrip2.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_tabstrip3.aspx">TabStrip3 Style</a>
					                        </td>
					                        <td>aspnet_tabstrip3.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_tabstrip4.aspx">TabStrip4 Style</a>
					                        </td>
					                        <td>aspnet_tabstrip4.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_tabstrip5.aspx">TabStrip5 Style</a>
					                        </td>
					                        <td>aspnet_tabstrip5.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_tabstrip6.aspx">TabStrip6 Style</a>
					                        </td>
					                        <td>aspnet_tabstrip6.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_tabstrip7.aspx">TabStrip7 Style</a>
					                        </td>
					                        <td>aspnet_tabstrip7.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_tabstrip8.aspx">TabStrip8 Style</a>
					                        </td>
					                        <td>aspnet_tabstrip8.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_tabstripyahoo.aspx">TabStrip Yahoo Style</a>
					                        </td>
					                        <td>aspnet_tabstripyahoo.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_tabstrip_wizard_src.aspx">Tab Strip - Wizard</a>
					                        </td>
					                        <td>aspnet_tabstrip_wizard_src.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_tabstrip_wizard2_src.aspx">Tab Strip - Wizard 2</a>
					                        </td>
					                        <td>aspnet_tabstrip_wizard2_src.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_addremovetabs.aspx">Add / Remove Tabs</a>
					                        </td>
					                        <td>aspnet_addremovetabs.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_addremovetabs2.aspx">Add / Remove Tabs with div</a>
					                        </td>
					                        <td>aspnet_addremovetabs2.aspx</td>
				                        </tr>
										
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_tabstrip_parent_child.aspx">Parent-child</a></td>
					                        <td>aspnet_tabstrip_parent_child.aspx</td>
				                        </tr>
				                        
										
										<tr>
				                            <td class="header" colspan="2"><b>Other Features</b>  - <span class="headerNumber">16</span></td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_imagemap.aspx">Image Map</a>
					                        </td>
					                        <td>aspnet_imagemap.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_urltarget.aspx">UrlTarget</a>
					                        </td>
					                        <td>aspnet_urltarget.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_fromdatabase.aspx">Using Database</a>
					                        </td>
					                        <td>aspnet_fromdatabase.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_serverevents_postback.aspx">Server events using page postback</a>
					                        </td>
					                        <td>aspnet_serverevents_postback.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_serverevents_ajaxpage.aspx">Server events using AJAXPage</a>
					                        </td>
					                        <td>aspnet_serverevents_ajaxpage.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_disableitem.aspx">Disable Item</a>
					                        </td>
					                        <td>aspnet_disableitem.aspx</td>
				                        </tr>
										
										<tr>
					                        <td class="link">
						                        <a href="aspnet_verticalfromxml.aspx">Vertical from XML</a>
					                        </td>
					                        <td>aspnet_verticalfromxml.aspx</td>
				                        </tr>
										
										<tr>
					                        <td class="link">
						                        <a href="aspnet_horizontalfromxml.aspx">Horizontal from XML</a>
					                        </td>
					                        <td>aspnet_horizonotalfromxml.aspx</td>
				                        </tr>
										
										<%--<tr>
					                        <td class="link">
						                        <a href="aspnet_dynamicInnerHTML.aspx">Dynamic menu item InnerHTML</a>
					                        </td>
					                        <td>aspnet_dynamicInnerHTML.aspx</td>
				                        </tr>--%>
										
										<tr>
					                        <td class="link">
						                        <a href="aspnet_navigation.aspx?id=item2">Navigation and master page</a>
					                        </td>
					                        <td>aspnet_navigation.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_sliding_effect.aspx">Custom Sliding Effect</a> <b style="color:crimson">New</b>
					                        </td>
					                        <td>aspnet_sliding_effect.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_custome_menu_content.aspx">Custom menu content</a> <b style="color:crimson">New</b>
					                        </td>
					                        <td>aspnet_custome_menu_content.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_multiple_menus.aspx">Multiple menus</a> 
					                        </td>
					                        <td>aspnet_multiple_menus.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_multiplemenus2.aspx">Multiple menus 2</a> 
					                        </td>
					                        <td>aspnet_multiplemenus2.aspx</td>
				                        </tr>
				                         <tr>
					                        <td class="link">
						                        <a href="aspnet_multipleitems_vertical.aspx">Long vertical menus</a> 
					                        </td>
					                        <td>aspnet_multipleitems_vertical.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_horizontaltabstrip.aspx">Horizontal menu and Tab Strip</a> 
					                        </td>
					                        <td>aspnet_horizontaltabstrip.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link" nowrap="nowrap">
						                        <a href="aspnet_hidemenuwithtimedelay.aspx">Hide menu with time delay</a> 
					                        </td>
					                        <td>aspnet_hidemenuwithtimedelay.aspx</td>
				                        </tr>
				                        
				                    </table>
                        	    </td>
                        	</tr>

			            </table>
            			
			            <br />
			            <br />
			            <span class="tdText">
				            You can find the ASP.NET examples in the <b>EasyMenu</b> folder.<br />
				            They have the <b>aspnet_</b> prefix.
			            </span>
                    </div>  
                    
                    <div id="divCSharp">
			            <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
                        	            <tr>
				                            <td class="header" colspan="2"><b>Appearance - Horizontal</b>  - <span class="headerNumber">6</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_horizontal_1.aspx" style="margin-right:100px;">Horizontal 1</a>
				                            </td>
					                        <td>cs_horizontal_1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_horizontal_2.aspx" style="margin-right:100px;">Horizontal 2</a>
				                            </td>
					                        <td>cs_horizontal_2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_horizontal_3.aspx" style="margin-right:100px;">Horizontal 3</a>
				                            </td>
					                        <td>cs_horizontal_3.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_horizontal_7.aspx" style="margin-right:100px;">Horizontal 7</a>
				                            </td>
					                        <td>cs_horizontal_7.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="header" colspan="2"><b>Appearance - Vertical</b>  - <span class="headerNumber">1 </span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_vertical_1.aspx" style="margin-right:100px;">Vertical 1</a>
				                            </td>
					                        <td>cs_vertical_1.aspx</td>
			                            </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Integration</b>  - <span class="headerNumber">5</span></td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_inside_usercontrol.aspx">Inside User Control</a>
					                        </td>
					                        <td>cs_inside_usercontrol.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_masterpage.aspx">With Master Page</a> 
					                        </td>
					                        <td>cs_masterpage.aspx</td>
				                        </tr>
										<%--<tr>
					                        <td class="link">
						                        <a href="cs_withtreeview.aspx">With TreeView</a>
					                        </td>
					                        <td>cs_withtreeview.aspx</td>
				                        </tr>--%>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_grid_with_easymenu.aspx">Use With Grid</a>
					                        </td>
					                        <td>cs_grid_with_easymenu.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_easymenu_inside_datagridcolumn.aspx">Inside DataGrid column</a>
					                        </td>
					                        <td>cs_easymenu_inside_datagridcolumn.aspx</td>
				                        </tr>
				                    </table>
                        	    </td>
								 
								<td style="width:50px">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>  
										<tr>
				                            <td class="header" colspan="2"><b>Appearance - Context Menu</b>  - <span class="headerNumber">5 </span></td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_windowsxp.aspx">Windows XP</a>
					                        </td>
					                        <td>cs_windowsxp.aspx</td>
				                        </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>From Database</b></td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_database_horizontal.aspx">Horizontal 1</a>
					                        </td>
					                        <td>cs_database_horizontal.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_database_vertical.aspx">Vertical 1</a>
					                        </td>
					                        <td>cs_database_vertical.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_database_horizontal_withuc.aspx">Horizontal inside User Control</a>
					                        </td>
					                        <td>cs_database_horizontal_withuc.aspx</td>
				                        </tr>
				                        
				                        <tr>
				                            <td class="header" colspan="2"><b>Appearance - Tab Strip</b>  - <span class="headerNumber">1 </span><b style="color:crimson">New</b></td>
				                        </tr>
				                       <%-- <tr>
					                        <td class="link">
						                        <a href="cs_tabstrip.aspx">Tab Strip</a>
					                        </td>
					                        <td>cs_tabstrip.aspx</td>
				                        </tr>--%>
				                        <tr>
				                            <td class="header" colspan="2"><b>Other Features</b>  - <span class="headerNumber">4</span></td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_fastloadingtime.aspx">Fast Loading Time</a>
					                        </td>
					                        <td>cs_fastloadingtime.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_multiple_menus.aspx">Multiple menus</a> 
					                        </td>
					                        <td>cs_multiple_menus.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_fromdatabase.aspx">Using Database</a>
					                        </td>
					                        <td>cs_fromdatabase.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_postback.aspx">Postback Persistance</a>
					                        </td>
					                        <td>cs_postback.aspx</td>
				                        </tr>
									</table>
								</td>
                        	</tr>

			            </table>
            			
			            <br />
			            <br />
			            <span class="tdText">
				            You can find the C# examples in the <b>EasyMenu</b> folder.<br />
				            They have the <b>cs_</b> prefix.
			            </span>
                    </div> 
                    
                    <div id="divVBNET">
			            <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
                        	            <tr>
				                            <td class="header" colspan="2"><b>Appearance - Horizontal</b>  - <span class="headerNumber">1 </span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_horizontal_1.aspx" style="margin-right:100px;">Horizontal 1</a>
				                            </td>
					                        <td>vb_horizontal_1.aspx</td>
			                            </tr>
										
										
										<tr>
				                            <td class="header" colspan="2"><b>Integration</b>   - <span class="headerNumber">5 </span></td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_inside_usercontrol.aspx">Inside User Control</a>
					                        </td>
					                        <td>vb_horizontal_1UC.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_masterpage.aspx">With Master Page</a> 
					                        </td>
					                        <td>vb_masterpage.aspx</td>
				                        </tr>
										<%--<tr>
					                        <td class="link">
						                        <a href="vb_withtreeview.aspx">With TreeView</a>
					                        </td>
					                        <td>vb_withtreeview.aspx</td>
				                        </tr>--%>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_grid_with_easymenu.aspx">Use With Grid</a>
					                        </td>
					                        <td>vb_grid_with_easymenu.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_easymenu_inside_datagridcolumn.aspx">Inside DataGrid column</a>
					                        </td>
					                        <td>vb_easymenu_inside_datagridcolumn.aspx</td>
				                        </tr>
				                        <tr>
				                            <td class="header" colspan="2"><b>Other Features</b>   - <span class="headerNumber">3 </span></td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_fromdatabase.aspx">Using Database</a>
					                        </td>
					                        <td>vb_fromdatabase.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_multiple_menus.aspx">Multiple menus</a> 
					                        </td>
					                        <td>vb_multiple_menus.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_postback.aspx">Postback Persistance</a>
					                        </td>
					                        <td>vb_postback.aspx</td>
				                        </tr>
				                    </table>
                        	    </td>
                        	    
                        	    <td style="width:50px">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>
										<tr>
				                            <td class="header" colspan="2"><b>Appearance - Context Menu</b>  - <span class="headerNumber">5 </span></td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_windowsxp.aspx">Windows XP</a>
					                        </td>
					                        <td>vb_windowsxp.aspx</td>
				                        </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>From Database</b></td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_database_horizontal.aspx">Horizontal 1</a>
					                        </td>
					                        <td>vb_database_horizontal.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_database_vertical.aspx">Vertical 1</a>
					                        </td>
					                        <td>vb_database_vertical.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_database_horizontal_withuc.aspx">Horizontal inside User Control</a>
					                        </td>
					                        <td>vb_database_horizontal_withuc.aspx</td>
				                        </tr>
				                        				                        
				      
				                        
									</table>
                        	    </td>
                        	</tr>

			            </table>
			            
			            <br /><br />
			            <span class="tdText">
				            You can find the VB.NET examples in the <b>EasyMenu</b> folder.<br />
				            They have the <b>vb_</b> prefix.
			            </span>
                    </div> 
                </td>
			</tr>
        </table>
        <br />
        <br />
        <a href="http://www.obout.com/em/">obout ASP.NET Easy Menu home</a>
        <br />
        <a href="http://www.obout.com">obout inc home</a>
       </div>                             
    </form>
</body>
</html>
