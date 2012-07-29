<%@ Page Language="C#" Inherits="cs_rendermethod" Src="cs_rendermethod.aspx.cs" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>

<html>
	<head runat="server">
		<script language="JavaScript">
			function UpdatePanel(panelID) {
				ob_post.UpdatePanel(panelID);
			}
			
			function UpdateAllPanels() {
				ob_post.UpdateAllPanels();
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
					<span class="title">Callback Panel - RenderMethod</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<table width="100%">
			<tr>
				<td colspan="2" class="tdText">
					<b>RenderMethod="Always"</b>
					<br /><br />The panel is always updated.
						<ul>
							<li>When the page is first loaded.</li>
							<li>When an explicit UpdatePanel requests it.</li>
							<li>When UpdateAllPanels is used. </li>
						</ul>
				</td>
			</tr>
			<tr>
				<td style="width:50%;height:80px">
					<div style="width:302px;height:72px;border:1px solid gray">
					<oajax:CallbackPanel runat="server" ID="panelAlways" RenderMethod="Always">
						<content style="width:300px;height:70px;">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center class="tdText">
										<asp:Label id="label1" runat="server" Text="some value" />
									</td>
								</tr>
							</table>
						</content>
						<loading style="width:300px;height:70px;">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
										<img src="loading_icons/1.gif">
									</td>
								</tr>
							</table>
						</loading>
					</oajax:CallbackPanel>
					</div>
				</td>
				<td valign="middle">
					<input type="button" onclick="UpdatePanel('panelAlways')" value="Update panel" /><br /><br />
					<input type="button" onclick="UpdateAllPanels()" value="Update all panels" />
				</td>
			</tr>
			<tr>
				<td colspan="2" style="padding-top:30px" class="tdText">
					<b>RenderMethod="OnCallback"</b>
					<br /><br />The panel is only updated on a callback.
						<ul>
							<li>When an explicit UpdatePanel requests it.</li>
							<li>When UpdateAllPanels is used. </li>
						</ul>
				</td>
			</tr>
			<tr>
				<td style="width:50%;height:80px">
					<div style="width:302px;height:72px;border:1px solid gray">
					<oajax:CallbackPanel runat="server" ID="panelOnCallback" RenderMethod="OnCallback">
						<content style="width:300px;height:70px;">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center class="tdText">
										<asp:Label id="label2" runat="server" Text="some value" />
									</td>
								</tr>
							</table>
						</content>
						<loading style="width:300px;height:70px;">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
										<img src="loading_icons/1.gif">
									</td>
								</tr>
							</table>
						</loading>
					</oajax:CallbackPanel>
					</div>
				</td>
				<td valign="middle">
					<input type="button" onclick="UpdatePanel('panelOnCallback')" value="Update panel" /><br /><br />
					<input type="button" onclick="UpdateAllPanels()" value="Update all panels" />
				</td>
			</tr>
			<tr>
				<td colspan="2" style="padding-top:30px" class="tdText">
					<b>RenderMethod="OnExplicitRequest"</b>
					<br /><br />
					The panel is only updated when UpdatePanel is used explicitly for this panel. 
					<br />
					It is not rendered when the page is first loaded, nor when UpdateAllPanels is used.
				</td>
			</tr>
			<tr>
				<td style="width:50%;height:80px">
					<div style="width:302px;height:72px;border:1px solid gray">
					<oajax:CallbackPanel runat="server" ID="panelOnExplicitRequest" RenderMethod="OnExplicitRequest">
						<content style="width:300px;height:70px;">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center class="tdText">
										<asp:Label id="label3" runat="server" Text="some value" />
									</td>
								</tr>
							</table>
						</content>
						<loading style="width:300px;height:70px;">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
										<img src="loading_icons/1.gif">
									</td>
								</tr>
							</table>
						</loading>
					</oajax:CallbackPanel>
					</div>
				</td>
				<td valign="middle">
					<input type="button" value="Update panel" onclick="UpdatePanel('panelOnExplicitRequest')" /><br /><br />
					<input type="button" onclick="UpdateAllPanels()" value="Update all panels" />
				</td>
			</tr>
			<tr>
				<td colspan="2" style="padding-top:30px" class="tdText">
					<b>RenderMethod="OnExplicitRequestAndPageLoad"</b>
					<br /><br />
					The panel is only updated when UpdatePanel is used explicitly for this panel. 
					<br />
					It is also rendered when the page is first loaded.
				</td>
			</tr>
			<tr>
				<td style="width:50%;height:80px">
					<div style="width:302px;height:72px;border:1px solid gray">
					<oajax:CallbackPanel runat="server" ID="panelOnExplicitRequestAndPageLoad" RenderMethod="OnExplicitRequestAndPageLoad">
						<content style="width:300px;height:70px;">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center class="tdText">
										<asp:Label id="label4" runat="server" Text="some value" />
									</td>
								</tr>
							</table>
						</content>
						<loading style="width:300px;height:70px;">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
										<img src="loading_icons/1.gif">
									</td>
								</tr>
							</table>
						</loading>
					</oajax:CallbackPanel>
					</div>
				</td>
				<td valign="middle">
					<input type="button" value="Update panel" onclick="UpdatePanel('panelOnExplicitRequestAndPageLoad')" /><br /><br />
					<input type="button" onclick="UpdateAllPanels()" value="Update all panels" />
				</td>
			</tr>
		</table>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=CSHARP">« Back to examples</a>
	</body>
</html>