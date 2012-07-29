<%@ Page Language="C#" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
	<title>obout ASP.NET Easy Menu examples</title>
	<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
    </style>
	</head>
	<body>
	<form runat="server">
	            <span class="tdText"><b>ASP.NET Easy Menu - Horizontal Transparent</b></span>
				<br />
				<br /><br />
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
				<br /> <br />
				<span class="tdText">
				<b>Easy Menu</b> can be displayed over window elements (drop-downs) or flash movies <br />even when using transparent background.
				</span>		
					<table>
						<tr>
							<td valign="top">
								<asp:DropDownList ID="DropDownList" runat="server" name="DropDown List" value="EasyMenu" width="150px">
									<asp:ListItem value="ASP TreeView">ASP TreeView</asp:ListItem>
									<asp:ListItem value="SlideMenu">SlideMenu</asp:ListItem>
									<asp:ListItem value="Calendar">Calendar</asp:ListItem>
									<asp:ListItem value="PostBack">PostBack</asp:ListItem>
									<asp:ListItem value="Splitter">Splitter</asp:ListItem>
									<asp:ListItem value="EasyMenu">EasyMenu</asp:ListItem>
								</asp:DropDownList>
							</td>
							<td style="padding-left:5px" valing="top">
								<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="300" height="200" id="snow_final" align="middle">
									<param name="wmode" value="opaque">
									<param name="menu" value="false">
									<param name="allowScriptAccess" value="sameDomain" />
									<param name="movie" value="swf/snow_final.swf" />
									<param name="quality" value="high" />
									<param name="bgcolor" value="#ffffff" />
									<embed src="resources/snow_final.swf" wmode="opaque" menu="false" quality="high" bgcolor="#ffffff" width="300" height="200" name="snow_final" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
								</object>
							</td>
						</tr>
					</table>
			
		<br /><br /><br />
		
		<a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	    
	    </form>
	</body>
</html>