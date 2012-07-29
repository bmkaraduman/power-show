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
                    lblPath.Text = "<b>Path to folder with TextMenu examples: </b>" + oXMLReader.ReadString();
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
    <title>obout ASP.NET TextMenu examples</title>
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
        <span style="font-weight:bold;">obout ASP.NET Text Menu examples</span> (version 3.8.10.0, released on October 9, 2008)
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
				                            <td class="header" colspan="2"><b>Appearance</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_horizontal.aspx" style="margin-right:100px;">Horizontal</a>
				                            </td>
					                        <td>aspnet_horizontal.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_SubmenuIcon.aspx" style="margin-right:100px;">SubmenuIcon</a>
				                            </td>
					                        <td>aspnet_SubmenuIcon.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_Transparent.aspx" style="margin-right:100px;">Transparent</a>
				                            </td>
					                        <td>aspnet_Transparent.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_Vertical.aspx" style="margin-right:100px;">Vertical</a>
				                            </td>
					                        <td>aspnet_Vertical.aspx</td>
			                            </tr>
										<tr>
				                            <td class="header" colspan="2"><b>Others</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_fromxml.aspx">Load from XML</a> <b style="color:crimson">New</b>
				                            </td>
					                        <td>aspnet_fromxml.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_inside_usercontrol.aspx">Inside User Control</a> <b style="color:crimson">New</b>
				                            </td>
					                        <td>aspnet_inside_usercontrol.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="aspnet_inside_masterpage.aspx">Inside Master Page</a> <b style="color:crimson">New</b>
				                            </td>
					                        <td>aspnet_inside_masterpage.aspx</td>
			                            </tr>
				                    </table>
                        	    </td>
                        	    
                        	    <td style="width:50px">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        
                        	    </td>
                        	</tr>

			            </table>
            			
			            <br />
			            <br />
			            <span class="tdText">
				            You can find the ASP.NET examples in the <b>TextMenu</b> folder.<br />
				            They have the <b>aspnet_</b> prefix.
			            </span>
                    </div>  
                    
                    <div id="divCSharp">
			            <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
                        	            <tr>
				                            <td class="header" colspan="2"><b>Appearance</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_horizontal.aspx" style="margin-right:100px;">Horizontal</a>
				                            </td>
					                        <td>cs_horizontal.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_SubmenuIcon.aspx" style="margin-right:100px;">SubmenuIcon</a>
				                            </td>
					                        <td>cs_SubmenuIcon.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_Transparent.aspx" style="margin-right:100px;">Transparent</a>
				                            </td>
					                        <td>cs_Transparent.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_Vertical.aspx" style="margin-right:100px;">Vertical</a>
				                            </td>
					                        <td>cs_Vertical.aspx</td>
			                            </tr>
										<tr>
				                            <td class="header" colspan="2"><b>Others</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_fromxml.aspx">Load from XML</a> <b style="color:crimson">New</b>
				                            </td>
					                        <td>cs_fromxml.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_inside_usercontrol.aspx">Inside User Control</a> <b style="color:crimson">New</b>
				                            </td>
					                        <td>cs_inside_usercontrol.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="cs_inside_masterpage.aspx">Inside Master Page</a> <b style="color:crimson">New</b>
				                            </td>
					                        <td>cs_inside_masterpage.aspx</td>
			                            </tr>
				                    </table>
                        	    </td>
								 
								<td style="width:50px">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>  
										<tr>
				                            <td class="header" colspan="2"><b>From Database</b></td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_database.aspx">Horizontal</a>
					                        </td>
					                        <td>cs_database.aspx</td>
				                        </tr>
									</table>
								</td>
                        	</tr>

			            </table>
            			
			            <br />
			            <br />
			            <span class="tdText">
				            You can find the C# examples in the <b>TextMenu</b> folder.<br />
				            They have the <b>cs_</b> prefix.
			            </span>
                    </div> 
                    
                    <div id="divVBNET">
			            <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
										<tr>
				                            <td class="header" colspan="2"><b>Appearance</b></td>
				                        </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_horizontal.aspx" style="margin-right:100px;">Horizontal</a>
				                            </td>
					                        <td>vb_horizontal.aspx</td>
			                            </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>From Database</b></td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_database.aspx">Vertical</a>
					                        </td>
					                        <td>vb_database.aspx</td>
				                        </tr>
										
										
										<tr>
				                            <td class="header" colspan="2"><b>Others</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_fromxml.aspx">Load from XML</a> <b style="color:crimson">New</b>
				                            </td>
					                        <td>vb_fromxml.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_inside_usercontrol.aspx">Inside User Control</a> <b style="color:crimson">New</b>
				                            </td>
					                        <td>vb_inside_usercontrol.aspx</td>
			                            </tr>
										<tr>
				                            <td class="link">
					                            <a href="vb_inside_masterpage.aspx">Inside Master Page</a> <b style="color:crimson">New</b>
				                            </td>
					                        <td>vb_inside_masterpage.aspx</td>
			                            </tr>
				                    </table>
                        	    </td>
                        	    
                        	    <td style="width:50px">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        
                        	    </td>
                        	</tr>

			            </table>
			            
			            <br /><br />
			            <span class="tdText">
				            You can find the VB.NET examples in the <b>TextMenu</b> folder.<br />
				            They have the <b>vb_</b> prefix.
			            </span>
                    </div> 
                </td>
			</tr>
        </table>
        <br />
        <br />
        <a href="http://www.obout.com/tm/">obout TextMenu home</a>
        <br />
        <a href="http://www.obout.com">obout inc home</a>
       </div>                             
    </form>
</body>
</html>
