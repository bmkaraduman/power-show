<%@ Page Language="C#" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
	<title>obout ASP.NET Easy Menu examples</title>
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
	        <span class="tdText"><b>ASP.NET Easy Menu - Horizontal Transparent Example</b></span>
		    <br /><br />	
			<br /><br /> 
	        <table width="100%">
		        <tr>
			        <td class="tdText" valign="top">
				        <oem:EasyMenu id="EasymenuMain" runat="server" ShowEvent="Always" StyleFolder="styles/transparent"
					        Position="Horizontal" CSSMenu="ParentMenu" CSSMenuItemContainer="ParentItemContainer" Width="430">
					        <CSSClassesCollection>
						        <oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuItem" ComponentSubMenuCellOver="ParentItemSubMenuCellOver"
							        ComponentContentCell="ParentItemContentCell" Component="ParentItem" ComponentSubMenuCell="ParentItemSubMenuCell"
							        ComponentIconCellOver="ParentItemIconCellOver" ComponentIconCell="ParentItemIconCell"
							        ComponentOver="ParentItemOver" ComponentContentCellOver="ParentItemContentCellOver"></oem:CSSClasses>
						        <oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuSeparator" ComponentSubMenuCellOver="ParentSeparatorSubMenuCellOver"
							        ComponentContentCell="ParentSeparatorContentCell" Component="ParentSeparator"
							        ComponentSubMenuCell="ParentSeparatorSubMenuCell" ComponentIconCellOver="ParentSeparatorIconCellOver"
							        ComponentIconCell="ParentSeparatorIconCell" ComponentOver="ParentSeparatorOver"
							        ComponentContentCellOver="ParentSeparatorContentCellOver"></oem:CSSClasses>
					        </CSSClassesCollection>
					        <Components>
						        <oem:MenuItem InnerHtml="Brands" ID="item1"></oem:MenuItem>
						        <oem:MenuSeparator InnerHtml="&nbsp;" ID="mainMenuSeparator1"></oem:MenuSeparator>
						        <oem:MenuItem InnerHtml="Systems" ID="item2"></oem:MenuItem>
						        <oem:MenuSeparator InnerHtml="&nbsp;" ID="mainMenuSeparator2"></oem:MenuSeparator>
						        <oem:MenuItem InnerHtml="Hardware" ID="item3"></oem:MenuItem>
						        <oem:MenuSeparator InnerHtml="&nbsp;" ID="mainMenuSeparator3"></oem:MenuSeparator>
						        <oem:MenuItem InnerHtml="Software" ID="item4"></oem:MenuItem>
					        </Components>
				        </oem:EasyMenu>
        				
				        <oem:easymenu id="EasyMenu1" runat="server" StyleFolder="styles/transparent" Width="140"
					        UseIcons="false" AttachTo="item1, item11" ShowEvent="MouseOver" Align="Under" OffsetVertical="-4">
					        <Components>
						        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 1')" InnerHtml="IBM" ID="menuItem1"></oem:MenuItem>
						        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 2')" InnerHtml="MICROSOFT" ID="menuItem2"></oem:MenuItem>
						        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 3')" InnerHtml="OBOUT" ID="menuItem3"></oem:MenuItem>
						        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 4')" InnerHtml="ORACLE" ID="menuItem22"></oem:MenuItem>
					        </Components>
				        </oem:easymenu>
				        <oem:easymenu id="Easymenu2" runat="server" StyleFolder="styles/transparent" Width="140"
					        UseIcons="false" AttachTo="item2, item12" ShowEvent="MouseOver" Align="Under" OffsetVertical="-4">
					        <Components>
						        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 1')" InnerHtml="Desktops" ID="menuItem6"></oem:MenuItem>
						        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 2')" InnerHtml="Handhelds" ID="menuItem7"></oem:MenuItem>
						        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 3')" InnerHtml="Notebooks" ID="menuItem8"></oem:MenuItem>
						        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 4')" InnerHtml="Servers" ID="menuItem4"></oem:MenuItem>
					        </Components>
				        </oem:easymenu>
				        <oem:easymenu id="Easymenu3" runat="server" StyleFolder="styles/transparent" Width="140"
					        UseIcons="false" AttachTo="item3, item13" ShowEvent="MouseOver" Align="Under" OffsetVertical="-4">
					        <Components>
						        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 1')" InnerHtml="Accessories" ID="menuItem9"></oem:MenuItem>
						        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 2')" InnerHtml="Keyboards" ID="menuItem10"></oem:MenuItem>
						        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 3')" InnerHtml="Memory" ID="menuItem11"></oem:MenuItem>
						        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 4')" InnerHtml="Printers" ID="menuItem12"></oem:MenuItem>
						        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 5')" InnerHtml="Video Cards" ID="menuItem13"></oem:MenuItem>
					        </Components>
				        </oem:easymenu>
				        <oem:easymenu id="Easymenu4" runat="server" StyleFolder="styles/transparent" Width="140"
					        UseIcons="false" AttachTo="item4, item14" ShowEvent="MouseOver" Align="Under" OffsetVertical="-4">
					        <Components>
						        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 1')" InnerHtml="Applications" ID="menuItem14"></oem:MenuItem>
						        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 2')" InnerHtml="Licensing" ID="menuItem15"></oem:MenuItem>
					        </Components>
				        </oem:easymenu>
				        <br />
				        <br />
				        <span class="tdText"><b>Easy Menu</b> can be displayed over iframe elements even when using transparent background.</span>
        						
				        <br />
					        <iframe width="400px" src=""></iframe>
			        </td>
		        </tr>
	        </table>
	        
	        <br /><br /><br />
		
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	    
	    </form>
	</body>
</html>