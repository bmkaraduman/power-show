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
			.div {border: black 1px solid; width: 25px; height: 25px; align: middle; background-color: silver; cursor: default;}
		</style>
	</head>
	<body>
	<form id="Form1" runat="server">
	
		<span class="tdText"><b>ASP.NET Easy Menu - Multiple menus</b></span>
	
		<br />
		<br /><br />
		<br />
		<span class="tdText">Each menu on this page is using a different style.</span><br />
		<br />
		<table>
			<tr>
				<td valign="top" class="tdText">
		<span class="tdText">Hover the main menu items.</span>
		<br /><br />
		<div id="divEasyMenu1">
			<oem:EasyMenu id="EasymenuMain" runat="server" ShowEvent="Always" Position="Horizontal" Width="330"
				StyleFolder="styles/Multiple" 
				CSSMenu="ParentMenu" 
				CSSMenuItemContainer="ParentItemContainer">
				<CSSClassesCollection>
					<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuItem" 
						Component="ParentItem" 
						ComponentSubMenuCellOver="ParentItemSubMenuCellOver"
						ComponentContentCell="ParentItemContentCell"  
						ComponentSubMenuCell="ParentItemSubMenuCell"
						ComponentIconCellOver="ParentItemIconCellOver" 
						ComponentIconCell="ParentItemIconCell"
						ComponentOver="ParentItemOver" 
						ComponentContentCellOver="ParentItemContentCellOver" />
					<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuSeparator" 
						Component="ParentSeparator"
						ComponentSubMenuCellOver="ParentSeparatorSubMenuCellOver"
						ComponentContentCell="ParentSeparatorContentCell" 
						ComponentSubMenuCell="ParentSeparatorSubMenuCell" 
						ComponentIconCellOver="ParentSeparatorIconCellOver"
						ComponentIconCell="ParentSeparatorIconCell" 
						ComponentOver="ParentSeparatorOver"
						ComponentContentCellOver="ParentSeparatorContentCellOver" />
				</CSSClassesCollection>
				<Components>
					<oem:MenuItem InnerHtml="Item1" ID="item1" />
					<oem:MenuSeparator InnerHtml="|" ID="separator1" />
					<oem:MenuItem InnerHtml="Item2" ID="item2" />
					<oem:MenuSeparator InnerHtml="|" ID="separator2" />
					<oem:MenuItem InnerHtml="Item3" ID="item3" />
					<oem:MenuSeparator InnerHtml="|" ID="separator3" />
					<oem:MenuItem InnerHtml="Item4" ID="item4" />
				</Components>
			</oem:EasyMenu>
			
			<oem:EasyMenu id="Easymenu1" runat="server" Align="Under" ShowEvent="MouseOver" Position="Vertical" Width="120" AttachTo="item1"
				StyleFolder="styles/Multiple" 
				CSSMenu="ParentMenu_1" 
				CSSMenuItemContainer="ParentItemContainer_1">
				<CSSClassesCollection>
					<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuItem" 
						Component="ParentItem_1" 
						ComponentSubMenuCellOver="ParentItemSubMenuCellOver_1"
						ComponentContentCell="ParentItemContentCell_1"  
						ComponentSubMenuCell="ParentItemSubMenuCell_1"
						ComponentIconCellOver="ParentItemIconCellOver_1" 
						ComponentIconCell="ParentItemIconCell_1"
						ComponentOver="ParentItemOver_1" 
						ComponentContentCellOver="ParentItemContentCellOver_1" />
					<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuSeparator" 
						Component="ParentSeparator_1"
						ComponentSubMenuCellOver="ParentSeparatorSubMenuCellOver_1"
						ComponentContentCell="ParentSeparatorContentCell_1" 
						ComponentSubMenuCell="ParentSeparatorSubMenuCell_1" 
						ComponentIconCellOver="ParentSeparatorIconCellOver_1"
						ComponentIconCell="ParentSeparatorIconCell_1" 
						ComponentOver="ParentSeparatorOver_1"
						ComponentContentCellOver="ParentSeparatorContentCellOver_1" />
				</CSSClassesCollection>
				<Components>
					<oem:MenuItem InnerHtml="Item11" ID="item11" />
					<oem:MenuItem InnerHtml="Item12" ID="item12" />
					<oem:MenuItem InnerHtml="Item13" ID="item13" />
					<oem:MenuItem InnerHtml="Item14" ID="item14" />
				</Components>
			</oem:EasyMenu>
			
			<oem:EasyMenu id="Easymenu2" runat="server" Align="Under" ShowEvent="MouseOver" Position="Vertical" Width="120" AttachTo="item2"
				StyleFolder="styles/Multiple" 
				CSSMenu="ParentMenu_2" 
				CSSMenuItemContainer="ParentItemContainer_2">
				<CSSClassesCollection>
					<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuItem" 
						Component="ParentItem_2" 
						ComponentSubMenuCellOver="ParentItemSubMenuCellOver_2"
						ComponentContentCell="ParentItemContentCell_2"  
						ComponentSubMenuCell="ParentItemSubMenuCell_2"
						ComponentIconCellOver="ParentItemIconCellOver_2" 
						ComponentIconCell="ParentItemIconCell_2"
						ComponentOver="ParentItemOver_2" 
						ComponentContentCellOver="ParentItemContentCellOver_2" />
					<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuSeparator" 
						Component="ParentSeparator_2"
						ComponentSubMenuCellOver="ParentSeparatorSubMenuCellOver_2"
						ComponentContentCell="ParentSeparatorContentCell_2" 
						ComponentSubMenuCell="ParentSeparatorSubMenuCell_2" 
						ComponentIconCellOver="ParentSeparatorIconCellOver_2"
						ComponentIconCell="ParentSeparatorIconCell_2" 
						ComponentOver="ParentSeparatorOver_2"
						ComponentContentCellOver="ParentSeparatorContentCellOver_2" />
				</CSSClassesCollection>
				<Components>
					<oem:MenuItem InnerHtml="Item21" ID="item21" />
					<oem:MenuItem InnerHtml="Item22" ID="item22" />
					<oem:MenuItem InnerHtml="Item23" ID="item23" />
					<oem:MenuItem InnerHtml="Item24" ID="item24" />
					<oem:MenuItem InnerHtml="Item25" ID="item25" />
					<oem:MenuItem InnerHtml="Item26" ID="item26" />
				</Components>
			</oem:EasyMenu>
			
			<oem:EasyMenu id="Easymenu3" runat="server" Align="Under" ShowEvent="MouseOver" Position="Vertical" Width="120" AttachTo="item3"
				StyleFolder="styles/Multiple" 
				CSSMenu="ParentMenu_3" 
				CSSMenuItemContainer="ParentItemContainer_3">
				<CSSClassesCollection>
					<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuItem" 
						Component="ParentItem_3" 
						ComponentSubMenuCellOver="ParentItemSubMenuCellOver_3"
						ComponentContentCell="ParentItemContentCell_3"  
						ComponentSubMenuCell="ParentItemSubMenuCell_3"
						ComponentIconCellOver="ParentItemIconCellOver_3" 
						ComponentIconCell="ParentItemIconCell_3"
						ComponentOver="ParentItemOver_3" 
						ComponentContentCellOver="ParentItemContentCellOver_3" />
					<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuSeparator" 
						Component="ParentSeparator_3"
						ComponentSubMenuCellOver="ParentSeparatorSubMenuCellOver_3"
						ComponentContentCell="ParentSeparatorContentCell_3" 
						ComponentSubMenuCell="ParentSeparatorSubMenuCell_3" 
						ComponentIconCellOver="ParentSeparatorIconCellOver_3"
						ComponentIconCell="ParentSeparatorIconCell_3" 
						ComponentOver="ParentSeparatorOver_3"
						ComponentContentCellOver="ParentSeparatorContentCellOver_3" />
				</CSSClassesCollection>
				<Components>
					<oem:MenuItem InnerHtml="Item31" ID="item31" />
					<oem:MenuItem InnerHtml="Item32" ID="item32" />
					<oem:MenuItem InnerHtml="Item33" ID="item33" />
					<oem:MenuItem InnerHtml="Item34" ID="item34" />
					<oem:MenuItem InnerHtml="Item35" ID="item35" />
					<oem:MenuItem InnerHtml="Item36" ID="item36" />
				</Components>
			</oem:EasyMenu>
			
			<oem:EasyMenu id="Easymenu4" runat="server" Align="Under" ShowEvent="MouseOver" Position="Vertical" Width="120" AttachTo="item4"
				StyleFolder="styles/Multiple" 
				CSSMenu="ParentMenu_4" 
				CSSMenuItemContainer="ParentItemContainer_4">
				<CSSClassesCollection>
					<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuItem" 
						Component="ParentItem_4" 
						ComponentSubMenuCellOver="ParentItemSubMenuCellOver_4"
						ComponentContentCell="ParentItemContentCell_4"  
						ComponentSubMenuCell="ParentItemSubMenuCell_4"
						ComponentIconCellOver="ParentItemIconCellOver_4" 
						ComponentIconCell="ParentItemIconCell_4"
						ComponentOver="ParentItemOver_4" 
						ComponentContentCellOver="ParentItemContentCellOver_4" />
					<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuSeparator" 
						Component="ParentSeparator_4"
						ComponentSubMenuCellOver="ParentSeparatorSubMenuCellOver_4"
						ComponentContentCell="ParentSeparatorContentCell_4" 
						ComponentSubMenuCell="ParentSeparatorSubMenuCell_4" 
						ComponentIconCellOver="ParentSeparatorIconCellOver_4"
						ComponentIconCell="ParentSeparatorIconCell_4" 
						ComponentOver="ParentSeparatorOver_4"
						ComponentContentCellOver="ParentSeparatorContentCellOver_4" />
				</CSSClassesCollection>
				<Components>
					<oem:MenuItem InnerHtml="Item41" ID="item41" />
					<oem:MenuItem InnerHtml="Item42" ID="item42" />
					<oem:MenuItem InnerHtml="Item43" ID="item43" />
					<oem:MenuItem InnerHtml="Item44" ID="item44" />
					<oem:MenuItem InnerHtml="Item45" ID="item45" />
					<oem:MenuItem InnerHtml="Item46" ID="item46" />
				</Components>
			</oem:EasyMenu>
		</div>
				</td>
				<td style="padding-left:100px;" class="tdText" valign="top">
					
					Right click this to see the menu:
	<br />
					<!--// Div to which the menu attaches to //-->
					<div id="div1" class="div"></div>

						<!--// The menus //-->
					<oem:easymenu id="CM1" runat="server" IconsFolder="icons" Width="140" UseIcons="true" AttachTo="div1" ShowEvent="ContextMenu" Align="Under"
						StyleFolder="styles/Multiple"
						CSSMenu="ParentMenu_5" 
						CSSMenuItemContainer="ParentItemContainer_5">
						<CSSClassesCollection>
							<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuItem" 
								Component="ParentItem_5" 
								ComponentSubMenuCellOver="ParentItemSubMenuCellOver_5"
								ComponentContentCell="ParentItemContentCell_5"  
								ComponentSubMenuCell="ParentItemSubMenuCell_5"
								ComponentIconCellOver="ParentItemIconCellOver_5" 
								ComponentIconCell="ParentItemIconCell_5"
								ComponentOver="ParentItemOver_5" 
								ComponentContentCellOver="ParentItemContentCellOver_5" />
							<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuSeparator" 
								Component="ParentSeparator_5"
								ComponentSubMenuCellOver="ParentSeparatorSubMenuCellOver_5"
								ComponentContentCell="ParentSeparatorContentCell_5" 
								ComponentSubMenuCell="ParentSeparatorSubMenuCell_5" 
								ComponentIconCellOver="ParentSeparatorIconCellOver_5"
								ComponentIconCell="ParentSeparatorIconCell_5" 
								ComponentOver="ParentSeparatorOver_5"
								ComponentContentCellOver="ParentSeparatorContentCellOver_5" />
						</CSSClassesCollection>
						<Components>
							<oem:MenuItem ID="menuItem1" Url="http://www.obout.com" UrlTarget="_blank"><span style='color:#666666; font:bold; cursor:pointer;'>obout.com<b style='color:crimson; text-decoration:none;'> Home</b></span></oem:MenuItem>
							<oem:MenuItem ID="menuItem2" OnClientClick="alert('you just clicked Alert')" InnerHtml="Alert"></oem:MenuItem>
							<oem:MenuItem ID="menuItem3"><input type='checkbox' style='height:14px; width:14px;' checked='1'> Any <span style='background-color:gold; padding-left:2px; padding-right:2px;'>HTML</span></oem:MenuItem>
							<oem:MenuSeparator ID="menuSeparator1" InnerHtml="&amp;nbsp;"></oem:MenuSeparator>
							<oem:MenuItem InnerHtml="Browser Operations" ID="menuItem4"></oem:MenuItem>
							<oem:MenuSeparator ID="menuSeparator2" InnerHtml="&amp;nbsp;"></oem:MenuSeparator>
							<oem:MenuItem ID="menuItem6" Icon="xpRecycle.gif">Recycle</oem:MenuItem>
						</Components>
					</oem:easymenu>
					<oem:easymenu id="CM2" runat="server" IconsFolder="icons" Width="140" UseIcons="true" AttachTo="menuItem4" ShowEvent="MouseOver" Align="Right" OffsetHorizontal="-2" OffsetVertical="-2"
						StyleFolder="styles/Multiple"
						CSSMenu="ParentMenu_5" 
						CSSMenuItemContainer="ParentItemContainer_5">
						<CSSClassesCollection>
							<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuItem" 
								Component="ParentItem_5" 
								ComponentSubMenuCellOver="ParentItemSubMenuCellOver_5"
								ComponentContentCell="ParentItemContentCell_5"  
								ComponentSubMenuCell="ParentItemSubMenuCell_5"
								ComponentIconCellOver="ParentItemIconCellOver_5" 
								ComponentIconCell="ParentItemIconCell_5"
								ComponentOver="ParentItemOver_5" 
								ComponentContentCellOver="ParentItemContentCellOver_5" />
							<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuSeparator" 
								Component="ParentSeparator_5"
								ComponentSubMenuCellOver="ParentSeparatorSubMenuCellOver_5"
								ComponentContentCell="ParentSeparatorContentCell_5" 
								ComponentSubMenuCell="ParentSeparatorSubMenuCell_5" 
								ComponentIconCellOver="ParentSeparatorIconCellOver_5"
								ComponentIconCell="ParentSeparatorIconCell_5" 
								ComponentOver="ParentSeparatorOver_5"
								ComponentContentCellOver="ParentSeparatorContentCellOver_5" />
						</CSSClassesCollection>
						<Components>
							<oem:MenuItem UrlTarget="_blank" InnerHtml="Open New Page" ID="menuItem21" Url="about:blank" Icon="new.gif"></oem:MenuItem>
							<oem:MenuItem OnClientClick="try {window.opener.focus(); window.opener = this; window.close();} catch (e) {};"
								InnerHtml="Close This Page" ID="menuItem22" Icon="delete.gif"></oem:MenuItem>
						</Components>
					</oem:easymenu>
				</td>
			</tr>
		</table>
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
    </form>
	</body>
</html>