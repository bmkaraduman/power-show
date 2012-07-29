<%@ Page Language="C#" Inherits="OboutInc.oboutAJAXPage" %>
<%@ Register Src="aspnet_withusercontrol.ascx" TagName="WebUserControl" TagPrefix="uc1" %>
<script runat="server">
	public void DoCallback()
	{
		((Literal)WebUserControl1.FindControl("lblText")).Text = "some text from server ... panel update ...";
		UpdatePanel("CallbackPanel1");
	}
	
	public string DoCallbackFromUC()
	{
		return WebUserControl1.DoCallbackFromUC();
	}
</script>
<html>
	<head runat="server">
		<title>Obout AJAXPage Examples</title>
		<style>
			body
			{
				font-family:Verdana;
			}
			.text
			{
				background-color:#ebe9ed;
				font-size:11px;
				text-align:center;
			}
		</style>
	</head>
	<body>
		<form runat="server">
			<br />
			<b>Make a callback from inside user control</b>
			<br /><br />
			<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=ASPNET">« Back to examples</a>
			<br />
			<br />
			<br />
			User Control
			<div style="width:100%;border:1px solid #cccccc;padding:4px;">
				<uc1:WebUserControl ID="WebUserControl1" runat="server" />
			</div>
		</form>
	</body>
</html>
