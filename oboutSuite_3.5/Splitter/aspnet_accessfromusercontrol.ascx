<%@ Control Language="C#" AutoEventWireup="true" %>
<script runat="server">
	protected void btnPostback_Click(object sender, EventArgs e)
	{
		((OboutInc.Splitter2.Splitter)this.Page.FindControl("spl1")).LeftPanel.Content.Url = "http://www.microsoft.com";
	}
</script>
User Control content ...
<br />
<br />
Access the Splitter control <b>client side</b> from the User Control:
<nobr><a href="javascript:spl1.loadPage('LeftContent', 'http://www.obout.com/')">Load Page</a></nobr>
<br />
<br />
Access the Splitter control <b>server side</b> from the User Control (postback):
<asp:Button id="btnPostback" OnClick="btnPostback_Click" runat="server" text="Load Page" />