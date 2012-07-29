<%@ Page Language="C#" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
					lblPath.Text = "<b>Path to folder with SuperForm examples: </b>" + oXMLReader.ReadString();
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

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>obout SuperForm examples</title>
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
        <span style="font-weight:bold;">obout ASP.NET Super Form examples</span> (version 1.0.7, released on May 30, 2011)
        <br /> 
        <br />
        Select the examples you want to see:&#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(0)" value="divASPNET" class="tdText"/><span style="cursor: pointer" onclick="showExamplesFromSpan(0)">ASP.NET</span> &#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(1)" value="divCSharp" class="tdText"/><span style="cursor: pointer" onclick="showExamplesFromSpan(1)">C#</span> &#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(2)" value="divVBNET" class="tdText"/><span style="cursor: pointer" onclick="showExamplesFromSpan(2)">VB</span> &#160;&#160;&#160;
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
				                            <td class="header" colspan="2"><b>First Look</b> - <span class="headerNumber">2</span></td>
				                        </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_firstlook_quick.aspx">Quick Setup</a>
				                            </td>
					                        <td>aspnet_firstlook_quick.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_firstlook_checkout.aspx">Checkout</a>
				                            </td>
					                        <td>aspnet_firstlook_checkout.aspx</td>
			                            </tr>
			                            
                        	            
                        	           <tr>
				                            <td class="header" colspan="2"><b>Appearance</b> - <span class="headerNumber">2</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_live_styles.aspx">Live Styles</a>
				                            </td>
					                        <td>aspnet_live_styles.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_autoformat.aspx">Auto Format</a>
				                            </td>
					                        <td>aspnet_autoformat.aspx</td>
			                            </tr>
                                        

			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Fields</b> - <span class="headerNumber">8</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_fields_autogenerate.aspx">Auto Generate Fields</a>
				                            </td>
					                        <td>aspnet_fields_autogenerate.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_fields_boundfield.aspx">BoundField</a>
				                            </td>
					                        <td>aspnet_fields_boundfield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_fields_checkboxfield.aspx">CheckBoxField</a>
				                            </td>
					                        <td>aspnet_fields_checkboxfield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_fields_commandfield.aspx">CommandField</a>
				                            </td>
					                        <td>aspnet_fields_commandfield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_fields_datefield.aspx">DateField</a>
				                            </td>
					                        <td>aspnet_fields_datefield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_fields_dropdownlistfield.aspx">DropDownListField</a>
				                            </td>
					                        <td>aspnet_fields_dropdownlistfield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_fields_multilinefield.aspx">MultiLineField</a>
				                            </td>
					                        <td>aspnet_fields_multilinefield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_fields_templatefield.aspx">TemplateField</a>
				                            </td>
					                        <td>aspnet_fields_templatefield.aspx</td>
			                            </tr>             


                                        <tr>
				                            <td class="header" colspan="2"><b>Add / Edit / Delete</b> - <span class="headerNumber">6</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_commands_autogenerate.aspx">Auto Generate Command Buttons</a>
				                            </td>
					                        <td>aspnet_commands_autogenerate.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_commands_customize.aspx">Customize Command Buttons</a>
				                            </td>
					                        <td>aspnet_commands_customize.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_commands_confirmation.aspx">Request User Confirmation</a>
				                            </td>
					                        <td>aspnet_commands_confirmation.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_commands_addonly.aspx">Add-Only Form</a>
				                            </td>
					                        <td>aspnet_commands_addonly.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_commands_editonly.aspx">Edit-Only Form</a>
				                            </td>
					                        <td>aspnet_commands_editonly.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_commands_default.aspx">Default Values for Add <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_commands_default.aspx</td>
			                            </tr>
                   


                                        <tr>
				                            <td class="header" colspan="2"><b>Layout</b> - <span class="headerNumber">6</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_layout_direction.aspx">Direction</a>
				                            </td>
					                        <td>aspnet_layout_direction.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_layout_field_sets.aspx">Field Sets</a>
				                            </td>
					                        <td>aspnet_layout_field_sets.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_layout_field_sets_span.aspx">Field Sets with Column Span</a>
				                            </td>
					                        <td>aspnet_layout_field_sets_span.aspx</td>
			                            </tr>
			                               <tr>
				                            <td class="link">
					                            <a href="aspnet_layout_tabs.aspx">Field Sets with Tabs <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_layout_tabs.aspx</td>
			                            </tr>
                                        </tr>
			                               <tr>
				                            <td class="link">
					                            <a href="aspnet_layout_survey.aspx">Multi-Step Survey <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_layout_survey.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_layout_width.aspx">Width</a>
				                            </td>
					                        <td>aspnet_layout_width.aspx</td>
			                            </tr>



                                        <tr>
				                            <td class="header" colspan="2"><b>Master / Detail</b> - <span class="headerNumber">4</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_master_detail_grid.aspx">Master Grid</a>
				                            </td>
					                        <td>aspnet_master_detail_grid.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_master_detail_combobox.aspx">Master ComboBox</a>
				                            </td>
					                        <td>aspnet_master_detail_combobox.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_master_detail_listbox.aspx">Master ListBox</a>
				                            </td>
					                        <td>aspnet_master_detail_listbox.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_master_detail_separate.aspx">Add / Edit in Separate Page</a>
				                            </td>
					                        <td>aspnet_master_detail_separate.aspx</td>
			                            </tr>

                            
                                        <tr>
				                            <td class="header" colspan="2"><b>Templates</b> - <span class="headerNumber">11</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_templates_combobox.aspx">ComboBox Field</a>
				                            </td>
					                        <td>aspnet_templates_combobox.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_templates_combobox_ondemand.aspx">On-Demand ComboBox Field</a>
				                            </td>
					                        <td>aspnet_templates_combobox_ondemand.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_templates_combobox_cascading.aspx">Cascading ComboBox Field</a>
				                            </td>
					                        <td>aspnet_templates_combobox_cascading.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_templates_combobox_multilevel.aspx">MultiLevel ComboBox Field</a>
				                            </td>
					                        <td>aspnet_templates_combobox_multilevel.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_templates_combobox_multi.aspx">MultiSelect ComboBox Field</a>
				                            </td>
					                        <td>aspnet_templates_combobox_multi.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_templates_listbox.aspx">ListBox Field</a>
				                            </td>
					                        <td>aspnet_templates_listbox.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_templates_listbox_multi.aspx">MultiSelect ListBox Field</a>
				                            </td>
					                        <td>aspnet_templates_listbox_multi.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_templates_editor.aspx">HTML Editor Field</a>
				                            </td>
					                        <td>aspnet_templates_editor.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_templates_fileupload.aspx">FileUploadProgress Field</a>
				                            </td>
					                        <td>aspnet_templates_fileupload.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_templates_checkboxlist.aspx">CheckBoxList Field</a>
				                            </td>
					                        <td>aspnet_templates_checkboxlist.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_templates_radiobuttonlist.aspx">RadioButtonList Field</a>
				                            </td>
					                        <td>aspnet_templates_radiobuttonlist.aspx</td>
			                            </tr>
			                            



                                        <tr>
				                            <td class="header" colspan="2"><b>Validation</b> - <span class="headerNumber">7</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_validation_required.aspx">Required Fields</a>
				                            </td>
					                        <td>aspnet_validation_required.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_validation_type.aspx">Type Validation</a>
				                            </td>
					                        <td>aspnet_validation_type.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_validation_custom.aspx">RegEx & Custom Validation</a>
				                            </td>
					                        <td>aspnet_validation_custom.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_validation_summary.aspx">Validation Summary</a>
				                            </td>
					                        <td>aspnet_validation_summary.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_validation_inside_grid.aspx">Validate Super Form inside Grid <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_validation_inside_grid.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_validation_linked_fields.aspx">Validate Linked Fields  <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_validation_linked_fields.aspx</td>
			                            </tr>
			                             
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_validation_callout.aspx">Validator Callout</a>
				                            </td>
					                        <td>aspnet_validation_callout.aspx</td>
			                            </tr>
                                        


			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Masks / Filters</b> - <span class="headerNumber">2</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_mask_masks.aspx">Edit Masks</a>
				                            </td>
					                        <td>aspnet_mask_masks.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_mask_filters.aspx">Filters</a>
				                            </td>
					                        <td>aspnet_mask_filters.aspx</td>
			                            </tr>
                                      

                                        <tr>
				                            <td class="header" colspan="2"><b>Linked Fields / Buttons</b> - <span class="headerNumber">4</span></td>
				                        </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_linked_enable_buttons.aspx">Enable / Disable Command Buttons</a>
				                            </td>
					                        <td>aspnet_linked_enable_buttons.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_linked_enable.aspx">Enable / Disable Linked Fields</a>
				                            </td>
					                        <td>aspnet_linked_enable.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_linked_show.aspx">Show / Hide Linked Fields</a>
				                            </td>
					                        <td>aspnet_linked_show.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_linked_conditional.aspx">Conditional Linked Fields</a>
				                            </td>
					                        <td>aspnet_linked_conditional.aspx</td>
			                            </tr>
			                             
			                             <tr>
				                            <td class="header" colspan="2"><b>Server Side API</b> - <span class="headerNumber">1</span></td>
				                        </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_serverapi_focus.aspx">Focus <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_serverapi_focus.aspx</td>
			                            </tr>
			                            
			                             <tr>
				                            <td class="header" colspan="2"><b>Localization</b> - <span class="headerNumber">1</span></td>
				                        </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_localization_date_field.aspx">Localize Date Fields <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_localization_date_field.aspx</td>
			                            </tr>
			                             <tr>
				                            <td class="header" colspan="2"><b>Integration</b> - <span class="headerNumber">2</span></td>
				                        </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="aspnet_integration_grid.aspx">Row Edit Template for Grid <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_integration_grid.aspx</td>
			                            </tr>
			                            <tr>
					                        <td class="link">
						                        <a href="aspnet_integration_grid_window.aspx">Grid Editor inside Window <b style="color: crimson;"> New</b></a>
					                        </td>
					                        <td>aspnet_integration_grid_window.aspx</td>
				                        </tr>
				                    </table>
                        	    </td>
                        	</tr>

			            </table>
            			
			            <br />
			            <br />
			            <span class="tdText">
				            You can find the ASP.NET examples in the <b>SuperForm</b> folder.<br />
				            They have the <b>aspnet_</b> prefix.
			            </span>
                    </div>
                    
                    <div id="divCSharp">
                        <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
                        	            <tr>
				                            <td class="header" colspan="2"><b>First Look</b> - <span class="headerNumber">2</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_firstlook_quick.aspx">Quick Setup</a>
				                            </td>
					                        <td>cs_firstlook_quick.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_firstlook_checkout.aspx">Checkout</a>
				                            </td>
					                        <td>cs_firstlook_checkout.aspx</td>
			                            </tr>
			                            
			                            
                        	            <tr>
				                            <td class="header" colspan="2"><b>Appearance</b> - <span class="headerNumber">1</span></td>
				                        </tr>
				                       
			                            <tr>
				                            <td class="link">
					                            <a href="cs_live_styles.aspx">Live Styles</a>
				                            </td>
					                        <td>cs_live_styles.aspx</td>
			                            </tr>
			                            


			                            <tr>
				                            <td class="header" colspan="2"><b>Fields</b> - <span class="headerNumber">8</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_fields_autogenerate.aspx">Auto Generate Fields</a>
				                            </td>
					                        <td>cs_fields_autogenerate.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_fields_boundfield.aspx">BoundField</a>
				                            </td>
					                        <td>cs_fields_boundfield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_fields_checkboxfield.aspx">CheckBoxField</a>
				                            </td>
					                        <td>cs_fields_checkboxfield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_fields_commandfield.aspx">CommandField</a>
				                            </td>
					                        <td>cs_fields_commandfield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_fields_datefield.aspx">DateField</a>
				                            </td>
					                        <td>cs_fields_datefield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_fields_dropdownlistfield.aspx">DropDownListField</a>
				                            </td>
					                        <td>cs_fields_dropdownlistfield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_fields_multilinefield.aspx">MultiLineField</a>
				                            </td>
					                        <td>cs_fields_multilinefield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_fields_templatefield.aspx">TemplateField</a>
				                            </td>
					                        <td>cs_fields_templatefield.aspx</td>
			                            </tr>  
			                            


                                        <tr>
				                            <td class="header" colspan="2"><b>Add / Edit / Delete</b> - <span class="headerNumber">6</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_commands_autogenerate.aspx">Auto Generate Command Buttons</a>
				                            </td>
					                        <td>cs_commands_autogenerate.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_commands_customize.aspx">Customize Command Buttons</a>
				                            </td>
					                        <td>cs_commands_customize.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_commands_confirmation.aspx">Request User Confirmation</a>
				                            </td>
					                        <td>cs_commands_confirmation.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_commands_addonly.aspx">Add-Only Form</a>
				                            </td>
					                        <td>cs_commands_addonly.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_commands_editonly.aspx">Edit-Only Form</a>
				                            </td>
					                        <td>cs_commands_editonly.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_commands_default.aspx">Default Values for Add <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_commands_default.aspx</td>
			                            </tr>
                                      



                                        <tr>
				                            <td class="header" colspan="2"><b>Layout</b> - <span class="headerNumber">6</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_layout_direction.aspx">Direction</a>
				                            </td>
					                        <td>cs_layout_direction.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_layout_field_sets.aspx">Field Sets</a>
				                            </td>
					                        <td>cs_layout_field_sets.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_layout_field_sets_span.aspx">Field Sets with Column Span</a>
				                            </td>
					                        <td>cs_layout_field_sets_span.aspx</td>
			                            </tr>
			                            </tr>
			                               <tr>
				                            <td class="link">
					                            <a href="cs_layout_tabs.aspx">Field Sets with Tabs <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_layout_tabs.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_layout_survey.aspx">Multi-Step Survey <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_layout_survey.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_layout_width.aspx">Width</a>
				                            </td>
					                        <td>cs_layout_width.aspx</td>
			                            </tr>



                                        <tr>
				                            <td class="header" colspan="2"><b>Master / Detail</b> - <span class="headerNumber">4</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_master_detail_grid.aspx">Master Grid</a>
				                            </td>
					                        <td>cs_master_detail_grid.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_master_detail_combobox.aspx">Master ComboBox</a>
				                            </td>
					                        <td>cs_master_detail_combobox.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_master_detail_listbox.aspx">Master ListBox</a>
				                            </td>
					                        <td>cs_master_detail_listbox.aspx</td>
			                            </tr>
                                         <tr>
				                            <td class="link">
					                            <a href="cs_master_detail_separate.aspx">Add / Edit in Separate Page</a>
				                            </td>
					                        <td>cs_master_detail_separate.aspx</td>
			                            </tr>
                                
                                         <tr>
				                            <td class="header" colspan="2"><b>Templates</b> - <span class="headerNumber">11</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_templates_combobox.aspx">ComboBox Field</a>
				                            </td>
					                        <td>cs_templates_combobox.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_templates_combobox_ondemand.aspx">On-Demand ComboBox Field</a>
				                            </td>
					                        <td>cs_templates_combobox_ondemand.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_templates_combobox_cascading.aspx">Cascading ComboBox Field</a>
				                            </td>
					                        <td>cs_templates_combobox_cascading.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_templates_combobox_multilevel.aspx">MultiLevel ComboBox Field</a>
				                            </td>
					                        <td>cs_templates_combobox_multilevel.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_templates_combobox_multi.aspx">MultiSelect ComboBox Field</a>
				                            </td>
					                        <td>cs_templates_combobox_multi.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_templates_listbox.aspx">ListBox Field</a>
				                            </td>
					                        <td>cs_templates_listbox.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_templates_listbox_multi.aspx">MultiSelect ListBox Field</a>
				                            </td>
					                        <td>cs_templates_listbox_multi.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_templates_editor.aspx">HTML Editor Field</a>
				                            </td>
					                        <td>cs_templates_editor.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_templates_fileupload.aspx">FileUploadProgress Field</a>
				                            </td>
					                        <td>cs_templates_fileupload.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_templates_checkboxlist.aspx">CheckBoxList Field</a>
				                            </td>
					                        <td>cs_templates_checkboxlist.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_templates_radiobuttonlist.aspx">RadioButtonList Field</a>
				                            </td>
					                        <td>cs_templates_radiobuttonlist.aspx</td>
			                            </tr>
			                            

			                            

                                        <tr>
				                            <td class="header" colspan="2"><b>Validation</b> - <span class="headerNumber">6</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_validation_required.aspx">Required Fields</a>
				                            </td>
					                        <td>cs_validation_required.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_validation_type.aspx">Type Validation</a>
				                            </td>
					                        <td>cs_validation_type.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_validation_custom.aspx">RegEx & Custom Validation</a>
				                            </td>
					                        <td>cs_validation_custom.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_validation_summary.aspx">Validation Summary</a>
				                            </td>
					                        <td>cs_validation_summary.aspx</td>
			                            </tr>
                                      
			                            <tr>
				                            <td class="link">
					                            <a href="cs_validation_callout.aspx">Validator Callout</a>
				                            </td>
					                        <td>cs_validation_callout.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_validation_linked_fields.aspx">Validate Linked Fields  <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_validation_linked_fields.aspx</td>
			                            </tr>
                                     


                                       
                                        <tr>
				                            <td class="header" colspan="2"><b>Masks / Filters</b> - <span class="headerNumber">2</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_mask_masks.aspx">Edit Masks</a>
				                            </td>
					                        <td>cs_mask_masks.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_mask_filters.aspx">Filters</a>
				                            </td>
					                        <td>cs_mask_filters.aspx</td>
			                            </tr>
                                       
			                            
			                            

                                        <tr>
				                            <td class="header" colspan="2"><b>Linked Fields / Buttons</b> - <span class="headerNumber">4</span></td>
				                        </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_linked_enable_buttons.aspx">Enable / Disable Command Buttons</a>
				                            </td>
					                        <td>cs_linked_enable_buttons.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_linked_enable.aspx">Enable / Disable Linked Fields</a>
				                            </td>
					                        <td>cs_linked_enable.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_linked_show.aspx">Show / Hide Linked Fields</a>
				                            </td>
					                        <td>cs_linked_show.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_linked_conditional.aspx">Conditional Linked Fields</a>
				                            </td>
					                        <td>cs_linked_conditional.aspx</td>
			                            </tr> 
			                             
			                             <tr>
				                            <td class="header" colspan="2"><b>Server Side API</b> - <span class="headerNumber">1</span></td>
				                        </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_serverapi_focus.aspx">Focus <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_serverapi_focus.aspx</td>
			                            </tr>
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Localization</b> - <span class="headerNumber">1</span></td>
				                        </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_localization_date_field.aspx">Localize Date Fields <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_localization_date_field.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="header" colspan="2"><b>Integration</b> - <span class="headerNumber">2</span></td>
				                        </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="cs_integration_grid.aspx">Row Edit Template for Grid <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_integration_grid.aspx</td>
			                            </tr>   
			                             <tr>
					                        <td class="link">
						                        <a href="cs_integration_grid_window.aspx">Grid Editor inside Window <b style="color: crimson;"> New</b></a>
					                        </td>
					                        <td>cs_integration_grid_window.aspx</td>
				                        </tr>   
				                    </table>
                        	    </td>
                        	</tr>

			            </table>
            			
			            <br />
			            <br />
			            <span class="tdText">
				             You can find the C# examples in the <b>SuperForm</b> folder.<br />
				            They have the <b>cs_</b> prefix.
			            </span>
                    </div>   
                    <div id="divVBNET">
                        <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
                        	            <tr>
				                            <td class="header" colspan="2"><b>First Look</b> - <span class="headerNumber">2</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_firstlook_quick.aspx">Quick Setup</a>
				                            </td>
					                        <td>vb_firstlook_quick.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_firstlook_checkout.aspx">Checkout</a>
				                            </td>
					                        <td>vb_firstlook_checkout.aspx</td>
			                            </tr>
			                            
                        	            
                        	            <tr>
				                            <td class="header" colspan="2"><b>Appearance</b> - <span class="headerNumber">1</span></td>
				                        </tr>
				                        
			                            <tr>
				                            <td class="link">
					                            <a href="vb_live_styles.aspx">Live Styles</a>
				                            </td>
					                        <td>vb_live_styles.aspx</td>
			                            </tr>

			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Fields</b> - <span class="headerNumber">8</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_fields_autogenerate.aspx">Auto Generate Fields</a>
				                            </td>
					                        <td>vb_fields_autogenerate.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_fields_boundfield.aspx">BoundField</a>
				                            </td>
					                        <td>vb_fields_boundfield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_fields_checkboxfield.aspx">CheckBoxField</a>
				                            </td>
					                        <td>vb_fields_checkboxfield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_fields_commandfield.aspx">CommandField</a>
				                            </td>
					                        <td>vb_fields_commandfield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_fields_datefield.aspx">DateField</a>
				                            </td>
					                        <td>vb_fields_datefield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_fields_dropdownlistfield.aspx">DropDownListField</a>
				                            </td>
					                        <td>vb_fields_dropdownlistfield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_fields_multilinefield.aspx">MultiLineField</a>
				                            </td>
					                        <td>vb_fields_multilinefield.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_fields_templatefield.aspx">TemplateField</a>
				                            </td>
					                        <td>vb_fields_templatefield.aspx</td>
			                            </tr>             


                                        <tr>
				                            <td class="header" colspan="2"><b>Add / Edit / Delete</b> - <span class="headerNumber">6</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_commands_autogenerate.aspx">Auto Generate Command Buttons</a>
				                            </td>
					                        <td>vb_commands_autogenerate.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_commands_customize.aspx">Customize Command Buttons</a>
				                            </td>
					                        <td>vb_commands_customize.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_commands_confirmation.aspx">Request User Confirmation</a>
				                            </td>
					                        <td>vb_commands_confirmation.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_commands_addonly.aspx">Add-Only Form</a>
				                            </td>
					                        <td>vb_commands_addonly.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_commands_editonly.aspx">Edit-Only Form</a>
				                            </td>
					                        <td>vb_commands_editonly.aspx</td>
			                            </tr>
                                       <tr>
				                            <td class="link">
					                            <a href="vb_commands_default.aspx">Default Values for Add <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_commands_default.aspx</td>
			                            </tr>



                                        <tr>
				                            <td class="header" colspan="2"><b>Layout</b> - <span class="headerNumber">6</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_layout_direction.aspx">Direction</a>
				                            </td>
					                        <td>vb_layout_direction.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_layout_field_sets.aspx">Field Sets</a>
				                            </td>
					                        <td>vb_layout_field_sets.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_layout_field_sets_span.aspx">Field Sets with Column Span</a>
				                            </td>
					                        <td>vb_layout_field_sets_span.aspx</td>
			                            </tr>
			                            </tr>
			                               <tr>
				                            <td class="link">
					                            <a href="vb_layout_tabs.aspx">Field Sets with Tabs <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_layout_tabs.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_layout_survey.aspx">Multi-Step Survey <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_layout_survey.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_layout_width.aspx">Width</a>
				                            </td>
					                        <td>vb_layout_width.aspx</td>
			                            </tr>



                                        <tr>
				                            <td class="header" colspan="2"><b>Master / Detail</b> - <span class="headerNumber">4</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_master_detail_grid.aspx">Master Grid</a>
				                            </td>
					                        <td>vb_master_detail_grid.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_master_detail_combobox.aspx">Master ComboBox</a>
				                            </td>
					                        <td>vb_master_detail_combobox.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_master_detail_listbox.aspx">Master ListBox</a>
				                            </td>
					                        <td>vb_master_detail_listbox.aspx</td>
			                            </tr>
                                         <tr>
				                            <td class="link">
					                            <a href="vb_master_detail_separate.aspx">Add / Edit in Separate Page</a>
				                            </td>
					                        <td>vb_master_detail_separate.aspx</td>
			                            </tr>
                            
                                        <tr>
				                            <td class="header" colspan="2"><b>Templates</b> - <span class="headerNumber">11</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_templates_combobox.aspx">ComboBox Field</a>
				                            </td>
					                        <td>vb_templates_combobox.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_templates_combobox_ondemand.aspx">On-Demand ComboBox Field</a>
				                            </td>
					                        <td>vb_templates_combobox_ondemand.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_templates_combobox_cascading.aspx">Cascading ComboBox Field</a>
				                            </td>
					                        <td>vb_templates_combobox_cascading.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_templates_combobox_multilevel.aspx">MultiLevel ComboBox Field</a>
				                            </td>
					                        <td>vb_templates_combobox_multilevel.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_templates_combobox_multi.aspx">MultiSelect ComboBox Field</a>
				                            </td>
					                        <td>vb_templates_combobox_multi.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_templates_listbox.aspx">ListBox Field</a>
				                            </td>
					                        <td>vb_templates_listbox.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_templates_listbox_multi.aspx">MultiSelect ListBox Field</a>
				                            </td>
					                        <td>vb_templates_listbox_multi.aspx</td>
			                            </tr>
			                            
			                            <tr>
				                            <td class="link">
					                            <a href="vb_templates_editor.aspx">HTML Editor Field</a>
				                            </td>
					                        <td>vb_templates_editor.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_templates_fileupload.aspx">FileUploadProgress Field</a>
				                            </td>
					                        <td>vb_templates_fileupload.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_templates_checkboxlist.aspx">CheckBoxList Field</a>
				                            </td>
					                        <td>vb_templates_checkboxlist.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_templates_radiobuttonlist.aspx">RadioButtonList Field</a>
				                            </td>
					                        <td>vb_templates_radiobuttonlist.aspx</td>
			                            </tr>
			                            
			                            



                                        <tr>
				                            <td class="header" colspan="2"><b>Validation</b> - <span class="headerNumber">6</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_validation_required.aspx">Required Fields</a>
				                            </td>
					                        <td>vb_validation_required.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_validation_type.aspx">Type Validation</a>
				                            </td>
					                        <td>vb_validation_type.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_validation_custom.aspx">RegEx & Custom Validation</a>
				                            </td>
					                        <td>vb_validation_custom.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_validation_summary.aspx">Validation Summary</a>
				                            </td>
					                        <td>vb_validation_summary.aspx</td>
			                            </tr>
                                       
			                            <tr>
				                            <td class="link">
					                            <a href="vb_validation_callout.aspx">Validator Callout</a>
				                            </td>
					                        <td>vb_validation_callout.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_validation_linked_fields.aspx">Validate Linked Fields  <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_validation_linked_fields.aspx</td>
			                            </tr>


			                          
			                            <tr>
				                            <td class="header" colspan="2"><b>Masks / Filters</b> - <span class="headerNumber">2</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_mask_masks.aspx">Edit Masks</a>
				                            </td>
					                        <td>vb_mask_masks.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_mask_filters.aspx">Filters</a>
				                            </td>
					                        <td>vb_mask_filters.aspx</td>
			                            </tr>
                                        


                                        <tr>
				                            <td class="header" colspan="2"><b>Linked Fields / Buttons</b> - <span class="headerNumber">4</span></td>
				                        </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_linked_enable_buttons.aspx">Enable / Disable Command Buttons</a>
				                            </td>
					                        <td>vb_linked_enable_buttons.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_linked_enable.aspx">Enable / Disable Linked Fields</a>
				                            </td>
					                        <td>vb_linked_enable.aspx</td>
			                            </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_linked_show.aspx">Show / Hide Linked Fields</a>
				                            </td>
					                        <td>vb_linked_show.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_linked_conditional.aspx">Conditional Linked Fields</a>
				                            </td>
					                        <td>vb_linked_conditional.aspx</td>
			                            </tr>
			                            
			                             <tr>
				                            <td class="header" colspan="2"><b>Server Side API</b> - <span class="headerNumber">1</span></td>
				                        </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_serverapi_focus.aspx">Focus <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_serverapi_focus.aspx</td>
			                            </tr>
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Localization</b> - <span class="headerNumber">1</span></td>
				                        </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_localization_date_field.aspx">Localize Date Fields <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_localization_date_field.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="header" colspan="2"><b>Integration</b> - <span class="headerNumber">2</span></td>
				                        </tr>
                                        <tr>
				                            <td class="link">
					                            <a href="vb_integration_grid.aspx">Row Edit Template for Grid <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_integration_grid.aspx</td>
			                            </tr>
			                             <tr>
					                        <td class="link">
						                        <a href="vb_integration_grid_window.aspx">Grid Editor inside Window <b style="color: crimson;"> New</b></a>
					                        </td>
					                        <td>vb_integration_grid_window.aspx</td>
				                        </tr>
				                    </table>
                        	    </td>
                        	</tr>

			            </table>
            			
			            <br />
			            <br />
			            <span class="tdText">
				             You can find the VB examples in the <b>SuperForm</b> folder.<br />
				            They have the <b>vb_</b> prefix.
			            </span>
                    </div>                                                          
                 </td>
            </tr>
        </table>
        
        <br />
        <br />
        <a href="http://www.obout.com/superform">obout Super Form home</a>
        <br />
        <a href="http://www.obout.com">obout inc home</a>
       </span>
    </form>
</body>
</html>
