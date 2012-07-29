<%@ Page Language="C#" Inherits="cs_cp_clientevents" Src="cs_cp_clientevents.aspx.cs"%>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %> 

<html>
	<head runat="server">
		<script language="javascript">
			function DoCallback() {
				document.getElementById('divResult').innerHTML = "";
			
				ob_post.UpdatePanel('callbackPanel1');
			}
			function ob_OnBeforePanelUpdate(panelId, containerId, page) {
				document.getElementById('divResult').innerHTML += "<br />&nbsp;&nbsp;&nbsp;<b>&middot;</b>&nbsp;&nbsp;<span style='color:red'>ob_OnBeforePanelUpdate</span> was triggered<br /><br />";
				
				return true;
			}
			function ob_OnPanelUpdate(panelId) {
				if (document.getElementById('divResult').innerHTML.indexOf('ob_OnPanelUpdate') == -1)
					document.getElementById('divResult').innerHTML += "&nbsp;&nbsp;&nbsp;<b>&middot;</b>&nbsp;&nbsp;<span style='color:red'>ob_OnPanelUpdate</span> was triggered<br /><br /> ";
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
					<span class="title">Callback Panel - Client-side events</span><br /><br /><br />
				</td>
			</tr>
			<tr>
				<td valign="top">
					<input type="button" id="button1" onclick="DoCallback();" value="Update Panel" />
				</td>
				<td width="100%" style="padding-left:20px">
					<oajax:CallbackPanel id="callbackPanel1" runat="server">
						<content style="width:250px;height:25px;border:1px solid gray;font-size:12px;text-align:center;">
							<table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center class="tdText">
										some callback panel content
									</td>
								</tr>
							</table>
						</content>
						<loading style="width:250px;height:25px;border:1px solid gray">
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
		<br />
		In the panel below you will see the order of the client-side events execution.
		<br />
		<br />
		<div id="divResult" style="width:290px;height:100px;border:1px solid gray">
			
		</div>
		<br />
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=CSHARP">« Back to examples</a>
	</body>
</html>