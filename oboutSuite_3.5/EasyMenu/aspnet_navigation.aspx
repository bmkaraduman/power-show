<%@ Page Language="C#" MasterPageFile="aspnet_navigation.master" %>
<script runat="server" language="C#">
	void Page_Load(object sender, EventArgs e)
	{
		((OboutInc.EasyMenu_Pro.EasyMenu)this.Master.FindControl("EasymenuMain")).SelectedItemId = Request.QueryString["id"];
	}
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<br />
	<br />
	<br />
	<br />
	<br />
   <h1>Content page for <%= Request.QueryString["id"]%></h1>
</asp:Content>
