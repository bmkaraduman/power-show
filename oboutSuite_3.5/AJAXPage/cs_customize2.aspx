<%@ Page Language="C#" Inherits="cs_customize2" Src="cs_customize2.aspx.cs" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>

<html>
	<head runat="server">
		<script language="JavaScript">
			function UpdatePanel(panelID) {
				ob_post.UpdatePanel(panelID);
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
					<span class="title">Callback Panel - Customize</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td>
					<oajax:CallbackPanel id="cp3" runat="server">
						<content style="border: gray 1px solid;width:250px;height:100px">
							<table width="100%" height="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td align="center" class="tdText">
										this panel will show a custom <b>text</b> <br />... while loading ...
									</td>
								</tr>
							</table>
						</content>
						<loading style="border: gray 1px solid;width:250px;height:100px">
							<table width="100%" height="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td align="center" class="tdText">
										<b>Data is being processed, please wait...</b>
									</td>
								</tr>
							</table>
						</loading>
					</oajax:CallbackPanel>
					<br />
					<input type="button" id="b3" onclick="UpdatePanel('cp3')" value="Update Panel" />
					<br />
				</td>
				<td style="padding-left:40px">
					<oajax:CallbackPanel id="cp4" runat="server">
						<content style="border: gray 1px solid;width:250px;height:100px">
							<table width="100%" height="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td align="center" class="tdText">
										<span style="color:red;font-weight:bold;">last example</span>
									</td>
								</tr>
							</table>
						</content>
						<loading style="border: gray 1px solid;width:250px;height:100px">
							<table width="100%" height="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td align="center" class="tdText">
										<span style="color:red;font-weight:bold">Loading...</span>
									</td>
								</tr>
							</table>
						</loading>
					</oajax:CallbackPanel>
					<br />
					<input type="button" id="b4" onclick="UpdatePanel('cp4')" value="Update Panel" />
					<br />
				</td>
			</tr>
		</table>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=CSHARP">« Back to examples</a>
	
	</body>
</html>