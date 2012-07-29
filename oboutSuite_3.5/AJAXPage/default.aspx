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
					lblPath.Text = "<b>Path to folder with Grid examples: </b>" + oXMLReader.ReadString();
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
    <title>obout ASP.NET AJAXPage examples</title>
    <style type="text/css">
		td.link{
			padding-left:30px;
			width:280px;			
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
        <span style="font-weight:bold;">obout ASP.NET AJAXPage examples</span> (version 1.8.7.0, released on July 29, 2008)
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
				                            <td class="header" colspan="2"><b>Examples</b></td>
				                        </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_CPUMonitorStyle1.aspx" style="margin-right:100px;">CPU Monitor Style1</a>
				                            </td>
					                        <td>aspnet_CPUMonitorStyle1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_CPUMonitorStyle2.aspx" style="margin-right:100px;">CPU Monitor Style2</a>
				                            </td>
					                        <td>aspnet_CPUMonitorStyle2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_filebrowser.aspx">File Browser</a>
				                            </td>
					                        <td>aspnet_filebrowser.aspx</td>
			                            </tr>										
										<tr>
				                            <td class="link">
					                            <a href="aspnet_addressbook.aspx" style="margin-right:100px;">Address Book</a>
				                            </td>
					                        <td>aspnet_addressbook.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_Products.aspx" style="margin-right:100px;">Products</a>
				                            </td>
					                        <td>aspnet_Products.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_ServerValidator.aspx" style="margin-right:100px;">Server Validator</a>
				                            </td>
					                        <td>aspnet_ServerValidator.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_ShoppingCart.aspx" style="margin-right:100px;">Shopping Cart</a>
				                            </td>
					                        <td>aspnet_ShoppingCart.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_Vote.aspx" style="margin-right:100px;">Voting</a>
				                            </td>
					                        <td>aspnet_Vote.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_login.aspx">Login control</a>
				                            </td>
					                        <td>aspnet_login.aspx</td>
			                            </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Callback Panel</b></td>
				                        </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_simpleliteralupdate.aspx">Simple Literal Update</a>
				                            </td>
					                        <td>aspnet_simpleliteralupdate.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_tabstrip.aspx" style="margin-right:100px;">TabStrip</a>
				                            </td>
					                        <td>aspnet_tabstrip.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_weather.aspx" style="margin-right:100px;">Weather information</a>
				                            </td>
					                        <td>aspnet_weather.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_cp_clientevents.aspx" style="margin-right:100px;">Client-side events</a>
				                            </td>
					                        <td>aspnet_cp_clientevents.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_nojavascript.aspx" style="margin-right:100px;">No Javascript</a>
				                            </td>
					                        <td>aspnet_nojavascript.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_updatepanel1.aspx" style="margin-right:100px;">UpdatePanel1</a>
				                            </td>
					                        <td>aspnet_updatepanel1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_updatepanel2.aspx" style="margin-right:100px;">UpdatePanel2</a>
				                            </td>
					                        <td>aspnet_updatepanel2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_updatepanelincontainer1.aspx" style="margin-right:100px;">UpdatePanelInContainer1</a>
				                            </td>
					                        <td>aspnet_updatepanelincontainer1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_updatepanelincontainer2.aspx" style="margin-right:100px;">UpdatePanelInContainer2</a>
				                            </td>
					                        <td>aspnet_updatepanelincontainer2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_updatepanelfrompage1.aspx" style="margin-right:100px;">UpdatePanelFromPage1</a>
				                            </td>
					                        <td>aspnet_updatepanelfrompage1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_updatepanelfrompage2.aspx" style="margin-right:100px;">UpdatePanelFromPage2</a>
				                            </td>
					                        <td>aspnet_updatepanelfrompage2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_updatepanelfrompage3.aspx" style="margin-right:100px;">UpdatePanelFromPage3</a>
				                            </td>
					                        <td>aspnet_updatepanelfrompage3.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_updateallpanels.aspx" style="margin-right:100px;">UpdateAllPanels</a>
				                            </td>
					                        <td>aspnet_updateallpanels.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_customize1.aspx" style="margin-right:100px;">Customize1</a>
				                            </td>
					                        <td>aspnet_customize1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_customize2.aspx" style="margin-right:100px;">Customize2</a>
				                            </td>
					                        <td>aspnet_customize2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_rendermethod.aspx" style="margin-right:100px;">RenderMethod</a>
				                            </td>
					                        <td>aspnet_rendermethod.aspx</td>
			                            </tr>
				                    </table>
                        	    </td>
                        	    
                        	    <td style="width:50px">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>  

										<tr>
				                            <td class="header" colspan="2"><b>Server to client</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_showalert.aspx" style="margin-right:100px;">ShowAlert</a>
				                            </td>
					                        <td>aspnet_showalert.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_setvalue.aspx" style="margin-right:100px;">SetValue</a>
				                            </td>
					                        <td>aspnet_setvalue.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_openwindow.aspx" style="margin-right:100px;">OpenWindow</a>
				                            </td>
					                        <td>aspnet_openwindow.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_showconfirmationdialog.aspx" style="margin-right:100px;">ShowConfirmationDialog</a>
				                            </td>
					                        <td>aspnet_showconfirmationdialog.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_createtimer1.aspx" style="margin-right:100px;">CreateTimer1</a>
				                            </td>
					                        <td>aspnet_createtimer1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_createtimer2.aspx" style="margin-right:100px;">CreateTimer2</a>
				                            </td>
					                        <td>aspnet_createtimer2.aspx</td>
			                            </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Client to server </b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_sendcollection.aspx">Send Collection</a>
				                            </td>
					                        <td>aspnet_sendcollection.aspx</td>
			                            </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Other Examples</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_addparam1.aspx" style="margin-right:100px;">AddParam1</a>
				                            </td>
					                        <td>aspnet_addparam1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_addparam2.aspx" style="margin-right:100px;">AddParam2</a>
				                            </td>
					                        <td>aspnet_addparam2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_callbackviewstate.aspx" style="margin-right:100px;">CallbackViewState</a>
				                            </td>
					                        <td>aspnet_callbackviewstate.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_clientevents.aspx" style="margin-right:100px;">Client-side Events</a>
				                            </td>
					                        <td>aspnet_clientevents.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_response.aspx" style="margin-right:100px;">Response</a>
				                            </td>
					                        <td>aspnet_response.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_redirect.aspx" style="margin-right:100px;">Redirect</a>
				                            </td>
					                        <td>aspnet_redirect.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_sync.aspx" style="margin-right:100px;">Synchronous Callback</a>
				                            </td>
					                        <td>aspnet_sync.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_async.aspx" style="margin-right:100px;">Asynchronous Callback</a>
				                            </td>
					                        <td>aspnet_async.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_jsvisible.aspx" style="margin-right:100px;">JSVisible</a>
				                            </td>
					                        <td>aspnet_jsvisible.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_baseclass.aspx">Using a base class</a> 
				                            </td>
					                        <td>aspnet_baseclass.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_externalcallback.aspx">External callback</a>
				                            </td>
					                        <td>aspnet_externalcallback.aspx</td>
			                            </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Integration</b></td>
				                        </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_withmasterpages.aspx">With Master Pages</a>
				                            </td>
					                        <td>aspnet_withmasterpages.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_withusercontrol.aspx">With User Control</a>
				                            </td>
					                        <td>aspnet_withusercontrol.aspx</td>
			                            </tr>
										<%--<tr>
				                            <td class="link">
					                            <a href="aspnet_Tree_Page.aspx">With TreeView inside User Control <b style="color:crimson">New</b></a>
				                            </td>
					                        <td>aspnet_Tree_Page.aspx</td>
			                            </tr>--%>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_navigation/Default.aspx">Navigation using master pages</a>
				                            </td>
					                        <td>aspnet_navigation/Default.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_integration_dynamic_combobox.aspx">obout Grid Integration with Dynamic Combobox</a>
				                            </td>
					                        <td>aspnet_integration_dynamic_combobox.aspx</td>
			                            </tr>
				                        
				                    </table>
                        	    </td>
                        	</tr>

			            </table>
            			
			            <br />
			            <br />
			            <span class="tdText">
				            You can find the ASP.NET examples in the <b>AJAXPage</b> folder.<br />
				            They have the <b>aspnet_</b> prefix.
			            </span>
                    </div>  
                    
                    <div id="divCSharp">
			            <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
                        	            <tr>
				                            <td class="header" colspan="2"><b>Examples</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_CPUMonitorStyle1.aspx" style="margin-right:100px;">CPU Monitor Style1</a>
				                            </td>
					                        <td>cs_CPUMonitorStyle1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_CPUMonitorStyle2.aspx" style="margin-right:100px;">CPU Monitor Style2</a>
				                            </td>
					                        <td>cs_CPUMonitorStyle2.aspx</td>
			                            </tr>
										<%--<tr>
				                            <td class="link">
					                            <a href="cs_filebrowser.aspx">File Browser</a>
				                            </td>
					                        <td>cs_filebrowser.aspx</td>
			                            </tr>		--%>								
										<%--<tr>
				                            <td class="link">
					                            <a href="cs_addressbook.aspx" style="margin-right:100px;">Address Book</a>
				                            </td>
					                        <td>cs_addressbook.aspx</td>
			                            </tr>--%>
										<tr>
				                            <td class="link">
					                            <a href="cs_Products.aspx" style="margin-right:100px;">Products</a>
				                            </td>
					                        <td>cs_Products.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_ServerValidator.aspx" style="margin-right:100px;">Server Validator</a>
				                            </td>
					                        <td>cs_ServerValidator.aspx</td>
			                            </tr>
										<%--<tr>
				                            <td class="link">
					                            <a href="cs_ShoppingCart.aspx" style="margin-right:100px;">Shopping Cart</a>
				                            </td>
					                        <td>cs_ShoppingCart.aspx</td>
			                            </tr>--%>
										<tr>
				                            <td class="link">
					                            <a href="cs_Vote.aspx" style="margin-right:100px;">Voting</a>
				                            </td>
					                        <td>cs_Vote.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_login.aspx">Login control</a>
				                            </td>
					                        <td>cs_login.aspx</td>
			                            </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Callback Panel</b></td>
				                        </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_simpleliteralupdate.aspx">Simple Literal Update</a>
				                            </td>
					                        <td>cs_simpleliteralupdate.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_tabstrip.aspx" style="margin-right:100px;">TabStrip</a>
				                            </td>
					                        <td>cs_tabstrip.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_weather.aspx" style="margin-right:100px;">Weather information</a>
				                            </td>
					                        <td>cs_weather.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_cp_clientevents.aspx" style="margin-right:100px;">Client-side events</a>
				                            </td>
					                        <td>cs_cp_clientevents.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_nojavascript.aspx" style="margin-right:100px;">No Javascript</a>
				                            </td>
					                        <td>cs_nojavascript.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_updatepanel1.aspx" style="margin-right:100px;">UpdatePanel1</a>
				                            </td>
					                        <td>cs_updatepanel1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_updatepanel2.aspx" style="margin-right:100px;">UpdatePanel2</a>
				                            </td>
					                        <td>cs_updatepanel2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_updatepanelincontainer1.aspx" style="margin-right:100px;">UpdatePanelInContainer1</a>
				                            </td>
					                        <td>cs_updatepanelincontainer1.aspx</td>
			                            </tr>
										<%--<tr>
				                            <td class="link">
					                            <a href="cs_updatepanelincontainer2.aspx" style="margin-right:100px;">UpdatePanelInContainer2</a>
				                            </td>
					                        <td>cs_updatepanelincontainer2.aspx</td>
			                            </tr>--%>
										<tr>
				                            <td class="link">
					                            <a href="cs_updatepanelfrompage1.aspx" style="margin-right:100px;">UpdatePanelFromPage1</a>
				                            </td>
					                        <td>cs_updatepanelfrompage1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_updatepanelfrompage2.aspx" style="margin-right:100px;">UpdatePanelFromPage2</a>
				                            </td>
					                        <td>cs_updatepanelfrompage2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_updatepanelfrompage3.aspx" style="margin-right:100px;">UpdatePanelFromPage3</a>
				                            </td>
					                        <td>cs_updatepanelfrompage3.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_updateallpanels.aspx" style="margin-right:100px;">UpdateAllPanels</a>
				                            </td>
					                        <td>cs_updateallpanels.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_customize1.aspx" style="margin-right:100px;">Customize1</a>
				                            </td>
					                        <td>cs_customize1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_customize2.aspx" style="margin-right:100px;">Customize2</a>
				                            </td>
					                        <td>cs_customize2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_rendermethod.aspx" style="margin-right:100px;">RenderMethod</a>
				                            </td>
					                        <td>cs_rendermethod.aspx</td>
			                            </tr>
				                    </table>
                        	    </td>
                        	    
                        	    <td style="width:50px">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>  

										<tr>
				                            <td class="header" colspan="2"><b>Server to client</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_showalert.aspx" style="margin-right:100px;">ShowAlert</a>
				                            </td>
					                        <td>cs_showalert.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_setvalue.aspx" style="margin-right:100px;">SetValue</a>
				                            </td>
					                        <td>cs_setvalue.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_openwindow.aspx" style="margin-right:100px;">OpenWindow</a>
				                            </td>
					                        <td>cs_openwindow.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_showconfirmationdialog.aspx" style="margin-right:100px;">ShowConfirmationDialog</a>
				                            </td>
					                        <td>cs_showconfirmationdialog.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_createtimer1.aspx" style="margin-right:100px;">CreateTimer1</a>
				                            </td>
					                        <td>cs_createtimer1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_createtimer2.aspx" style="margin-right:100px;">CreateTimer2</a>
				                            </td>
					                        <td>cs_createtimer2.aspx</td>
			                            </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Client to server </b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_sendcollection.aspx">Send Collection</a>
				                            </td>
					                        <td>cs_sendcollection.aspx</td>
			                            </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Other Examples</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_addparam1.aspx" style="margin-right:100px;">AddParam1</a>
				                            </td>
					                        <td>cs_addparam1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_addparam2.aspx" style="margin-right:100px;">AddParam2</a>
				                            </td>
					                        <td>cs_addparam2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_callbackviewstate.aspx" style="margin-right:100px;">CallbackViewState</a>
				                            </td>
					                        <td>cs_callbackviewstate.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_clientevents.aspx" style="margin-right:100px;">Client-side Events</a>
				                            </td>
					                        <td>cs_clientevents.aspx</td>
			                            </tr>
									<%--	<tr>
				                            <td class="link">
					                            <a href="cs_response.aspx" style="margin-right:100px;">Response</a>
				                            </td>
					                        <td>cs_response.aspx</td>
			                            </tr>--%>
										<tr>
				                            <td class="link">
					                            <a href="cs_redirect.aspx" style="margin-right:100px;">Redirect</a>
				                            </td>
					                        <td>cs_redirect.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_sync.aspx" style="margin-right:100px;">Synchronous Callback</a>
				                            </td>
					                        <td>cs_sync.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_async.aspx" style="margin-right:100px;">Asynchronous Callback</a>
				                            </td>
					                        <td>cs_async.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_jsvisible.aspx" style="margin-right:100px;">JSVisible</a>
				                            </td>
					                        <td>cs_jsvisible.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_baseclass.aspx">Using a base class</a> 
				                            </td>
					                        <td>cs_baseclass.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_externalcallback.aspx">External callback</a>
				                            </td>
					                        <td>cs_externalcallback.aspx</td>
			                            </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Integration</b></td>
				                        </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_withmasterpages.aspx">With Master Pages</a>
				                            </td>
					                        <td>cs_withmasterpages.aspx</td>
			                            </tr>
										<%--<tr>
				                            <td class="link">
					                            <a href="cs_Tree_Page.aspx">With TreeView inside User Control <b style="color:crimson">New</b></a>
				                            </td>
					                        <td>cs_Tree_Page.aspx</td>
			                            </tr>--%>
										<tr>
				                            <td class="link">
					                            <a href="cs_navigation/Default.aspx">Navigation using master pages</a>
				                            </td>
					                        <td>cs_navigation/Default.aspx</td>
			                            </tr>
				                        
				                    </table>
                        	    </td>
                        	</tr>

			            </table>
            			
			            <br />
			            <br />
			            <span class="tdText">
				            You can find the C# examples in the <b>AJAXPage</b> folder.<br />
				            They have the <b>cs_</b> prefix.
			            </span>
                    </div> 
                    
                    <div id="divVBNET">
			            <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
                        	            <tr>
				                            <td class="header" colspan="2"><b>Examples</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_CPUMonitorStyle1.aspx" style="margin-right:100px;">CPU Monitor Style1</a>
				                            </td>
					                        <td>vb_CPUMonitorStyle1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_CPUMonitorStyle2.aspx" style="margin-right:100px;">CPU Monitor Style2</a>
				                            </td>
					                        <td>vb_CPUMonitorStyle2.aspx</td>
			                            </tr>
										<%--<tr>
				                            <td class="link">
					                            <a href="vb_filebrowser.aspx">File Browser</a>
				                            </td>
					                        <td>vb_filebrowser.aspx</td>
			                            </tr>--%>
										<%--<tr>
				                            <td class="link">
					                            <a href="vb_addressbook.aspx" style="margin-right:100px;">Address Book</a>
				                            </td>
					                        <td>vb_addressbook.aspx</td>
			                            </tr>--%>
										<tr>
				                            <td class="link">
					                            <a href="vb_Products.aspx" style="margin-right:100px;">Products</a>
				                            </td>
					                        <td>vb_Products.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_ServerValidator.aspx" style="margin-right:100px;">Server Validator</a>
				                            </td>
					                        <td>vb_ServerValidator.aspx</td>
			                            </tr>
										<%--<tr>
				                            <td class="link">
					                            <a href="vb_ShoppingCart.aspx" style="margin-right:100px;">Shopping Cart</a>
				                            </td>
					                        <td>vb_ShoppingCart.aspx</td>
			                            </tr>--%>
										<tr>
				                            <td class="link">
					                            <a href="vb_Vote.aspx" style="margin-right:100px;">Voting</a>
				                            </td>
					                        <td>vb_Vote.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_login.aspx">Login control</a>
				                            </td>
					                        <td>vb_login.aspx</td>
			                            </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Callback Panel</b></td>
				                        </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_simpleliteralupdate.aspx">Simple Literal Update</a>
				                            </td>
					                        <td>vb_simpleliteralupdate.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_tabstrip.aspx" style="margin-right:100px;">TabStrip</a>
				                            </td>
					                        <td>vb_tabstrip.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_weather.aspx" style="margin-right:100px;">Weather information</a>
				                            </td>
					                        <td>vb_weather.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_cp_clientevents.aspx" style="margin-right:100px;">Client-side events</a>
				                            </td>
					                        <td>vb_cp_clientevents.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_nojavascript.aspx" style="margin-right:100px;">No Javascript</a>
				                            </td>
					                        <td>vb_nojavascript.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_updatepanel1.aspx" style="margin-right:100px;">UpdatePanel1</a>
				                            </td>
					                        <td>vb_updatepanel1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_updatepanel2.aspx" style="margin-right:100px;">UpdatePanel2</a>
				                            </td>
					                        <td>vb_updatepanel2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_updatepanelincontainer1.aspx" style="margin-right:100px;">UpdatePanelInContainer1</a>
				                            </td>
					                        <td>vb_updatepanelincontainer1.aspx</td>
			                            </tr>
										<%--<tr>
				                            <td class="link">
					                            <a href="vb_updatepanelincontainer2.aspx" style="margin-right:100px;">UpdatePanelInContainer2</a>
				                            </td>
					                        <td>vb_updatepanelincontainer2.aspx</td>
			                            </tr>--%>
										<tr>
				                            <td class="link">
					                            <a href="vb_updatepanelfrompage1.aspx" style="margin-right:100px;">UpdatePanelFromPage1</a>
				                            </td>
					                        <td>vb_updatepanelfrompage1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_updatepanelfrompage2.aspx" style="margin-right:100px;">UpdatePanelFromPage2</a>
				                            </td>
					                        <td>vb_updatepanelfrompage2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_updatepanelfrompage3.aspx" style="margin-right:100px;">UpdatePanelFromPage3</a>
				                            </td>
					                        <td>vb_updatepanelfrompage3.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_updateallpanels.aspx" style="margin-right:100px;">UpdateAllPanels</a>
				                            </td>
					                        <td>vb_updateallpanels.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_customize1.aspx" style="margin-right:100px;">Customize1</a>
				                            </td>
					                        <td>vb_customize1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_customize2.aspx" style="margin-right:100px;">Customize2</a>
				                            </td>
					                        <td>vb_customize2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_rendermethod.aspx" style="margin-right:100px;">RenderMethod</a>
				                            </td>
					                        <td>vb_rendermethod.aspx</td>
			                            </tr>
				                    </table>
                        	    </td>
                        	    
                        	    <td style="width:50px">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>  

										<tr>
				                            <td class="header" colspan="2"><b>Server to client</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_showalert.aspx" style="margin-right:100px;">ShowAlert</a>
				                            </td>
					                        <td>vb_showalert.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_setvalue.aspx" style="margin-right:100px;">SetValue</a>
				                            </td>
					                        <td>vb_setvalue.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_openwindow.aspx" style="margin-right:100px;">OpenWindow</a>
				                            </td>
					                        <td>vb_openwindow.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_showconfirmationdialog.aspx" style="margin-right:100px;">ShowConfirmationDialog</a>
				                            </td>
					                        <td>vb_showconfirmationdialog.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_createtimer1.aspx" style="margin-right:100px;">CreateTimer1</a>
				                            </td>
					                        <td>vb_createtimer1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_createtimer2.aspx" style="margin-right:100px;">CreateTimer2</a>
				                            </td>
					                        <td>vb_createtimer2.aspx</td>
			                            </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Client to server </b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_sendcollection.aspx">Send Collection</a>
				                            </td>
					                        <td>vb_sendcollection.aspx</td>
			                            </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Other Examples</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_addparam1.aspx" style="margin-right:100px;">AddParam1</a>
				                            </td>
					                        <td>vb_addparam1.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_addparam2.aspx" style="margin-right:100px;">AddParam2</a>
				                            </td>
					                        <td>vb_addparam2.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_callbackviewstate.aspx" style="margin-right:100px;">CallbackViewState</a>
				                            </td>
					                        <td>vb_callbackviewstate.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_clientevents.aspx" style="margin-right:100px;">Client-side Events</a>
				                            </td>
					                        <td>vb_clientevents.aspx</td>
			                            </tr>										
										<%--<tr>
				                            <td class="link">
					                            <a href="vb_response.aspx" style="margin-right:100px;">Response</a>
				                            </td>
					                        <td>vb_response.aspx</td>
			                            </tr>--%>
										<tr>
				                            <td class="link">
					                            <a href="vb_redirect.aspx" style="margin-right:100px;">Redirect</a>
				                            </td>
					                        <td>vb_redirect.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_sync.aspx" style="margin-right:100px;">Synchronous Callback</a>
				                            </td>
					                        <td>vb_sync.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_async.aspx" style="margin-right:100px;">Asynchronous Callback</a>
				                            </td>
					                        <td>vb_async.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_jsvisible.aspx" style="margin-right:100px;">JSVisible</a>
				                            </td>
					                        <td>vb_jsvisible.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_baseclass.aspx">Using a base class</a> 
				                            </td>
					                        <td>vb_baseclass.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_externalcallback.aspx">External callback</a>
				                            </td>
					                        <td>vb_externalcallback.aspx</td>
			                            </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Integration</b></td>
				                        </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_withmasterpages.aspx">With Master Pages</a>
				                            </td>
					                        <td>vb_withmasterpages.aspx</td>
			                            </tr>
										<%--<tr>
				                            <td class="link">
					                            <a href="vb_Tree_Page.aspx">With TreeView inside User Control <b style="color:crimson">New</b></a>
				                            </td>
					                        <td>vb_Tree_Page.aspx</td>
			                            </tr>		--%>								
										<tr>
				                            <td class="link">
					                            <a href="vb_navigation/Default.aspx">Navigation using master pages</a>
				                            </td>
					                        <td>vb_navigation/Default.aspx</td>
			                            </tr>
				                        
				                    </table>
                        	    </td>
                        	</tr>

			            </table>
			            
			            <br /><br />
			            <span class="tdText">
				            You can find the VB.NET examples in the <b>AJAXPage</b> folder.<br />
				            They have the <b>vb_</b> prefix.
			            </span>
                    </div> 
                </td>
			</tr>
        </table>
        <br />
        <br />
        <a href="http://www.obout.com/AJAXPage/">obout ASP.NET AJAXPage home</a>
        <br />
        <a href="http://www.obout.com">obout inc home</a>
       </div>                             
    </form>
</body>
</html>
