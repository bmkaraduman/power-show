<%@ Page Language="C#" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
	<title>obout ASP.NET Easy Menu examples</title>

	<!--// Only needed for this page's formatting //-->
	<style type="text/css">
			body 
			{
			    font-family: Verdana; 
			    font-size: XX-Small; 
			    margin: 0px; 
			    padding: 20px
			}
			.title 
			{
			    font-size: X-Large; 
			    padding: 20px; 
			    border-bottom: 2px solid gray;
			}
			.tdText {
                font:11px Verdana;
                color:#333333;
            }
		    .div 
		    {
		        border: black 1px solid; 
		        width: 25px; 
		        height: 25px; 
		        align: middle; 
		        background-color: silver; 
		        cursor: default;
		        }
	</style>
</head>
<body>
	<form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - Style10 skin</b></span>
		    <br /><br />	
			<br /><br />
	
	        <span class="tdText">Right click this to see the Easy Menu:</span>
	
	        <!--// Div to which the menu attaches to //-->
	        <div id="div1" class="div"></div>

	        <!--// The menus //-->
	        <oem:easymenu id="EasyMenu1" runat="server" StyleFolder="styles/style10" Width="145" UseIcons="false"
		        AttachTo="div1" ShowEvent="ContextMenu" Align="Under">
		        <Components>
			        <oem:MenuItem UrlTarget="_blank" ID="menuItem1" Url="http://www.obout.com">
				        <span style='color:#666666; font:bold; cursor:pointer;'>obout.com<b style='color:crimson; text-decoration:none;'>
						        Home</b></span>
			        </oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('you just clicked Alert')" InnerHtml="Alert" ID="menuItem2"></oem:MenuItem>
			        <oem:MenuItem ID="menuItem3">
				        <div style='valign: middle;'>Any
					        <span style='background-color:gold; padding-left:2px; padding-right:2px;'>HTML</span></div>
			        </oem:MenuItem>
			        <oem:MenuItem InnerHtml="Browser Operations" ID="menuItem4"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Recycle" ID="menuItem5"></oem:MenuItem>
		        </Components>
	        </oem:easymenu>
	        <oem:easymenu id="EasyMenu2" runat="server" StyleFolder="styles/style10" Width="145" UseIcons="false" AttachTo="menuItem4" ShowEvent="MouseOver" Align="Right" OffsetHorizontal="-2" OffsetVertical="-2">
		        <Components>
			        <oem:MenuItem UrlTarget="_blank" InnerHtml="Open New Page" ID="menuItem21" Url="about:blank"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="try {window.opener.focus(); window.opener = this; window.close();} catch (e) {};"
				        InnerHtml="Close This Page" ID="menuItem22"></oem:MenuItem>
		        </Components>
	        </oem:easymenu>
	        
	        <br /><br /><br />
	        
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	        
	    </form>
   </body>
</html>