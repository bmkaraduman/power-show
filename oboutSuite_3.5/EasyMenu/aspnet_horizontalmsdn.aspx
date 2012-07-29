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
	</style>
	
</head>
<body>
	<form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - Horizontal MSDN skin</b></span>
		    <br /><br />	
			<br /><br /> 
	
	        <div style="padding-left:100px;">
	        <!--// The head of the menus //-->
	        <oem:EasyMenu id="EasymenuMain" runat="server" ShowEvent="Always" 
		        StyleFolder="styles/msdn2" Position="Horizontal" Width="570">
		        <Components>
			        <oem:MenuItem InnerHtml="Home" ID="item1"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Library" ID="item2"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Learn" ID="item3"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Downloads" ID="item4"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Support" ID="item5"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
        	
	        <oem:EasyMenu id="Easymenu1" runat="server" OffsetHorizontal="-50" Position="Horizontal" ShowEvent="MouseOver" 
		        AttachTo="item1" Align="Under" Width="600px" StyleFolder="styles/MSDN2">
		        <Components>
			        <oem:MenuItem InnerHtml="Developer Centers" ID="menuItem11"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Getting Started" ID="menuItem12"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Evaluation" ID="menuItem13"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Webcasts" ID="menuItem14"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="How to Buy" ID="menuItem15"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="MSDN Worldwide" ID="menuItem16"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
        	
	        <oem:EasyMenu id="Easymenu2" runat="server" OffsetHorizontal="-160" Position="Horizontal" ShowEvent="MouseOver" 
		        AttachTo="item2" Align="Under" Width="630px" StyleFolder="styles/MSDN2">
		        <Components>
			        <oem:MenuItem InnerHtml="Development Tools and Languages" ID="menuItem21"></oem:MenuItem>
			        <oem:MenuItem InnerHtml=".NET Development" ID="menuItem22"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Office Development" ID="menuItem23"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="MSDN Library Archive" ID="menuItem25"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
        	
	        <oem:EasyMenu id="Easymenu3" runat="server" OffsetHorizontal="-280" Position="Horizontal" ShowEvent="MouseOver" 
		        AttachTo="item3" Align="Under" Width="540px" StyleFolder="styles/MSDN2">
		        <Components>
			        <oem:MenuItem InnerHtml="MSDN" ID="menuItem31"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Developer Centers" ID="menuItem32"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Microsoft Developer Network" ID="menuItem33"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="'How do I?' videos" ID="menuItem35"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        </div>
	        
	        <br /><br /><br /><br /><br />
	        
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	    </form>
    </body>
</html>