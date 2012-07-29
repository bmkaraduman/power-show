<%@ Page Language="vb" Inherits="vb_updateallpanels" Src="vb_updateallpanels.aspx.vb"%>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>

<html>
	<head runat="server"><style>
			.title {
				font-size: X-Large; 
				padding: 20px; 
				border-bottom: 2px solid gray; 
				width: 100%; 
			}
		</style></head>
	<body>
		<table border="0">
			<tr>
				<td valign="top" width="630" colspan="4">
					<span class="title">Callback Panel - UpdateAllPanels</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<table width="700px">
			<tr>
				<td>
					<b style="font-size:12px">CallbackPanel1</b>
					<oajax:CallbackPanel runat="server" ID="postbackPanel11">
						<content style="border: gray 1px solid; background-color: #EFEFEF;height:50px;">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center class="tdText">
										<asp:Literal id="serverTime" Runat="server"></asp:Literal>
									</td>
								</tr>
							</table>
						</content>
						<loading style="border: gray 1px solid;height:50px;text-align:center;background-color: #EFEFEF">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
										<img src="loading_icons/1.gif">
									</td>
								</tr>
							</table>
						</loading>
					</oajax:CallbackPanel>
				</td>
				<td style="width:50%">
					<b style="font-size:12px">CallbackPanel2</b>
					<oajax:CallbackPanel runat="server" ID="Postbackpanel12">
						<content style="border: gray 1px solid; background-color: #EFEFEF;height:50px;">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center class="tdText">
										<span style="color:red">
											<asp:Literal id="serverMillisecond" Runat="server"></asp:Literal>
										</span>
									</td>
								</tr>
							</table>
						</content>
						<loading style="border: gray 1px solid;height:50px;text-align:center;background-color: #EFEFEF">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
										<img src="loading_icons/1.gif">
									</td>
								</tr>
							</table>
						</loading>
					</oajax:CallbackPanel>
				</td>
			</tr>
		</table>
		<br />
		<input type="button" id="button9" onclick="ob_post.UpdateAllPanels();" value="Update ALL Callback panels"></input>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=VBNET">« Back to examples</a>
	
	</body>
</html>