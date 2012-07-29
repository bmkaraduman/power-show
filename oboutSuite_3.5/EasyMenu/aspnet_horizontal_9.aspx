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
	<!--// Needed styles for the table cells (the head of the menus) //-->
	<style type="text/css">
		.menuItem1 {width: 80px; height: 28px; cursor: pointer; cursor: hand; border-left: 1px solid #FFFFFF; border-right: 1px solid #FFFFFF; background: url(styles/horizontal9/le_1/bg_em_1.jpg) repeat-x bottom #B6BECF; font-family: arial; font-size: 10px; color: #333333; text-align: center;}
		.menuItem2 {width: 80px; height: 28px; cursor: pointer; cursor: hand; border-right: 1px solid #FFFFFF; background: url(styles/horizontal9/le_2/bg_em_2.jpg) repeat-x bottom #B6BECF; font-family: arial; font-size: 10px; color: #333333; text-align: center;}
		.menuItem3 {width: 80px; height: 28px; cursor: pointer; cursor: hand; border-right: 1px solid #FFFFFF; background: url(styles/horizontal9/le_3/bg_em_3.jpg) repeat-x bottom #B6BECF; font-family: arial; font-size: 10px; color: #333333; text-align: center;}
		.menuItem4 {width: 80px; height: 28px; cursor: pointer; cursor: hand; border-right: 1px solid #FFFFFF; background: url(styles/horizontal9/le_4/bg_em_4.jpg) repeat-x bottom #B6BECF; font-family: arial; font-size: 10px; color: #333333; text-align: center;}
		.menuItem5 {width: 80px; height: 28px; cursor: pointer; cursor: hand; border-right: 1px solid #FFFFFF; background: url(styles/horizontal9/le_5/bg_em_5.jpg) repeat-x bottom #B6BECF; font-family: arial; font-size: 10px; color: #333333; text-align: center;}
	</style>
	
	<form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - Horizontal 9 skin</b></span>
		    <br /><br />	
			<br /><br />
	
	        <!--// The head of the menus //-->
	        <table border="0" cellpadding="0" cellspacing="0">
		        <tr>
			        <td id="item1" class="menuItem1">Item1</td>
			        <td id="item2" class="menuItem2">Item2</td>
			        <td id="item3" class="menuItem3">Item3</td>
			        <td id="item4" class="menuItem4">Item4</td>
			        <td id="item5" class="menuItem5">Item5</td>
		        </tr>
	        </table>
        	
	        <!--// The menus //-->
	        <oem:EasyMenu id="Easymenu1" runat="server" ShowEvent="MouseOver" AttachTo="item1" Align="Under" Width="140" OffsetVertical="-4" OffsetHorizontal="-1" StyleFolder="styles/horizontal9/le_1">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 1')" InnerHtml="Item11" ID="menuItem11"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 2')" InnerHtml="Item12" ID="menuItem12"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Item13" ID="menuItem13"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu2" runat="server" ShowEvent="MouseOver" AttachTo="item2" Align="Under" Width="140" OffsetVertical="-4" OffsetHorizontal="-2" StyleFolder="styles/horizontal9/le_2">
		        <Components>
			        <oem:MenuItem InnerHtml="Item21" ID="menuItem21"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Item22" ID="menuItem22"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu3" runat="server" ShowEvent="MouseOver" AttachTo="item3" Align="Under" Width="140" OffsetVertical="-4" OffsetHorizontal="-2" StyleFolder="styles/horizontal9/le_3">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 1')" InnerHtml="Item31" ID="menuItem31"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 2')" InnerHtml="Item32" ID="menuItem32"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 3')" InnerHtml="Item33" ID="menuItem33"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 4')" InnerHtml="Item34" ID="menuItem34"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 5')" InnerHtml="Item35" ID="menuItem35"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 6')" InnerHtml="Item36" ID="menuItem36"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu4" runat="server" ShowEvent="MouseOver" AttachTo="item4" Align="Under" Width="140" OffsetVertical="-4" OffsetHorizontal="-2" StyleFolder="styles/horizontal9/le_4">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 1')" InnerHtml="Item41" ID="menuItem41"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 2')" InnerHtml="Item42" ID="menuItem42"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 3')" InnerHtml="Item43" ID="menuItem43"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 4')" InnerHtml="Item44" ID="menuItem44"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu5" runat="server" ShowEvent="MouseOver" AttachTo="item5" Align="Under" Width="140" OffsetVertical="-4" OffsetHorizontal="-2" StyleFolder="styles/horizontal9/le_5">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 5 - SubItem 1')" InnerHtml="Item51" ID="menuItem51"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 5 - SubItem 2')" InnerHtml="Item52" ID="menuItem52"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 5 - SubItem 3')" InnerHtml="Item53" ID="menuItem53"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu13" runat="server" ShowEvent="MouseOver" AttachTo="menuItem13" Align="Right" Width="140" OffsetVertical="-2" OffsetHorizontal="-3" StyleFolder="styles/horizontal9/le_1">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 3 - SubItem 1')" InnerHtml="Item131" ID="menuItem131"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 3 - SubItem 2')" InnerHtml="Item132" ID="menuItem132"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 3 - SubItem 3')" InnerHtml="Item133" ID="menuItem133"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu21" runat="server" ShowEvent="MouseOver" AttachTo="menuItem21" Align="Right" Width="140" OffsetVertical="-2" OffsetHorizontal="-3" StyleFolder="styles/horizontal9/le_2">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 1 - SubItem 1')" InnerHtml="Item211" ID="menuItem211"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu22" runat="server" ShowEvent="MouseOver" AttachTo="menuItem22" Align="Right" Width="140" OffsetVertical="-2" OffsetHorizontal="-3" StyleFolder="styles/horizontal9/le_2">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 2 - SubItem 1')" InnerHtml="Item221" ID="menuItem221"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Item222" ID="menuItem222"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 2 - SubItem 3')" InnerHtml="Item223" ID="menuItem223"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu222" runat="server" ShowEvent="MouseOver" AttachTo="menuItem222" Align="Right" Width="140" OffsetVertical="-2" OffsetHorizontal="-3" StyleFolder="styles/horizontal9/le_2">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 2 - SubItem 2 - SubItem 1')" InnerHtml="Item2221" ID="menuItem2221"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 2 - SubItem 2 - SubItem 2')" InnerHtml="Item2222" ID="menuItem2222"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 2 - SubItem 2 - SubItem 3')" InnerHtml="Item2223" ID="menuItem2223"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu36" runat="server" ShowEvent="MouseOver" AttachTo="menuItem36" Align="Right" Width="140" OffsetVertical="-2" OffsetHorizontal="-3" StyleFolder="styles/horizontal9/le_3">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 6 - SubItem 1')" InnerHtml="Item361" ID="menuItem361"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 6 - SubItem 2')" InnerHtml="Item362" ID="menuItem362"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 6 - SubItem 3')" InnerHtml="Item363" ID="menuItem363"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 6 - SubItem 4')" InnerHtml="Item364" ID="menuItem364"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu42" runat="server" ShowEvent="MouseOver" AttachTo="menuItem42" Align="Right" Width="140" OffsetVertical="-2" OffsetHorizontal="-3" StyleFolder="styles/horizontal9/le_4">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 2 - SubItem 1')" InnerHtml="Item421" ID="menuItem421"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 2 - SubItem 2')" InnerHtml="Item422" ID="menuItem422"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu51" runat="server" ShowEvent="MouseOver" AttachTo="menuItem51" Align="Right" Width="140" OffsetVertical="-2" OffsetHorizontal="-3" StyleFolder="styles/horizontal9/le_5">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 5 - SubItem 1 - SubItem 1')" InnerHtml="Item511" ID="menuItem511"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 5 - SubItem 1 - SubItem 2')" InnerHtml="Item512" ID="menuItem512"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu52" runat="server" ShowEvent="MouseOver" AttachTo="menuItem52" Align="Right" Width="140" OffsetVertical="-2" OffsetHorizontal="-3" StyleFolder="styles/horizontal9/le_5">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 5 - SubItem 2 - SubItem 1')" InnerHtml="Item521" ID="menuItem521"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 5 - SubItem 2 - SubItem 2')" InnerHtml="Item522" ID="menuItem522"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 5 - SubItem 2 - SubItem 3')" InnerHtml="Item523" ID="menuItem523"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu522" runat="server" ShowEvent="MouseOver" AttachTo="menuItem522" Align="Right" Width="140" OffsetVertical="-2" OffsetHorizontal="-3" StyleFolder="styles/horizontal9/le_5">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 5 - SubItem 2 - SubItem 2 - SubItem 1')" InnerHtml="Item5221" ID="menuItem5221"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        
	        <br /><br /><br />
	        
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	    
	    </form>
    </body>
</html>