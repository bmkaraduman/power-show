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
		    margin: 20px;
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
	        <span class="tdText"><b>ASP.NET Easy Menu - Vertical 1 skin</b></span>
		    <br /><br />	
			<br /><br /> 
	
	        <!--// The head of the menus //-->
	        <oem:EasyMenu id="EasymenuMain" runat="server" ShowEvent="Always" StyleFolder="styles/vertical1"
		        Position="Vertical" Width="140">
		        <Components>
			        <oem:MenuItem InnerHtml="Item1" ID="item1"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Item2" ID="item2"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Item3" ID="item3"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Item4" ID="item4"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
        	
	        <!--// The menus //-->
	        <oem:EasyMenu id="Easymenu1" runat="server" ShowEvent="MouseOver" AttachTo="item1" Align="Right" Width="140" OffsetHorizontal="-2" StyleFolder="styles/vertical1">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 1')" InnerHtml="Item11" ID="menuItem11"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 2')" InnerHtml="Item12" ID="menuItem12"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Item13" ID="menuItem13"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu2" runat="server" ShowEvent="MouseOver" AttachTo="item2" Align="Right" Width="140" OffsetHorizontal="-2" StyleFolder="styles/vertical1">
		        <Components>
			        <oem:MenuItem InnerHtml="Item21" ID="menuItem21"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Item22" ID="menuItem22"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu3" runat="server" ShowEvent="MouseOver" AttachTo="item3" Align="Right" Width="140" OffsetHorizontal="-2" StyleFolder="styles/vertical1">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 1')" InnerHtml="Item31" ID="menuItem31"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 2')" InnerHtml="Item32" ID="menuItem32"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 3')" InnerHtml="Item33" ID="menuItem33"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 4')" InnerHtml="Item34" ID="menuItem34"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 5')" InnerHtml="Item35" ID="menuItem35"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 6')" InnerHtml="Item36" ID="menuItem36"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu4" runat="server" ShowEvent="MouseOver" AttachTo="item4" Align="Right" Width="140" OffsetHorizontal="-2" StyleFolder="styles/vertical1">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 1')" InnerHtml="Item41" ID="menuItem41"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 2')" InnerHtml="Item42" ID="menuItem42"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 3')" InnerHtml="Item43" ID="menuItem43"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 4')" InnerHtml="Item44" ID="menuItem44"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu13" runat="server" ShowEvent="MouseOver" AttachTo="menuItem13" Align="Right" Width="140" StyleFolder="styles/vertical1">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 3 - SubItem 1')" InnerHtml="Item131" ID="menuItem131"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 3 - SubItem 2')" InnerHtml="Item132" ID="menuItem132"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 3 - SubItem 3')" InnerHtml="Item133" ID="menuItem133"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu21" runat="server" ShowEvent="MouseOver" AttachTo="menuItem21" Align="Right" Width="140" StyleFolder="styles/vertical1">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 1 - SubItem 1')" InnerHtml="Item211" ID="menuItem211"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu22" runat="server" ShowEvent="MouseOver" AttachTo="menuItem22" Align="Right" Width="140" StyleFolder="styles/vertical1">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 2 - SubItem 1')" InnerHtml="Item221" ID="menuItem221"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Item222" ID="menuItem222"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 2 - SubItem 3')" InnerHtml="Item223" ID="menuItem223"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu222" runat="server" ShowEvent="MouseOver" AttachTo="menuItem222" Align="Right" Width="140" StyleFolder="styles/vertical1">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 2 - SubItem 2 - SubItem 1')" InnerHtml="Item2221" ID="menuItem2221"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 2 - SubItem 2 - SubItem 2')" InnerHtml="Item2222" ID="menuItem2222"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 2 - SubItem 2 - SubItem 3')" InnerHtml="Item2223" ID="menuItem2223"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        
	        <br /><br /><br />
	        
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	
	    </form>
    </body>
</html>