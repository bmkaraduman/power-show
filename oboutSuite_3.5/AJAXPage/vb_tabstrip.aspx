<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Page Language="VB" Inherits="vb_tabstrip" Src="vb_tabstrip.aspx.vb" %>
<html>
	<head runat="server">
		<script language="Javascript">
			function SelectTab(itemID)
			{
				ob_post.AddParam("itemID", itemID);
				ob_post.UpdatePanel('cp1');	
				ob_em_SelectItem(itemID)
			}
		</script>
		<style>
			.title {
				font-size: X-Large; 
				padding: 20px; 
				border-bottom: 2px solid gray; 
				width: 100%; 
			}
		</style>
	</head>
	<body>
		<table border="0">
			<tr>
				<td valign="top" width="630" colspan="4">
					<span class="title">TabStrip</span><br /><br /><br />
				</td>
			</tr>
			<tr>
				<td>
					<oem:EasyMenu id="EasymenuTabStrip" runat="server" ShowEvent="Always" StyleFolder="../EasyMenu/styles/horizontal1"
						Position="Horizontal" CSSMenu="ParentMenu" CSSMenuItemContainer="ParentItemContainer" Width="530">
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
							<oem:MenuItem InnerHtml="<span style='cursor:default'>Tab 1</span>" OnClientClick="SelectTab('item1')" ID="item1"></oem:MenuItem>
							<oem:MenuItem InnerHtml="<span style='cursor:default'>Tab 2</span>" OnClientClick="SelectTab('item2')" ID="item2"></oem:MenuItem>
							<oem:MenuItem InnerHtml="<span style='cursor:default'>Tab 3</span>" OnClientClick="SelectTab('item3')" ID="item3"></oem:MenuItem>
							<oem:MenuItem InnerHtml="<span style='cursor:default'>Tab 4</span>" OnClientClick="SelectTab('item4')" ID="item4"></oem:MenuItem>
						</Components>
					</oem:EasyMenu>
					<oajax:CallbackPanel id="cp1" runat="server" OnBeforePanelUpdate="cp1_OnBeforePanelUpdate">
						<content style="border: gray 1px solid;width:524px;height:150px;border:3px solid #D6D6D6">
							<iframe frameborder="0" width="524px" height="150px" src="htmlPages/page<asp:Literal id="lSrc" runat="server" />.html"></iframe>
						</content>
						<loading style="border: gray 1px solid;width:524px;height:150px;border:3px solid #D6D6D6">
							<table width="524px" height="150px" cellpadding="0" cellspacing="0">
								<tr>
									<td align="center">
										<img src="loading_icons/6.gif">
									</td>
								</tr>
							</table>
						</loading>
					</oajax:CallbackPanel>
				</td>
			</tr>
		</table>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=VBNET">« Back to examples</a>
	</body>
</html>