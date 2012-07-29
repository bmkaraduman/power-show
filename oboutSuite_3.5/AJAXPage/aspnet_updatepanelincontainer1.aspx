<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage"%>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<html>
	<head runat="server">
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
					<span class="title">Callback Panel - UpdatePanelInContainer</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<table style="width:700px">
			<tr>
				<td style="width:50%" valign="top">
					<b style="font-size:12px">CallbackPanel</b>
					<oajax:CallbackPanel runat="server" ID="Postbackpanel3">
						<content style="border: gray 1px solid; background-color: #EFEFEF;font-size:12px;height:50px;">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center class="tdText">
										callback panel simple text	
									</td>
								</tr>
							</table>
						</content>
					</oajax:CallbackPanel>
				</td>
				<td valign="top">
					<b style="font-size:12px">div container</b>
					<div id="container" style="border: red 1px solid;font-size:12px;height:50px;">
						<br />
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<br />
					<input type="button" id="button10" onclick="ob_post.UpdatePanelInContainer('Postbackpanel3', 'container');" value="Update this Panel in container"></input>
				</td>
			</tr>
		</table>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=ASPNET">« Back to examples</a>
	</body>
</html>