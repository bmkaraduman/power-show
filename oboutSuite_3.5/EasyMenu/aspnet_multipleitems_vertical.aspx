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
		<style>
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
	
		<span class="tdText"><b>ASP.NET Easy Menu - Long vertical menus with scrollbars</b></span>
	
		<br />
		<br /><br />
		<br />
		<oem:EasyMenu id="EasymenuMain" runat="server" ShowEvent="Always" StyleFolder="styles/vertical_multiple"
				Position="Horizontal" CSSMenu="ParentMenu" CSSMenuItemContainer="ParentItemContainer" Width="286">
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
					<oem:MenuItem InnerHtml="Item1" ID="item1"></oem:MenuItem>
					<oem:MenuSeparator InnerHtml="|" ID="mainMenuSeparator1"></oem:MenuSeparator>
					<oem:MenuItem InnerHtml="Item2" ID="item2"></oem:MenuItem>
				</Components>
			</oem:EasyMenu>
		    <oem:EasyMenu id="Easymenu1" runat="server" ShowEvent="MouseOver" AttachTo="item1" Align="Under" ExpandStyle="None"
	        Position="Vertical" Width="140" StyleFolder="/em/emstyles/styles/vertical_multiple">
	        <Components>
		        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 1')" InnerHtml="Item11" ID="menuItem11"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 2')" InnerHtml="Item12" ID="menuItem12"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 3')" InnerHtml="Item13" ID="menuItem13"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 4')" InnerHtml="Item14" ID="menuItem14"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 5')" InnerHtml="Item15" ID="menuItem15"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 6')" InnerHtml="Item16" ID="menuItem16"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 7')" InnerHtml="Item17" ID="menuItem17"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 8')" InnerHtml="Item18" ID="menuItem18"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 9')" InnerHtml="Item19" ID="menuItem19"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 10')" InnerHtml="Item110" ID="menuItem110"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 11')" InnerHtml="Item111" ID="menuItem111"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 12')" InnerHtml="Item112" ID="menuItem112"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 13')" InnerHtml="Item113" ID="menuItem113"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 14')" InnerHtml="Item114" ID="menuItem114"></oem:MenuItem>
	        </Components>
        </oem:EasyMenu>
        <oem:EasyMenu id="Easymenu2" runat="server" ShowEvent="MouseOver" AttachTo="item2" Align="Under" ExpandStyle="None"
	        Position="Vertical" Width="140" StyleFolder="/em/emstyles/styles/vertical_multiple">
	        <Components>
		        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 1')" InnerHtml="Item21" ID="menuItem21"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 2')" InnerHtml="Item22" ID="menuItem22"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 3')" InnerHtml="Item23" ID="menuItem23"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 4')" InnerHtml="Item24" ID="menuItem24"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 5')" InnerHtml="Item25" ID="menuItem25"></oem:MenuItem>
	        </Components>
        </oem:EasyMenu>
        <oem:EasyMenu id="Easymenu11" runat="server" ShowEvent="MouseOver" AttachTo="menuItem15" Align="Right" ExpandStyle="None"
	        Position="Vertical" Width="140" StyleFolder="/em/emstyles/styles/vertical_multiple">
	        <Components>
		        <oem:MenuItem OnClientClick="alert('Item 5 - SubItem 1')" InnerHtml="Item151" ID="menuItem151"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 5 - SubItem 2')" InnerHtml="Item152" ID="menuItem152"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 5 - SubItem 3')" InnerHtml="Item153" ID="menuItem153"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 5 - SubItem 4')" InnerHtml="Item154" ID="menuItem154"></oem:MenuItem>
		        <oem:MenuItem OnClientClick="alert('Item 5 - SubItem 5')" InnerHtml="Item155" ID="menuItem155"></oem:MenuItem>
	        </Components>
        </oem:EasyMenu>
	    <br /><br /><br /><br />
	        
	    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	
        </form>
	</body>
</html>