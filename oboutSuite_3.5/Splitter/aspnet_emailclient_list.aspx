<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>
<script language="C#" runat="server">
	void Page_Load(object sender, EventArgs e) {
		GetEmailContent(int.Parse(Request.QueryString["CategoryID"].ToString()));
	}
	
	public int selectedEmailID = 0;
	public void GetEmailContent(int CategoryID)
	{
		OleDbConnection oleDBConnetion = new OleDbConnection();
		oleDBConnetion.ConnectionString = 
			"Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("../App_Data/emailclient.mdb") + "; User Id=; Password=";

		// gets the datasource for the emails list
		OleDbCommand oleDBCommand = new OleDbCommand();
		oleDBCommand.CommandType = CommandType.Text;
		oleDBCommand.Connection = oleDBConnetion;
		oleDBCommand.CommandText = "SELECT EmailID, EmailCategoryID, EmailSubject, EmailFrom, EmailContent FROM EmailClient where EmailCategoryID = " + CategoryID + "";

		OleDbDataReader dataReader;
		oleDBConnetion.Open();				
		dataReader = oleDBCommand.ExecuteReader();
		emailList.DataSource = dataReader;
		emailList.DataBind();
		dataReader.Close();
		
		// get the first email from the list for loading it's details
		OleDbCommand topOleDBCommand = new OleDbCommand();
		topOleDBCommand.CommandType = CommandType.Text;
		topOleDBCommand.Connection = oleDBConnetion;
		topOleDBCommand.CommandText = "SELECT top 1 EmailID FROM EmailClient where EmailCategoryID = " + CategoryID + "";
		OleDbDataReader topDataReader;
		topDataReader = topOleDBCommand.ExecuteReader();
		if (topDataReader.Read()) selectedEmailID = topDataReader.GetInt32(0);
		topDataReader.Close();
		
		oleDBConnetion.Close();
	}
</script>
<html>
<head>
<style>
.messageText
{
	font-family:Tahoma;
	font-size:8pt;
	color:back;
}
</style>
<script>
function EmailFillDetails(EmailID)
{
	window.parent.sp2.loadPage("RightContent", "aspnet_emailclient_detail.aspx?EmailID=" + EmailID);
}
</script>
</head>
<body onload="EmailFillDetails(<%=selectedEmailID%>)">
<div style="background-color:white">
	<asp:Repeater id="emailList" runat="server">
		<ItemTemplate>
			<div style="cursor:pointer;padding-left:5px;padding-right:5x;padding-top:1px">
				<table id="<%# DataBinder.Eval(Container.DataItem, "EmailID") %>" style="border-top:1px solid gray;width:98%" onClick="EmailFillDetails('<%# DataBinder.Eval(Container.DataItem, "EmailID") %>')" onMouseOver="this.style.backgroundColor = '#ffffcc'" onMouseOut="this.style.backgroundColor = '#ffffff'">
					<tr>
						<td class="messageText">
							<img src="images/open_folder.gif" />
							From: 
							<span class="emailFrom">
							<%# DataBinder.Eval(Container.DataItem, "EmailFrom") %>
							</span>
						</td>
					</tr>
					<tr>
						<td class="messageText" style="padding-left:20px">
							<span class="emailSubject">
							<%# DataBinder.Eval(Container.DataItem, "EmailSubject") %>
							</span>
						</td>
					</tr>
				</table>
			</div>
		</ItemTemplate>
	</asp:Repeater>	
	<%if (emailList.Items.Count > 0) { %><div style="border-top:1px solid gray;width:98%"></div><% } %>
</div>
</body>
</html>