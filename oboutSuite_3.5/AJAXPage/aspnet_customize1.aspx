<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage"%>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<script language="C#" runat="server">
    void Page_Load(object sender, EventArgs e) {
		cp1.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
		cp2.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
    }
	
	private bool oboutAJAXPage_BeforePanelUpdate(string PanelId, string UpdateContainer) {
		System.Threading.Thread.Sleep(2000);
		return true;
	}
	
</script>

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
					<oajax:CallbackPanel id="cp1" runat="server">
						<content style="border: gray 1px solid;width:250px;height:100px">
							<table width="100%" height="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td align="center" class="tdText">
										this panel will show a custom <b>image</b> <br />... while loading ...
									</td>
								</tr>
							</table>
						</content>
						<loading style="border: gray 1px solid;width:250px;height:100px">
							<table width="100%" height="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td align="center">
										<img src="loading_icons/6.gif">
									</td>
								</tr>
							</table>
						</loading>
					</oajax:CallbackPanel>
					<br />
					<input type="button" id="b1" onclick="UpdatePanel('cp1')" value="Update Panel" />
					<br />		
				</td>
				<td style="padding-left:40px">
					<oajax:CallbackPanel id="cp2" runat="server">
						<content style="border: gray 1px solid;width:250px;height:100px">
							<table width="100%" height="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td align="center" class="tdText">
										<span style="color:gray;font-weight:bold;text-decoration:underline">different image while loading</span>
										<br /><br />
										<b>Try It !</b>
									</td>
								</tr>
							</table>
						</content>
						<loading style="border: gray 1px solid;width:250px;height:100px">
							<table width="100%" height="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td align="center">
										<img src="loading_icons/7.gif">
									</td>
								</tr>
							</table>
						</loading>
					</oajax:CallbackPanel>
					<br />
					<input type="button" id="b2" onclick="UpdatePanel('cp2')" value="Update Panel" />
					<br />
				</td>
			</tr>
		</table>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=ASPNET">« Back to examples</a>
	
	</body>
</html>