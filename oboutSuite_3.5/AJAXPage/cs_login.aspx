<%@ Page Language="C#" Src="cs_login.aspx.cs" Inherits="cs_login"%>
<%@ Register TagPrefix="obout" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<html>
	<head runat="server">
		<script language="JavaScript">
			function Login()
			{
				var username = document.getElementById('txtUsername').value;
				var password = document.getElementById('txtPassword').value;
				ob_post.AddParam("username", username);
				ob_post.AddParam("password", password);
				ob_post.post(null, "Login", LoginResponse)
			}
			
			/* the login ended */
			function LoginResponse(IsLogin)
			{
				/* the user login failed */
				if (!IsLogin)
				{
					document.getElementById('trErrorMessage').style.display = 'inline';
				}
				/* the user login succeded */
				else
				{
					/* update the login panel */
					ob_post.UpdatePanel("callbackPanelLogin");
				}
			}
			
			/* the search in the database ended */
			function SearchInDatabaseResponse()
			{
				/* update the search database panel */
				ob_post.UpdatePanel("callbackPanelSearchInDatabase");
			}
			
			/* the processing ended */
			function ProcessingResponse()
			{
				/* update the processing panel */
				ob_post.UpdatePanel("callbackPanelProcessing");
			}
			
			/* hide the panels content */
			function ob_OnPanelUpdate(panelId)
			{
				switch(panelId)
				{
					case "callbackPanelLogin":
						/* hide the login panel */
						document.getElementById('callbackPanelLogin').style.display = 'none';
						
						/* do database searching */
						ob_post.post(null, "SearchInDatabase", SearchInDatabaseResponse);
						break;
						
					case "callbackPanelSearchInDatabase":
						/* hide the SearchInDatabase panel */
						document.getElementById('callbackPanelSearchInDatabase').style.display = 'none';
						
						/* do processing */
						ob_post.post(null, "Processing", ProcessingResponse);
						break;
				}
			}
		</script>
		<style>
			.title {font-size: X-Large; padding: 20px; border-bottom: 2px solid gray; width: 100%; }
			body
			{
				font-family:Verdana;
			}
			.table
			{
				width:300px;
				height:180px;
			}
			.container
			{
				border:1px solid black;
				width:302px;
				height:182px;
			}
			.table tr td
			{
				font-size:12px;
				font-family:Verdana;
				padding:10px;
			}
		</style>
	</head>
	<body>
		<table border="0">
			<tr>
				<td valign="top" width="630" colspan="4">
					<span class="title">Login control</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<div class="container">
			<obout:CallbackPanel runat="server" ID="callbackPanelLogin">	
				<content>
					<table class="table">
						<tr>
							<td>
								Username:
							</td>
							<td>
								<input type="text" id="txtUsername" style="height:20px;width:150px;" value="root" />
							</td>
						</tr>
						<tr>
							<td>
								Password:
							</td>
							<td>
								<input type="password" id="txtPassword" style="height:20px;width:150px;" value="root" />
							</td>
						</tr>
						<tr>
							<td colspan="2" style="height:30px">
								<div id="trErrorMessage" style="color:red;display:none">The login failed.</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="button" value="Login" onclick="Login()" />
							</td>
						</tr>
					</table>
				</content>
				<loading>
					<table class="table">
						<tr>
							<td align="center" valing="middle">
								Login ok. Wait starting user profile...
							</td>
						</tr>
					</table>
				</loading>
			</obout:CallbackPanel>	
			<obout:CallbackPanel runat="server" ID="callbackPanelSearchInDatabase" RenderMethod="OnExplicitRequest">	
				<content>
					<table class="table">
						<tr>
							<td align="center" valing="middle">
							</td>
						</tr>
					</table>
				</content>
				<loading>
					<table class="table">
						<tr>
							<td align="center" valing="middle">
								Looking in the database...
							</td>
						</tr>
					</table>
				</loading>
			</obout:CallbackPanel>	
			<obout:CallbackPanel runat="server" ID="callbackPanelProcessing" RenderMethod="OnExplicitRequest">	
				<content>
					<table class="table">
						<tr>
							<td align="center" valing="middle">
								Processing completed.
							</td>
						</tr>
					</table>
				</content>
				<loading>
					<table class="table">
						<tr>
							<td align="center" valing="middle">
								Processing...
							</td>
						</tr>
					</table>
				</loading>
			</obout:CallbackPanel>	
		</div>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=CSHARP">« Back to examples</a>
	</body>
</html>
			