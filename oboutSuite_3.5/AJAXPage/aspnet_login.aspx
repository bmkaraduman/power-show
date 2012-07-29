<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage"%>
<%@ Register TagPrefix="obout" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<script language="C#" runat="server">
    void Page_Load(object sender, EventArgs e) 
	{
		/* this event is used for a better view of the client side panel update */
		callbackPanelLogin.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
		callbackPanelSearchInDatabase.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
		callbackPanelProcessing.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
		
		if (IsCallback && IsSearchInDatabase)
		{
			/* search the database */
		}
		
		if (IsCallback && IsProcessing)
		{
			/* processing */
		}
    }
	
	/* this event is used for a better view over the client side panel update */
	private bool oboutAJAXPage_BeforePanelUpdate(string PanelId, string UpdateContainer)
	{
		System.Threading.Thread.Sleep(2000);
		return true;
	}
	
	public bool Login(string username, string password)
	{
		if (username == "root" && password == "root")
		{
			IsLogin = true;
		}
		else
		{
			IsLogin = false;
		}
		
		return IsLogin;
	}
	
	public void SearchInDatabase()
	{
		IsSearchInDatabase = true;
	}
	
	public void Processing()
	{
		IsProcessing = true;
	}
	
	private bool IsLogin
	{
		get 
		{ 
			return Session["IsLogin"] == null ? false : bool.Parse(Session["IsLogin"].ToString()); 
		}
		set 
		{ 
			Session["IsLogin"] = value; 
		}
	}
	
	private bool IsSearchInDatabase
	{
		get 
		{ 
			return Session["IsSearchInDatabase"] == null ? false : bool.Parse(Session["IsSearchInDatabase"].ToString()); 
		}
		set 
		{ 
			Session["IsSearchInDatabase"] = value; 
		}
	}
	
	private bool IsProcessing
	{
		get 
		{ 
			return Session["IsProcessing"] == null ? false : bool.Parse(Session["IsProcessing"].ToString()); 
		}
		set 
		{ 
			Session["IsProcessing"] = value; 
		}
	}
	
	
</script>

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
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=ASPNET">« Back to examples</a>
	</body>
</html>
			