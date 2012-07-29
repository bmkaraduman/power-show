<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage" EnableCallbackViewstate="true" %>
<script language="C#" runat="server">
    void Page_Load(object sender, EventArgs e) {
        // set the initial ViewState variable value. this is only executed on first load of page
		// when there is a postback or callback, IsPostBack is true
		if (!Page.IsPostBack)
			ViewState["something"] = 1;
	
		// if it's not a callback (aka first load or postback) write the value of the viewstate variable
		if (!IsCallback)
			if (ViewState["something"] != null)
				lblViewState.Text = "ViewState value = " + ViewState["something"].ToString();
    }
	
	public string tempFunction() {
		// increase the value of the viewstate variable
		int count = (int)ViewState["something"];
		count++;
		ViewState["something"] = count;
		return ViewState["something"].ToString();
	}
	
</script>

<html>
	<head runat="server"><style>
			.title {font-size: X-Large; padding: 20px; border-bottom: 2px solid gray; width: 100%; }
		</style></head>
	<body>
		<form runat="server">
		<table border="0">
			<tr>
				<td valign="top" width="630" colspan="4">
					<span class="title">Callback ViewState</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<span style="font-weight:bold">The ViewState is persistent on callbacks.</span>
		<br /><br />
		Increase the value of ViewState variable using a callback.
		<br /><br />
		<input type="button" id="button18" onclick="ob_post.post(null, 'tempFunction', function(r){alert('ViewState value is : ' + r);});"
						value="Callback Now!"></input>
		<br />
		<br />
		<br />
		Make a real postback to the server.
		<br />
		You will see the ViewState variable value, updated according to the last callback.
		<br />
		<br />
		<asp:Button Runat="server" Text="Postback Now!" ID="somebutton"></asp:Button>
		<br />
		<br />
		<span style="color:red"><asp:Label id="lblViewState" runat="server" /></span>
		<br />
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=ASPNET">« Back to examples</a>
		</form>
	</body>
</html>