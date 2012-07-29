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
					lblPath.Text = "<b>Path to folder with ComboBox examples: </b>" + oXMLReader.ReadString();
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
    <title>obout ComboBox examples</title>
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
		
		//
	</script>
</head>
<body>
    <form id="form1" runat="server">
    
    <input id="ExamplesType" type="hidden" runat="server" />
    
    <span class="tdText">
        <a href="../Default.aspx">« Back to Suite Examples</a>
        <br /><br /><br />
        <span style="font-weight:bold;">obout ASP.NET ComboBox examples</span> (version 4.0.8, released on May 14, 2011)
        <br /> 
        <br />
        Select the examples you want to see:&#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(0)" value="divASPNET" class="tdText"/><span style="cursor: pointer" onclick="showExamplesFromSpan(0)">ASP.NET</span> &#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(1)" value="divCSharp" class="tdText"/><span style="cursor: pointer" onclick="showExamplesFromSpan(1)">C#</span> &#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(1)" value="divVBNET" class="tdText"/><span style="cursor: pointer" onclick="showExamplesFromSpan(1)">VB</span> &#160;&#160;&#160;
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
				                            <td class="header" colspan="2"><b>Appearance</b> - <span class="headerNumber">2</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_style_gallery.aspx">Style Gallery</a>
				                            </td>
					                        <td>aspnet_style_gallery.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_different_styles.aspx">Different Styles <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_different_styles.aspx</td>
			                            </tr>
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Autocomplete & Filtering</b> - <span class="headerNumber">2</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_autocomplete.aspx">Autocomplete</a>
				                            </td>
					                        <td>aspnet_autocomplete.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_filtering.aspx">Filtering</a>
				                            </td>
					                        <td>aspnet_filtering.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Load on Demand</b> - <span class="headerNumber">7</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_ondemand.aspx">Load Items on Demand</a>
				                            </td>
					                        <td>aspnet_ondemand.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_ondemand_paging.aspx">Load Items on Demand with Paging</a>
				                            </td>
					                        <td>aspnet_ondemand_paging.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_ondemand_virtual_scroll.aspx">Virtual Scrolling</a>
				                            </td>
					                        <td>aspnet_ondemand_virtual_scroll.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_ondemand_initial.aspx">Initial Text <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_ondemand_initial.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_ondemand_initial_js.aspx">Initial Text on Client-Side <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_ondemand_initial_js.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_ondemand_button.aspx">Load Items on Button Click  <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_ondemand_button.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_ondemand_minchars.aspx">Load Items with MinChars  <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_ondemand_minchars.aspx</td>
			                            </tr>
			                            
			                            
                                        
                                        <tr>
				                            <td class="header" colspan="2"><b>Multi-Columns</b> - <span class="headerNumber">5</span></td>
				                        </tr>				                        				                        
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_columns_grid.aspx">Grid-like Multi-Columns</a>
				                            </td>
					                        <td>aspnet_columns_grid.aspx</td>
			                            </tr>	
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_columns_grid_ondemand.aspx">Grid-like Multi-Columns on Demand</a>
				                            </td>
					                        <td>aspnet_columns_grid_ondemand.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_columns_grid_tooltips.aspx">Grid-like Multi-Columns with Tooltips <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_columns_grid_tooltips.aspx</td>
			                            </tr>			                            
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_columns_multiple.aspx">Multiple Rows and Columns</a>
				                            </td>
					                        <td>aspnet_columns_multiple.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_columns_states.aspx">State Selector</a>
				                            </td>
					                        <td>aspnet_columns_states.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Items with Icons</b> - <span class="headerNumber">4</span></td>
				                        </tr>				                        
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_icons_items.aspx">Items with Icons</a>
				                            </td>
					                        <td>aspnet_icons_items.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_icons_grid.aspx">Grid-like Multi-Columns with Icons</a>
				                            </td>
					                        <td>aspnet_icons_grid.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_icons_columns.aspx">Multiple Rows and Columns with Icons</a>
				                            </td>
					                        <td>aspnet_icons_columns.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_icons_database.aspx">Icons from Database <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_icons_database.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Templates</b> - <span class="headerNumber">4</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_templates_item.aspx">Item Templates</a>
				                            </td>
					                        <td>aspnet_templates_item.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_templates_header.aspx">Header Templates</a>
				                            </td>
					                        <td>aspnet_templates_header.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_templates_header_dynamic.aspx">Dynamic Header Templates <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_templates_header_dynamic.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_templates_footer.aspx">Footer Templates</a>
				                            </td>
					                        <td>aspnet_templates_footer.aspx</td>
			                            </tr>
			                            
			                             
                        	                               	            				                       
				                        <tr>
				                            <td class="header" colspan="2"><b>Populating with data</b> - <span class="headerNumber">5</span></td>
				                        </tr>				                        
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_populate_declarative.aspx">Declarative</a>
				                            </td>
					                        <td>aspnet_populate_declarative.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_populate_sds.aspx">SqlDataSource</a>
				                            </td>
					                        <td>aspnet_populate_sds.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_populate_ods.aspx">ObjectDataSource</a>
				                            </td>
					                        <td>aspnet_populate_ods.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_populate_collections.aspx">Generic Collections</a>
				                            </td>
					                        <td>aspnet_populate_collections.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_populate_dataset.aspx">DataSet</a>
				                            </td>
					                        <td>aspnet_populate_dataset.aspx</td>
			                            </tr>
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Item Selection</b> - <span class="headerNumber">6</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_selection_single.aspx">Single Item Selection</a>
				                            </td>
					                        <td>aspnet_selection_single.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_selection_multi.aspx">Multi Item Selection</a>
				                            </td>
					                        <td>aspnet_selection_multi.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_selection_single_get.aspx">Get Selected Item</a>
				                            </td>
					                        <td>aspnet_selection_single_get.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_selection_multi_get.aspx">Get Selected Items</a>
				                            </td>
					                        <td>aspnet_selection_multi_get.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_selection_single_set.aspx">Set Selected Item <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_selection_single_set.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_selection_multi_set.aspx">Set Selected Items <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_selection_multi_set.aspx</td>
			                            </tr>
				                    </table>
                        	    </td>
                        	    
                        	    <td width="50">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Mode</b> - <span class="headerNumber">2</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_mode_combobox.aspx">ComboBox</a>
				                            </td>
					                        <td>aspnet_mode_combobox.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_mode_textbox.aspx">TextBox</a>
				                            </td>
					                        <td>aspnet_mode_textbox.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Master/Detail</b> - <span class="headerNumber">3</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_master_detail.aspx">Master/Detail</a>
				                            </td>
					                        <td>aspnet_master_detail.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_master_detail_unlimited.aspx">Unlimited Detail Levels</a>
				                            </td>
					                        <td>aspnet_master_detail_unlimited.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_master_detail_cascading.aspx">Cascading ComboBoxes</a>
				                            </td>
					                        <td>aspnet_master_detail_cascading.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Integration</b> - <span class="headerNumber">10</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_integration_checkboxes.aspx">Items with ASP.NET CheckBoxes</a>
				                            </td>
					                        <td>aspnet_integration_checkboxes.aspx</td>
			                            </tr>			                            
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_integration_oboutcheckboxes.aspx">Items with Obout CheckBoxes</a>
				                            </td>
					                        <td>aspnet_integration_oboutcheckboxes.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_integration_select_checkboxes.aspx">Select All ASP.NET CheckBoxes <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_integration_select_checkboxes.aspx</td>
			                            </tr>			                            
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_integration_select_oboutcheckboxes.aspx">Select All Obout CheckBoxes <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_integration_select_oboutcheckboxes.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_integration_radiobtn.aspx">RadioButtons inside ComboBox</a>
				                            </td>
					                        <td>aspnet_integration_radiobtn.aspx</td>
			                            </tr>
			                            <%--<tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_integration_tree.aspx">TreeView inside ComboBox</a>
				                            </td>
					                        <td>aspnet_integration_tree.aspx</td>
			                            </tr>--%>
			                           <%-- <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_integration_tree_full_path.aspx">TreeView with Full Path <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_integration_tree_full_path.aspx</td>
			                            </tr>--%>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_integration_grid.aspx">ComboBox inside Grid</a>
				                            </td>
					                        <td>aspnet_integration_grid.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_integration_grid_inside.aspx">Grid inside ComboBox <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_integration_grid_inside.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_integration_combobox_masterdetail.aspx">Master/Detail ComboBox inside Grid <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_integration_combobox_masterdetail.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_integration_checkboxes_ondemand.aspx">CheckBox Controls Loaded On-Demand <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_integration_checkboxes_ondemand.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_integration_validate.aspx">Validate with ASP.NET Validators <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_integration_validate.aspx</td>
			                            </tr>
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Settings</b> - <span class="headerNumber">8</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_settings_customtext.aspx">AllowCustomText</a>
				                            </td>
					                        <td>aspnet_settings_customtext.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_settings_allowedit.aspx">AllowEdit</a>
				                            </td>
					                        <td>aspnet_settings_allowedit.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_settings_postback.aspx">AutoPostBack</a>
				                            </td>
					                        <td>aspnet_settings_postback.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_settings_autovalidate.aspx">AutoValidate</a>
				                            </td>
					                        <td>aspnet_settings_autovalidate.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_settings_height.aspx">Height</a>
				                            </td>
					                        <td>aspnet_settings_height.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_settings_menuwidth.aspx">MenuWidth</a>
				                            </td>
					                        <td>aspnet_settings_menuwidth.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_settings_openonfocus.aspx">OpenOnFocus</a>
				                            </td>
					                        <td>aspnet_settings_openonfocus.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_settings_width.aspx">Width</a>
				                            </td>
					                        <td>aspnet_settings_width.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Server-Side API</b> - <span class="headerNumber">5</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_apiserver_events.aspx">Server-Side Events</a>
				                            </td>
					                        <td>aspnet_apiserver_events.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_apiserver_enable.aspx">Enable / Disable</a>
				                            </td>
					                        <td>aspnet_apiserver_enable.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_apiserver_customtext.aspx">Insert Custom Items <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_apiserver_customtext.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_apiserver_get_values.aspx">Get Values from Multiple Columns <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_apiserver_get_values.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_apiserver_tooltips.aspx">Tooltips <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_apiserver_tooltips.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Client-Side API</b> - <span class="headerNumber">6</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_apiclient_events.aspx">Client-Side Events</a>
				                            </td>
					                        <td>aspnet_apiclient_events.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_apiclient_items.aspx">Add / Remove Items</a>
				                            </td>
					                        <td>aspnet_apiclient_items.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_apiclient_items_columns.aspx">Add Multi-Column Items</a>
				                            </td>
					                        <td>aspnet_apiclient_items_columns.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_apiclient_enable.aspx">Enable / Disable</a>
				                            </td>
					                        <td>aspnet_apiclient_enable.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_apiclient_selected.aspx">Get Selected Item</a>
				                            </td>
					                        <td>aspnet_apiclient_selected.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_reset_selection.aspx">Reset Selection <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_reset_selection.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_apiclient_select_all.aspx">Select / Deselect All Items <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_apiclient_select_all.aspx</td>
			                            </tr>
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Appearance Customization</b> - <span class="headerNumber">1</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="aspnet_customization_align.aspx">Aligning Items <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_customization_align.aspx</td>
			                            </tr>
				                    </table>
                        	    </td>
                        	</tr>

			            </table>
            			
			            <br />
			            <br />
			            <span class="tdText">
				            You can find the ASP.NET examples in the <b>ComboBox</b> folder.<br />
				            They have the <b>aspnet_</b> prefix.
			            </span>
                    </div>          
                    
                    <div id="divCSharp">
                        <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
                        	            <tr>
				                            <td class="header" colspan="2"><b>Appearance</b> - <span class="headerNumber">2</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_style_gallery.aspx">Style Gallery</a>
				                            </td>
					                        <td>cs_style_gallery.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_different_styles.aspx">Different Styles <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_different_styles.aspx</td>
			                            </tr>		                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Autocomplete & Filtering</b> - <span class="headerNumber">2</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_autocomplete.aspx">Autocomplete</a>
				                            </td>
					                        <td>cs_autocomplete.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_filtering.aspx">Filtering</a>
				                            </td>
					                        <td>cs_filtering.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Load on Demand</b> - <span class="headerNumber">7</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_ondemand.aspx">Load Items on Demand</a>
				                            </td>
					                        <td>cs_ondemand.aspx</td>
			                            </tr>
			                             <tr>
				                            <td class="link">
					                            <a href="cs_ondemand_paging.aspx">Load Items on Demand with Paging</a>
				                            </td>
					                        <td>cs_ondemand_paging.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_ondemand_virtual_scroll.aspx">Virtual Scrolling</a>
				                            </td>
					                        <td>cs_ondemand_virtual_scroll.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_ondemand_initial.aspx">Initial Text <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_ondemand_initial.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_ondemand_initial_js.aspx">Initial Text on Client-Side <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_ondemand_initial_js.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_ondemand_button.aspx">Load Items on Button Click  <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_ondemand_button.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_ondemand_minchars.aspx">Load Items with MinChars  <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_ondemand_minchars.aspx</td>
			                            </tr>
			                            
                                        
                                         <tr>
				                            <td class="header" colspan="2"><b>Multi-Columns</b> - <span class="headerNumber">5</span></td>
				                        </tr>				                        				                        
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_columns_grid.aspx">Grid-like Multi-Columns</a>
				                            </td>
					                        <td>cs_columns_grid.aspx</td>
			                            </tr>	
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_columns_grid_ondemand.aspx">Grid-like Multi-Columns on Demand</a>
				                            </td>
					                        <td>cs_columns_grid_ondemand.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_columns_grid_tooltips.aspx">Grid-like Multi-Columns with Tooltips <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_columns_grid_tooltips.aspx</td>
			                            </tr>			                            
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_columns_multiple.aspx">Multiple Rows and Columns</a>
				                            </td>
					                        <td>cs_columns_multiple.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_columns_states.aspx">State Selector</a>
				                            </td>
					                        <td>cs_columns_states.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Items with Icons</b> - <span class="headerNumber">4</span></td>
				                        </tr>				                        
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_icons_items.aspx">Items with Icons</a>
				                            </td>
					                        <td>cs_icons_items.aspx</td>
			                            </tr>
			                             <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_icons_grid.aspx">Grid-like Multi-Columns with Icons</a>
				                            </td>
					                        <td>cs_icons_grid.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_icons_columns.aspx">Multiple Rows and Columns with Icons</a>
				                            </td>
					                        <td>cs_icons_columns.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_icons_database.aspx">Icons from Database <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_icons_database.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Templates</b> - <span class="headerNumber">4</span></td>
				                        </tr>
				                        
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_templates_item.aspx">Item Templates</a>
				                            </td>
					                        <td>cs_templates_item.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_templates_header.aspx">Header Templates</a>
				                            </td>
					                        <td>cs_templates_header.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_templates_header_dynamic.aspx">Dynamic Header Templates <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_templates_header_dynamic.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_templates_footer.aspx">Footer Templates</a>
				                            </td>
					                        <td>cs_templates_footer.aspx</td>
			                            </tr>
			                            
			                            
			                             
                        	                               	            				                       
				                        <tr>
				                            <td class="header" colspan="2"><b>Populating with data</b> - <span class="headerNumber">5</span></td>
				                        </tr>				                        
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_populate_declarative.aspx">Declarative</a>
				                            </td>
					                        <td>cs_populate_declarative.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_populate_sds.aspx">SqlDataSource</a>
				                            </td>
					                        <td>cs_populate_sds.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_populate_ods.aspx">ObjectDataSource</a>
				                            </td>
					                        <td>cs_populate_ods.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_populate_collections.aspx">Generic Collections</a>
				                            </td>
					                        <td>cs_populate_collections.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_populate_dataset.aspx">DataSet</a>
				                            </td>
					                        <td>cs_populate_dataset.aspx</td>
			                            </tr>
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Item Selection</b> - <span class="headerNumber">6</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_selection_single.aspx">Single Item Selection</a>
				                            </td>
					                        <td>cs_selection_single.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_selection_multi.aspx">Multi Item Selection</a>
				                            </td>
					                        <td>cs_selection_multi.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_selection_single_get.aspx">Get Selected Item</a>
				                            </td>
					                        <td>cs_selection_single_get.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_selection_multi_get.aspx">Get Selected Items</a>
				                            </td>
					                        <td>cs_selection_multi_get.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_selection_single_set.aspx">Set Selected Item <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_selection_single_set.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_selection_multi_set.aspx">Set Selected Items <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_selection_multi_set.aspx</td>
			                            </tr>
				                    </table>
                        	    </td>
                        	    
                        	    <td width="50">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>
			                          
			                            <tr>
				                            <td class="header" colspan="2"><b>Mode</b> - <span class="headerNumber">2</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_mode_combobox.aspx">ComboBox</a>
				                            </td>
					                        <td>cs_mode_combobox.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_mode_textbox.aspx">TextBox</a>
				                            </td>
					                        <td>cs_mode_textbox.aspx</td>
			                            </tr>
			                            
			                            
			                             <tr>
				                            <td class="header" colspan="2"><b>Master/Detail</b> - <span class="headerNumber">3</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_master_detail.aspx">Master/Detail</a>
				                            </td>
					                        <td>cs_master_detail.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_master_detail_unlimited.aspx">Unlimited Detail Levels</a>
				                            </td>
					                        <td>cs_master_detail_unlimited.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_master_detail_cascading.aspx">Cascading ComboBoxes</a>
				                            </td>
					                        <td>cs_master_detail_cascading.aspx</td>
			                            </tr>
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Integration</b> - <span class="headerNumber">10</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_integration_checkboxes.aspx">Items with ASP.NET CheckBoxes</a>
				                            </td>
					                        <td>cs_integration_checkboxes.aspx</td>
			                            </tr>			                            
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_integration_oboutcheckboxes.aspx">Items with Obout CheckBoxes</a>
				                            </td>
					                        <td>cs_integration_oboutcheckboxes.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_integration_select_checkboxes.aspx">Select All ASP.NET CheckBoxes <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_integration_select_checkboxes.aspx</td>
			                            </tr>			                            
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_integration_select_oboutcheckboxes.aspx">Select All Obout CheckBoxes <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_integration_select_oboutcheckboxes.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_integration_radiobtn.aspx">RadioButtons inside ComboBox</a>
				                            </td>
					                        <td>cs_integration_radiobtn.aspx</td>
			                            </tr>
			                            <%--<tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_integration_tree.aspx">TreeView inside ComboBox</a>
				                            </td>
					                        <td>cs_integration_tree.aspx</td>
			                            </tr>--%>
			                           <%-- <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_integration_tree_full_path.aspx">TreeView with Full Path <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_integration_tree_full_path.aspx</td>
			                            </tr>--%>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_integration_grid.aspx">ComboBox inside Grid</a>
				                            </td>
					                        <td>cs_integration_grid.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_integration_grid_inside.aspx">Grid inside ComboBox <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_integration_grid_inside.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_integration_combobox_masterdetail.aspx">Master/Detail ComboBox inside Grid <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_integration_combobox_masterdetail.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_integration_checkboxes_ondemand.aspx">CheckBox Controls Loaded On-Demand <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_integration_checkboxes_ondemand.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_integration_validate.aspx">Validate with ASP.NET Validators <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_integration_validate.aspx</td>
			                            </tr>

			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Settings</b> - <span class="headerNumber">8</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_settings_customtext.aspx">AllowCustomText</a>
				                            </td>
					                        <td>cs_settings_customtext.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_settings_allowedit.aspx">AllowEdit</a>
				                            </td>
					                        <td>cs_settings_allowedit.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_settings_postback.aspx">AutoPostBack</a>
				                            </td>
					                        <td>cs_settings_postback.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_settings_autovalidate.aspx">AutoValidate</a>
				                            </td>
					                        <td>cs_settings_autovalidate.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_settings_height.aspx">Height</a>
				                            </td>
					                        <td>cs_settings_height.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_settings_menuwidth.aspx">MenuWidth</a>
				                            </td>
					                        <td>cs_settings_menuwidth.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_settings_openonfocus.aspx">OpenOnFocus</a>
				                            </td>
					                        <td>cs_settings_openonfocus.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_settings_width.aspx">Width</a>
				                            </td>
					                        <td>cs_settings_width.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Server-Side API</b> - <span class="headerNumber">5</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_apiserver_events.aspx">Server-Side Events</a>
				                            </td>
					                        <td>cs_apiserver_events.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_apiserver_enable.aspx">Enable / Disable</a>
				                            </td>
					                        <td>cs_apiserver_enable.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_apiserver_customtext.aspx">Insert Custom Items <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_apiserver_customtext.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_apiserver_get_values.aspx">Get Values from Multiple Columns <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_apiserver_get_values.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_apiserver_tooltips.aspx">Tooltips <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_apiserver_tooltips.aspx</td>
			                            </tr>
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Client-Side API</b> - <span class="headerNumber">7</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_apiclient_events.aspx">Client-Side Events</a>
				                            </td>
					                        <td>cs_apiclient_events.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_apiclient_items.aspx">Add / Remove Items</a>
				                            </td>
					                        <td>cs_apiclient_items.aspx</td>
			                            </tr>
			                             <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_apiclient_items_columns.aspx">Add Multi-Column Items</a>
				                            </td>
					                        <td>cs_apiclient_items_columns.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_apiclient_enable.aspx">Enable / Disable</a>
				                            </td>
					                        <td>cs_apiclient_enable.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_apiclient_selected.aspx">Get Selected Item</a>
				                            </td>
					                        <td>cs_apiclient_selected.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_reset_selection.aspx">Reset Selection <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_reset_selection.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_apiclient_select_all.aspx">Select / Deselect All Items <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_apiclient_select_all.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="header" colspan="2"><b>Appearance Customization</b> - <span class="headerNumber">1</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="cs_customization_align.aspx">Aligning Items <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_customization_align.aspx</td>
			                            </tr>
				                    </table>
                        	    </td>
                        	</tr>

			            </table>
            			
			            <br />
			            <br />
			            <span class="tdText">
				             You can find the C# examples in the <b>ComboBox</b> folder.<br />
				            They have the <b>cs_</b> prefix.
			            </span>
                    </div>   
                    <div id="divVBNET">
                        <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
                        	            <tr>
				                            <td class="header" colspan="2"><b>Appearance</b> - <span class="headerNumber">2</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_style_gallery.aspx">Style Gallery</a>
				                            </td>
					                        <td>vb_style_gallery.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_different_styles.aspx">Different Styles <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_different_styles.aspx</td>
			                            </tr>		                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Autocomplete & Filtering</b> - <span class="headerNumber">2</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_autocomplete.aspx">Autocomplete</a>
				                            </td>
					                        <td>vb_autocomplete.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_filtering.aspx">Filtering</a>
				                            </td>
					                        <td>vb_filtering.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Load on Demand</b> - <span class="headerNumber">7</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_ondemand.aspx">Load Items on Demand</a>
				                            </td>
					                        <td>vb_ondemand.aspx</td>
			                            </tr>
			                             <tr>
				                            <td class="link">
					                            <a href="vb_ondemand_paging.aspx">Load Items on Demand with Paging</a>
				                            </td>
					                        <td>vb_ondemand_paging.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_ondemand_virtual_scroll.aspx">Virtual Scrolling</a>
				                            </td>
					                        <td>vb_ondemand_virtual_scroll.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_ondemand_initial.aspx">Initial Text <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_ondemand_initial.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_ondemand_initial_js.aspx">Initial Text on Client-Side <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_ondemand_initial_js.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_ondemand_button.aspx">Load Items on Button Click  <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_ondemand_button.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_ondemand_minchars.aspx">Load Items with MinChars  <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_ondemand_minchars.aspx</td>
			                            </tr>
			                            
                                        
                                       <tr>
				                            <td class="header" colspan="2"><b>Multi-Columns</b> - <span class="headerNumber">5</span></td>
				                        </tr>				                        				                        
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_columns_grid.aspx">Grid-like Multi-Columns</a>
				                            </td>
					                        <td>vb_columns_grid.aspx</td>
			                            </tr>	
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_columns_grid_ondemand.aspx">Grid-like Multi-Columns on Demand</a>
				                            </td>
					                        <td>vb_columns_grid_ondemand.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_columns_grid_tooltips.aspx">Grid-like Multi-Columns with Tooltips <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_columns_grid_tooltips.aspx</td>
			                            </tr>			                            
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_columns_multiple.aspx">Multiple Rows and Columns</a>
				                            </td>
					                        <td>vb_columns_multiple.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_columns_states.aspx">State Selector</a>
				                            </td>
					                        <td>vb_columns_states.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Items with Icons</b> - <span class="headerNumber">4</span></td>
				                        </tr>				                        
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_icons_items.aspx">Items with Icons</a>
				                            </td>
					                        <td>vb_icons_items.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_icons_grid.aspx">Grid-like Multi-Columns with Icons</a>
				                            </td>
					                        <td>vb_icons_grid.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_icons_columns.aspx">Multiple Rows and Columns with Icons</a>
				                            </td>
					                        <td>vb_icons_columns.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_icons_database.aspx">Icons from Database <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_icons_database.aspx</td>
			                            </tr>
			                            
			                            	                            
			                          	 <tr>
				                            <td class="header" colspan="2"><b>Templates</b> - <span class="headerNumber">4</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_templates_item.aspx">Item Templates</a>
				                            </td>
					                        <td>vb_templates_item.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_templates_header.aspx">Header Templates</a>
				                            </td>
					                        <td>vb_templates_header.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_templates_header_dynamic.aspx">Dynamic Header Templates <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_templates_header_dynamic.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_templates_footer.aspx">Footer Templates</a>
				                            </td>
					                        <td>vb_templates_footer.aspx</td>
			                            </tr>                           
			                            			                             
                        	                               	            				                       
				                        <tr>
				                            <td class="header" colspan="2"><b>Populating with data</b> - <span class="headerNumber">5</span></td>
				                        </tr>				                        
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_populate_declarative.aspx">Declarative</a>
				                            </td>
					                        <td>vb_populate_declarative.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_populate_sds.aspx">SqlDataSource</a>
				                            </td>
					                        <td>vb_populate_sds.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_populate_ods.aspx">ObjectDataSource</a>
				                            </td>
					                        <td>vb_populate_ods.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_populate_collections.aspx">Generic Collections</a>
				                            </td>
					                        <td>vb_populate_collections.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_populate_dataset.aspx">DataSet</a>
				                            </td>
					                        <td>vb_populate_dataset.aspx</td>
			                            </tr>
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Item Selection</b> - <span class="headerNumber">6</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_selection_single.aspx">Single Item Selection</a>
				                            </td>
					                        <td>vb_selection_single.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_selection_multi.aspx">Multi Item Selection</a>
				                            </td>
					                        <td>vb_selection_multi.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_selection_single_get.aspx">Get Selected Item</a>
				                            </td>
					                        <td>vb_selection_single_get.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_selection_multi_get.aspx">Get Selected Items</a>
				                            </td>
					                        <td>vb_selection_multi_get.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_selection_single_set.aspx">Set Selected Item <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_selection_single_set.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_selection_multi_set.aspx">Set Selected Items <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_selection_multi_set.aspx</td>
			                            </tr>
				                    </table>
                        	    </td>
                        	    
                        	    <td width="50">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>
			                            <tr>
				                            <td class="header" colspan="2"><b>Mode</b> - <span class="headerNumber">2</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_mode_combobox.aspx">ComboBox</a>
				                            </td>
					                        <td>vb_mode_combobox.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_mode_textbox.aspx">TextBox</a>
				                            </td>
					                        <td>vb_mode_textbox.aspx</td>
			                            </tr>
			                            
			                            			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Master/Detail</b> - <span class="headerNumber">3</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_master_detail.aspx">Master/Detail</a>
				                            </td>
					                        <td>vb_master_detail.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_master_detail_unlimited.aspx">Unlimited Detail Levels</a>
				                            </td>
					                        <td>vb_master_detail_unlimited.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_master_detail_cascading.aspx">Cascading ComboBoxes</a>
				                            </td>
					                        <td>vb_master_detail_cascading.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Integration</b> - <span class="headerNumber">10</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_integration_checkboxes.aspx">Items with ASP.NET CheckBoxes</a>
				                            </td>
					                        <td>vb_integration_checkboxes.aspx</td>
			                            </tr>			                            
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_integration_oboutcheckboxes.aspx">Items with Obout CheckBoxes</a>
				                            </td>
					                        <td>vb_integration_oboutcheckboxes.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_integration_select_checkboxes.aspx">Select All ASP.NET CheckBoxes <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_integration_select_checkboxes.aspx</td>
			                            </tr>			                            
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_integration_select_oboutcheckboxes.aspx">Select All Obout CheckBoxes <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_integration_select_oboutcheckboxes.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_integration_radiobtn.aspx">RadioButtons inside ComboBox</a>
				                            </td>
					                        <td>vb_integration_radiobtn.aspx</td>
			                            </tr>
			                           <%-- <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_integration_tree.aspx">TreeView inside ComboBox</a>
				                            </td>
					                        <td>vb_integration_tree.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_integration_tree_full_path.aspx">TreeView with Full Path <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_integration_tree_full_path.aspx</td>
			                            </tr>--%>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_integration_grid.aspx">ComboBox inside Grid</a>
				                            </td>
					                        <td>vb_integration_grid.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_integration_grid_inside.aspx">Grid inside ComboBox <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_integration_grid_inside.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_integration_combobox_masterdetail.aspx">Master/Detail ComboBox inside Grid <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_integration_combobox_masterdetail.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_integration_checkboxes_ondemand.aspx">CheckBox Controls Loaded On-Demand <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_integration_checkboxes_ondemand.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_integration_validate.aspx">Validate with ASP.NET Validators <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_integration_validate.aspx</td>
			                            </tr>

			                           
			                            <tr>
				                            <td class="header" colspan="2"><b>Settings</b> - <span class="headerNumber">8</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_settings_customtext.aspx">AllowCustomText</a>
				                            </td>
					                        <td>vb_settings_customtext.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_settings_allowedit.aspx">AllowEdit</a>
				                            </td>
					                        <td>vb_settings_allowedit.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_settings_postback.aspx">AutoPostBack</a>
				                            </td>
					                        <td>vb_settings_postback.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_settings_autovalidate.aspx">AutoValidate</a>
				                            </td>
					                        <td>vb_settings_autovalidate.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_settings_height.aspx">Height</a>
				                            </td>
					                        <td>vb_settings_height.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_settings_menuwidth.aspx">MenuWidth</a>
				                            </td>
					                        <td>vb_settings_menuwidth.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_settings_openonfocus.aspx">OpenOnFocus</a>
				                            </td>
					                        <td>vb_settings_openonfocus.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_settings_width.aspx">Width</a>
				                            </td>
					                        <td>vb_settings_width.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Server-Side API</b> - <span class="headerNumber">5</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_apiserver_events.aspx">Server-Side Events</a>
				                            </td>
					                        <td>vb_apiserver_events.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_apiserver_enable.aspx">Enable / Disable</a>
				                            </td>
					                        <td>vb_apiserver_enable.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_apiserver_customtext.aspx">Insert Custom Items <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_apiserver_customtext.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_apiserver_get_values.aspx">Get Values from Multiple Columns <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_apiserver_get_values.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_apiserver_tooltips.aspx">Tooltips <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_apiserver_tooltips.aspx</td>
			                            </tr>
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Client-Side API</b> - <span class="headerNumber">7</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_apiclient_events.aspx">Client-Side Events</a>
				                            </td>
					                        <td>vb_apiclient_events.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_apiclient_items.aspx">Add / Remove Items</a>
				                            </td>
					                        <td>vb_apiclient_items.aspx</td>
			                            </tr>
			                             <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_apiclient_items_columns.aspx">Add Multi-Column Items</a>
				                            </td>
					                        <td>vb_apiclient_items_columns.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_apiclient_enable.aspx">Enable / Disable</a>
				                            </td>
					                        <td>vb_apiclient_enable.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_apiclient_selected.aspx">Get Selected Item</a>
				                            </td>
					                        <td>vb_apiclient_selected.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_reset_selection.aspx">Reset Selection <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_reset_selection.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_apiclient_select_all.aspx">Select / Deselect All Items <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_apiclient_select_all.aspx</td>
			                            </tr>
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Appearance Customization</b> - <span class="headerNumber">1</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link" nowrap="nowrap">
					                            <a href="vb_customization_align.aspx">Aligning Items <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_customization_align.aspx</td>
			                            </tr>
				                    </table>
                        	    </td>
                        	</tr>

			            </table>
            			
			            <br />
			            <br />
			            <span class="tdText">
				             You can find the VB examples in the <b>ComboBox</b> folder.<br />
				            They have the <b>vb_</b> prefix.
			            </span>
                    </div>                                                          
                 </td>
            </tr>
        </table>
        
        <br />
        <br />
        <a href="http://www.obout.com/combobox">obout ComboBox home</a>
        <br />
        <a href="http://www.obout.com">obout inc home</a>
       </span>
    </form>
</body>
</html>
