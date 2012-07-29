<%@ Page Language="C#" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Web.UI" %>

<script runat="server" Language="C#">
	void Page_load(object sender, EventArgs e)
	{
		if (Request.QueryString["type"] != null)
		{
			ExamplesType.Value = Request.QueryString["type"].ToString();
		}		
	}
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>obout Interface examples</title>
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
			padding-left:4px;
			padding-right:4px;
		}
		a {
			font:11px Verdana;
			color:#315686;
			text-decoration:underline;
			white-space: nowrap;
		}

		a:hover {
			color:crimson;
			white-space: nowrap;
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
<body style="margin-left:30px;">
    <form name="form1" id="form1" runat="server">
    	 
	<input id="ExamplesType" type="hidden" runat="server" />
	
    <span class="tdText">
        <a href="../Default.aspx">&#171; Back to Suite Examples</a>
        <br /><br /><br />
        <span style="font-weight:bold;">obout Interface examples</span> (version 4.0.10, released on May 14, 2011)
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
				                            <td class="header" colspan="2"><b>Appearance</b> - <span class="headerNumber">1</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_style_gallery.aspx">Style Gallery</a>
				                            </td>
					                        <td>aspnet_style_gallery.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Common Features</b> - <span class="headerNumber">4</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_common_width.aspx">Width</a>
				                            </td>
					                        <td>aspnet_common_width.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_common_enable.aspx">Enable / Disable</a>
				                            </td>
					                        <td>aspnet_common_enable.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_common_different_styles.aspx">Different Styles </a><b style="color: crimson;">New</b>
				                            </td>
					                        <td>aspnet_common_different_styles.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_reset_values.aspx">Reset Values </a><b style="color: crimson;">New</b>
				                            </td>
					                        <td>aspnet_reset_values.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>OboutButton</b> - <span class="headerNumber">6</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_btn_defaultbutton.aspx">Default Button</a>
				                            </td>
					                        <td>aspnet_btn_defaultbutton.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_btn_postbackurl.aspx">PostBackUrl</a>
				                            </td>
					                        <td>aspnet_btn_postbackurl.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_btn_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>aspnet_btn_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_btn_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>aspnet_btn_events_server.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_btn_commands.aspx">Server-Side Commands</a>
				                            </td>
					                        <td>aspnet_btn_commands.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_btn_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>aspnet_btn_client_api.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>OboutCheckBox</b> - <span class="headerNumber">6</span> <b style="color: crimson;">New</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_chk_autopostback.aspx">AutoPostBack</a>
				                            </td>
					                        <td>aspnet_chk_autopostback.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_chk_tristate.aspx">Linked CheckBoxes with Tri-States</a>
				                            </td>
					                        <td>aspnet_chk_tristate.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_chk_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>aspnet_chk_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_chk_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>aspnet_chk_events_server.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_chk_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>aspnet_chk_client_api.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_chk_linked_fields.aspx">Linked Fields </a><b style="color: crimson;">New</b>
				                            </td>
					                        <td>aspnet_chk_linked_fields.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>OboutDropDownList</b> - <span class="headerNumber">8</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_ddl_height.aspx">Height</a>
				                            </td>
					                        <td>aspnet_ddl_height.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_ddl_menuwidth.aspx">MenuWidth</a>
				                            </td>
					                        <td>aspnet_ddl_menuwidth.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_ddl_columns_multiple.aspx">Multiple Rows and Columns </a><b style="color: crimson;">New</b>
				                            </td>
					                        <td>aspnet_ddl_columns_multiple.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_ddl_autopostback.aspx">AutoPostBack</a>
				                            </td>
					                        <td>aspnet_ddl_autopostback.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_ddl_linked_fields.aspx">Linked Fields <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_ddl_linked_fields.aspx</td>
			                            </tr>	
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_ddl_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>aspnet_ddl_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_ddl_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>aspnet_ddl_events_server.aspx</td>
			                            </tr>	
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_ddl_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>aspnet_ddl_client_api.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>OboutImageButton</b> - <span class="headerNumber">7</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_imgbtn_states.aspx">Enable specific states</a>
				                            </td>
					                        <td>aspnet_imgbtn_states.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_imgbtn_defaultbutton.aspx">Default Button</a>
				                            </td>
					                        <td>aspnet_imgbtn_defaultbutton.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_imgbtn_postbackurl.aspx">PostBackUrl</a>
				                            </td>
					                        <td>aspnet_imgbtn_postbackurl.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_imgbtn_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>aspnet_imgbtn_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_imgbtn_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>aspnet_imgbtn_events_server.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_imgbtn_commands.aspx">Server-Side Commands</a>
				                            </td>
					                        <td>aspnet_imgbtn_commands.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_imgbtn_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>aspnet_imgbtn_client_api.aspx</td>
			                            </tr>
			                            
				                    </table>
                        	    </td>
                        	    <td width="50">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>
                        	            <tr>
				                            <td class="header" colspan="2"><b>OboutRadioButton</b> - <span class="headerNumber">5</span> <b style="color: crimson;">New</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_rbtn_autopostback.aspx">AutoPostBack</a>
				                            </td>
					                        <td>aspnet_rbtn_autopostback.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_rbtn_groupname.aspx">GroupName</a>
				                            </td>
					                        <td>aspnet_rbtn_groupname.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_rbtn_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>aspnet_rbtn_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_rbtn_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>aspnet_rbtn_events_server.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_rbtn_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>aspnet_rbtn_client_api.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>OboutTextBox</b> - <span class="headerNumber">11</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_txt_autocomplete.aspx">Auto Complete</a>
				                            </td>
					                        <td>aspnet_txt_autocomplete.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_txt_autopostback.aspx">AutoPostBack <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_txt_autopostback.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_txt_maxlength.aspx">MaxLength</a>
				                            </td>
					                        <td>aspnet_txt_maxlength.aspx</td>
			                            </tr>
			                             <tr>
				                            <td class="link">
					                            <a href="aspnet_txt_maxlength_counter.aspx">MaxLength with Counter <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_txt_maxlength_counter.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_txt_autofocus.aspx">MaxLength with Auto Focus <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_txt_autofocus.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_txt_textmode.aspx">TextMode</a>
				                            </td>
					                        <td>aspnet_txt_textmode.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_txt_watermarktext.aspx">WatermarkText</a>
				                            </td>
					                        <td>aspnet_txt_watermarktext.aspx</td>
			                            </tr>	
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_txt_linked_fields.aspx">Linked Fields <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_txt_linked_fields.aspx</td>
			                            </tr>		                            
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_txt_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>aspnet_txt_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_txt_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>aspnet_txt_events_server.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_txt_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>aspnet_txt_client_api.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Integration</b> - <span class="headerNumber">7</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_integration_cascading.aspx">Cascading Drop Down Lists</a>
				                            </td>
					                        <td>aspnet_integration_cascading.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_integration_validators.aspx">With ASP.NET Validators</a>
				                            </td>
					                        <td>aspnet_integration_validators.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_integration_grid.aspx">Inside Grid</a>
				                            </td>
					                        <td>aspnet_integration_grid.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_integration_datepicker.aspx">TextBox with DatePicker</a>
				                            </td>
					                        <td>aspnet_integration_datepicker.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_integration_usercontrol.aspx">Inside User Controls <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_integration_usercontrol.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_integration_themes_skins.aspx">Using ASP.NET Themes/Skins <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_integration_themes_skins.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_integration_createuserwizard.aspx">Create User Wizard <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>aspnet_integration_createuserwizard.aspx</td>
			                            </tr>
                        	        </table>
                        	    </td>
                        	</tr>

			            </table>
            			
			            <br />
			            <br />
			            <span class="tdText">
				            You can find the ASP.NET examples in the <b>Interface</b> folder.<br />
				            They have the <b>aspnet_</b> prefix.
			            </span>
                    </div>  
                    
                    <div id="divCSharp">
			            <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
                        	            
                        	            <tr>
				                            <td class="header" colspan="2"><b>Appearance</b> - <span class="headerNumber">1</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_style_gallery.aspx">Style Gallery</a>
				                            </td>
					                        <td>cs_style_gallery.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Common Features</b> - <span class="headerNumber">4</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_common_width.aspx">Width</a>
				                            </td>
					                        <td>cs_common_width.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_common_enable.aspx">Enable / Disable</a>
				                            </td>
					                        <td>cs_common_enable.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_common_different_styles.aspx">Different Styles </a><b style="color: crimson;">New</b>
				                            </td>
					                        <td>cs_common_different_styles.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_reset_values.aspx">Reset Values </a><b style="color: crimson;">New</b>
				                            </td>
					                        <td>cs_reset_values.aspx</td>
			                            </tr>
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>OboutButton</b> - <span class="headerNumber">6</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_btn_defaultbutton.aspx">Default Button</a>
				                            </td>
					                        <td>cs_btn_defaultbutton.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_btn_postbackurl.aspx">PostBackUrl</a>
				                            </td>
					                        <td>cs_btn_postbackurl.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_btn_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>cs_btn_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_btn_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>cs_btn_events_server.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_btn_commands.aspx">Server-Side Commands</a>
				                            </td>
					                        <td>cs_btn_commands.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_btn_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>cs_btn_client_api.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>OboutCheckBox</b> - <span class="headerNumber">6</span> <b style="color: crimson;">New</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_chk_autopostback.aspx">AutoPostBack</a>
				                            </td>
					                        <td>cs_chk_autopostback.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_chk_tristate.aspx">Linked CheckBoxes with Tri-States</a>
				                            </td>
					                        <td>cs_chk_tristate.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_chk_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>cs_chk_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_chk_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>cs_chk_events_server.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_chk_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>cs_chk_client_api.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_chk_linked_fields.aspx">Linked Fields </a><b style="color: crimson;">New</b>
				                            </td>
					                        <td>cs_chk_linked_fields.aspx</td>
			                            </tr>
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>OboutDropDownList</b> - <span class="headerNumber">8</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_ddl_height.aspx">Height</a>
				                            </td>
					                        <td>cs_ddl_height.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_ddl_menuwidth.aspx">MenuWidth</a>
				                            </td>
					                        <td>cs_ddl_menuwidth.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_ddl_columns_multiple.aspx">Multiple Rows and Columns </a><b style="color: crimson;">New</b>
				                            </td>
					                        <td>cs_ddl_columns_multiple.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_ddl_autopostback.aspx">AutoPostBack</a>
				                            </td>
					                        <td>cs_ddl_autopostback.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_ddl_linked_fields.aspx">Linked Fields <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_ddl_linked_fields.aspx</td>
			                            </tr>	
			                            <tr>
				                            <td class="link">
					                            <a href="cs_ddl_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>cs_ddl_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_ddl_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>cs_ddl_events_server.aspx</td>
			                            </tr>	
			                            <tr>
				                            <td class="link">
					                            <a href="cs_ddl_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>cs_ddl_client_api.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>OboutImageButton</b> - <span class="headerNumber">7</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_imgbtn_states.aspx">Enable specific states</a>
				                            </td>
					                        <td>cs_imgbtn_states.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_imgbtn_defaultbutton.aspx">Default Button</a>
				                            </td>
					                        <td>cs_imgbtn_defaultbutton.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_imgbtn_postbackurl.aspx">PostBackUrl</a>
				                            </td>
					                        <td>cs_imgbtn_postbackurl.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_imgbtn_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>cs_imgbtn_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_imgbtn_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>cs_imgbtn_events_server.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_imgbtn_commands.aspx">Server-Side Commands</a>
				                            </td>
					                        <td>cs_imgbtn_commands.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_imgbtn_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>cs_imgbtn_client_api.aspx</td>
			                            </tr>
			                            
				                    </table>
                        	    </td>
                        	    <td width="50">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>
                        	            <tr>
				                            <td class="header" colspan="2"><b>OboutRadioButton</b> - <span class="headerNumber">5</span> <b style="color: crimson;">New</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_rbtn_autopostback.aspx">AutoPostBack</a>
				                            </td>
					                        <td>cs_rbtn_autopostback.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_rbtn_groupname.aspx">GroupName</a>
				                            </td>
					                        <td>cs_rbtn_groupname.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_rbtn_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>cs_rbtn_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_rbtn_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>cs_rbtn_events_server.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_rbtn_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>cs_rbtn_client_api.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>OboutTextBox</b> - <span class="headerNumber">11</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_txt_autocomplete.aspx">Auto Complete</a>
				                            </td>
					                        <td>cs_txt_autocomplete.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_txt_autopostback.aspx">AutoPostBack <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_txt_autopostback.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_txt_maxlength.aspx">MaxLength</a>
				                            </td>
					                        <td>cs_txt_maxlength.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_txt_maxlength_counter.aspx">MaxLength with Counter <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_txt_maxlength_counter.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_txt_autofocus.aspx">MaxLength with Auto Focus <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_txt_autofocus.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_txt_textmode.aspx">TextMode</a>
				                            </td>
					                        <td>cs_txt_textmode.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_txt_watermarktext.aspx">WatermarkText</a>
				                            </td>
					                        <td>cs_txt_watermarktext.aspx</td>
			                            </tr>	
			                            <tr>
				                            <td class="link">
					                            <a href="cs_txt_linked_fields.aspx">Linked Fields <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_txt_linked_fields.aspx</td>
			                            </tr>			                            
				                        <tr>
				                            <td class="link">
					                            <a href="cs_txt_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>cs_txt_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_txt_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>cs_txt_events_server.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_txt_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>cs_txt_client_api.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Integration</b> - <span class="headerNumber">5</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_integration_cascading.aspx">Cascading Drop Down Lists</a>
				                            </td>
					                        <td>cs_integration_cascading.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_integration_validators.aspx">With ASP.NET Validators</a>
				                            </td>
					                        <td>cs_integration_validators.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_integration_grid.aspx">Inside Grid</a>
				                            </td>
					                        <td>cs_integration_grid.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_integration_datepicker.aspx">TextBox with DatePicker</a>
				                            </td>
					                        <td>cs_integration_datepicker.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_integration_createuserwizard.aspx">Create User Wizard <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>cs_integration_createuserwizard.aspx</td>
			                            </tr>
			                            
                        	        </table>
                        	    </td>
                        	</tr>

			            </table>
			            
			            <br />
			            <br />
			            <span class="tdText">
				            You can find the C# examples in the <b>Interface</b> folder.<br />
				            They have the <b>cs_</b> prefix.
			            </span>
                    </div> 
                    
                    <div id="divVBNET">
			            <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
                        	            
                        	            <tr>
				                            <td class="header" colspan="2"><b>Appearance</b> - <span class="headerNumber">1</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_style_gallery.aspx">Style Gallery</a>
				                            </td>
					                        <td>vb_style_gallery.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Common Features</b> - <span class="headerNumber">4</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_common_width.aspx">Width</a>
				                            </td>
					                        <td>vb_common_width.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_common_enable.aspx">Enable / Disable</a>
				                            </td>
					                        <td>vb_common_enable.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_common_different_styles.aspx">Different Styles </a><b style="color: crimson;">New</b>
				                            </td>
					                        <td>vb_common_different_styles.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_reset_values.aspx">Reset Values </a><b style="color: crimson;">New</b>
				                            </td>
					                        <td>vb_reset_values.aspx</td>
			                            </tr>
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>OboutButton</b> - <span class="headerNumber">6</span></td>
				                        </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_btn_defaultbutton.aspx">Default Button</a>
				                            </td>
					                        <td>vb_btn_defaultbutton.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_btn_postbackurl.aspx">PostBackUrl</a>
				                            </td>
					                        <td>vb_btn_postbackurl.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_btn_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>vb_btn_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_btn_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>vb_btn_events_server.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_btn_commands.aspx">Server-Side Commands</a>
				                            </td>
					                        <td>vb_btn_commands.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_btn_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>vb_btn_client_api.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>OboutCheckBox</b> - <span class="headerNumber">6</span> <b style="color: crimson;">New</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_chk_autopostback.aspx">AutoPostBack</a>
				                            </td>
					                        <td>vb_chk_autopostback.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_chk_tristate.aspx">Linked CheckBoxes with Tri-States</a>
				                            </td>
					                        <td>vb_chk_tristate.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_chk_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>vb_chk_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_chk_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>vb_chk_events_server.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_chk_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>vb_chk_client_api.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_chk_linked_fields.aspx">Linked Fields </a><b style="color: crimson;">New</b>
				                            </td>
					                        <td>vb_chk_linked_fields.aspx</td>
			                            </tr>
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>OboutDropDownList</b> - <span class="headerNumber">8</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_ddl_height.aspx">Height</a>
				                            </td>
					                        <td>vb_ddl_height.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_ddl_menuwidth.aspx">MenuWidth</a>
				                            </td>
					                        <td>vb_ddl_menuwidth.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_ddl_columns_multiple.aspx">Multiple Rows and Columns </a><b style="color: crimson;">New</b>
				                            </td>
					                        <td>vb_ddl_columns_multiple.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_ddl_autopostback.aspx">AutoPostBack</a>
				                            </td>
					                        <td>vb_ddl_autopostback.aspx</td>
			                            </tr>
			                             <tr>
				                            <td class="link">
					                            <a href="vb_ddl_linked_fields.aspx">Linked Fields <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_ddl_linked_fields.aspx</td>
			                            </tr>	
			                            <tr>
				                            <td class="link">
					                            <a href="vb_ddl_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>vb_ddl_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_ddl_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>vb_ddl_events_server.aspx</td>
			                            </tr>	
			                            <tr>
				                            <td class="link">
					                            <a href="vb_ddl_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>vb_ddl_client_api.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>OboutImageButton</b> - <span class="headerNumber">7</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_imgbtn_states.aspx">Enable specific states</a>
				                            </td>
					                        <td>vb_imgbtn_states.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_imgbtn_defaultbutton.aspx">Default Button</a>
				                            </td>
					                        <td>vb_imgbtn_defaultbutton.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_imgbtn_postbackurl.aspx">PostBackUrl</a>
				                            </td>
					                        <td>vb_imgbtn_postbackurl.aspx</td>
			                            </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_imgbtn_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>vb_imgbtn_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_imgbtn_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>vb_imgbtn_events_server.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_imgbtn_commands.aspx">Server-Side Commands</a>
				                            </td>
					                        <td>vb_imgbtn_commands.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_imgbtn_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>vb_imgbtn_client_api.aspx</td>
			                            </tr>
			                            
				                    </table>
                        	    </td>
                        	    <td width="50">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>
                        	            <tr>
				                            <td class="header" colspan="2"><b>OboutRadioButton</b> - <span class="headerNumber">5</span> <b style="color: crimson;">New</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_rbtn_autopostback.aspx">AutoPostBack</a>
				                            </td>
					                        <td>vb_rbtn_autopostback.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_rbtn_groupname.aspx">GroupName</a>
				                            </td>
					                        <td>vb_rbtn_groupname.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_rbtn_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>vb_rbtn_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_rbtn_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>vb_rbtn_events_server.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_rbtn_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>vb_rbtn_client_api.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>OboutTextBox</b> - <span class="headerNumber">11</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_txt_autocomplete.aspx">Auto Complete</a>
				                            </td>
					                        <td>vb_txt_autocomplete.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_txt_autopostback.aspx">AutoPostBack <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_txt_autopostback.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_txt_maxlength.aspx">MaxLength</a>
				                            </td>
					                        <td>vb_txt_maxlength.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_txt_maxlength_counter.aspx">MaxLength with Counter <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_txt_maxlength_counter.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_txt_autofocus.aspx">MaxLength with Auto Focus <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_txt_autofocus.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_txt_textmode.aspx">TextMode</a>
				                            </td>
					                        <td>vb_txt_textmode.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_txt_watermarktext.aspx">WatermarkText</a>
				                            </td>
					                        <td>vb_txt_watermarktext.aspx</td>
			                            </tr>	
			                            <tr>
				                            <td class="link">
					                            <a href="vb_txt_linked_fields.aspx">Linked Fields <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_txt_linked_fields.aspx</td>
			                            </tr>			                            
				                        <tr>
				                            <td class="link">
					                            <a href="vb_txt_events_client.aspx">Client-Side Events</a>
				                            </td>
					                        <td>vb_txt_events_client.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_txt_events_server.aspx">Server-Side Events</a>
				                            </td>
					                        <td>vb_txt_events_server.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_txt_client_api.aspx">Client-Side Manipulation</a>
				                            </td>
					                        <td>vb_txt_client_api.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Integration</b> - <span class="headerNumber">5</span></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_integration_cascading.aspx">Cascading Drop Down Lists</a>
				                            </td>
					                        <td>vb_integration_cascading.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_integration_validators.aspx">With ASP.NET Validators</a>
				                            </td>
					                        <td>vb_integration_validators.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_integration_grid.aspx">Inside Grid</a>
				                            </td>
					                        <td>vb_integration_grid.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_integration_datepicker.aspx">TextBox with DatePicker</a>
				                            </td>
					                        <td>vb_integration_datepicker.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_integration_createuserwizard.aspx">Create User Wizard <b style="color: crimson;">New</b></a>
				                            </td>
					                        <td>vb_integration_createuserwizard.aspx</td>
			                            </tr>
                        	        </table>
                        	    </td>
                        	</tr>

			            </table>
			            
			            <br /><br />
			            <span class="tdText">
				            You can find the VB.NET examples in the <b>Interface</b> folder.<br />
				            They have the <b>vb_</b> prefix.
			            </span>
                    </div> 
                </td>
                </tr>
                
        </table>
        <br />
        <br />
        <a href="http://www.obout.com/interface">obout Interface Suite home</a>
        <br />
        <a href="http://www.obout.com">obout inc home</a>
       </span>                             
    </form>
</body>
</html>
