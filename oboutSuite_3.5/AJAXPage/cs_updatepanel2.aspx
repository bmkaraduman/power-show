<%@ Page Language="C#" Inherits="cs_updatepanel2" Src="cs_updatepanel2.aspx.cs" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<html>
	<head runat="server">
		<script>
			function UpdatePanelFromServer() {
				ob_post.post(null, "UpdatePanelFromServer", function(){});
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
					<span class="title">Callback Panel - UpdatePanel</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<table style="width:700px">
			<tr>
				<td class="tdText">
					<b>Client-side update</b>
					<oajax:CallbackPanel runat="server" ID="postbackPanel1">
						<content style="border: gray 1px solid;height:30px;text-align:center;width:200px;">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center class="tdText">
										<asp:Literal id="serverTime" Runat="server"></asp:Literal>
									</td>
								</tr>
							</table>
						</content>
						<loading style="border: gray 1px solid;height:30px;text-align:center;width:200px;">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
										<img src="loading_icons/1.gif">
									</td>
								</tr>
							</table>
						</loading>
					</oajax:CallbackPanel>
					<br />
					<input type="button" id="button5" onclick="ob_post.UpdatePanel('postbackPanel1');" value="Update this Panel"></input>
				</td>
				<td class="tdText">
					<b>Server-side update</b>
					<oajax:CallbackPanel runat="server" ID="postbackPanel3">
						<content style="border: gray 1px solid;height:30px;text-align:center;width:200px;">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center class="tdText">
										<asp:Literal id="serverTime3" Runat="server"></asp:Literal>
									</td>
								</tr>
							</table>
						</content>
						<loading style="border: gray 1px solid;height:30px;text-align:center;width:200px;">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
										<img src="loading_icons/1.gif">
									</td>
								</tr>
							</table>
						</loading>
					</oajax:CallbackPanel>
					<br />
					<input type="button" id="button6" onclick="UpdatePanelFromServer();" value="Update this Panel"></input>
				</td>
			</tr>
		</table>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=CSHARP">« Back to examples</a>
	</body>
</html>