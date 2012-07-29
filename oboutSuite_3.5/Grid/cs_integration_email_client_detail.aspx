<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>
<script language="C#" runat="server">
	public string emailDisplay = "none";
	void Page_Load(object sender, EventArgs e) {
		GetEmailDetail(int.Parse(Request.QueryString["EmailID"].ToString()));
	}
	
	public void GetEmailDetail(int EmailID)
	{
		OleDbConnection oleDBConnetion = new OleDbConnection();
		oleDBConnetion.ConnectionString = 
			"Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("../App_Data/emailclient.mdb") + "; User Id=; Password=";

		OleDbCommand oleDBCommand = new OleDbCommand();
		oleDBCommand.CommandType = CommandType.Text;
		oleDBCommand.Connection = oleDBConnetion;
		oleDBCommand.CommandText = "SELECT EmailSubject, EmailFrom, EmailContent FROM Emailclient where EmailID = " + EmailID + "";

		OleDbDataReader dataReader;

		oleDBConnetion.Open();
				
		dataReader = oleDBCommand.ExecuteReader();
		
		while(dataReader.Read())
		{
			lblSubject.Text = dataReader.GetString(0);
			lblFrom.Text = dataReader.GetString(1);
			lblTo.Text = "me@mymail.com";
			lblMessage.Text = dataReader.GetString(2);
			emailDisplay = "inline";
		}

		dataReader.Close();
		oleDBConnetion.Close();
	}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
<head>
<style>
.emailDetailsSubject
{
	padding-left:20px;
	font-family:Tahoma;
	font-size:9pt;
}
.emailDetailTo
{
	font-family:Tahoma;
	font-size:9pt;
}
.emailDetailFrom
{
	font-family:Tahoma;
	font-size:9pt;
}
.textTo
{
	font-family:Tahoma;
	font-size:9pt;
	color:gray;
	font-weight:bold;
}
.emailDetailMessage
{
	font-family:Tahoma;
	font-size:9pt;
}
</style>
</head>
<body>
<div style="background-color:white;width:100%;height:100%;">
	<table style="width:100%;" style="display:<%=emailDisplay%>" border=0>
		<tr>
			<td class="emailDetailsSubject" colspan="2">
				<b><asp:Label id="lblSubject" runat="server" /></b>
			</td>
		</tr>
		<tr>
			<td width="5px"><img src="resources/images/icon.gif" /></td>
			<td class="emailDetailFrom" style="align:left;width:100%" valign="middle">
				<asp:Label id="lblFrom" runat="server" />
			</td>
		</tr>
		<tr>
			<td class="emailDetailTo" colspan="2">
				<span class="textTo">To:</span> <asp:Label id="lblTo" runat="server" />
			</td>
		</tr>
		<tr style="height:1px;background-color:gray">
			<td colspan="2"></td>
		</tr>
		<tr >
			<td class="emailDetailMessage" colspan="2">
				<asp:Label id="lblMessage" runat="server" />
			</td>
		</tr>
	</table>
</div>
</body>
</html>