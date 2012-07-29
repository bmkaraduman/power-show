<%@ Page Language="VB" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>
<script language="VB" runat="server">
    Public emailDisplay As String = "none"
    Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        GetEmailDetail(Integer.Parse(Request.QueryString("EmailID").ToString()))
    End Sub
	
	public Sub GetEmailDetail(ByVal EmailID As Integer)
	
        Dim _oleDBConnetion As OleDbConnection = New OleDbConnection()
        _oleDBConnetion.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("../App_Data/emailclient.mdb") + "; User Id=; Password="

        Dim _oleDBCommand As OleDbCommand = New OleDbCommand()
        _oleDBCommand.CommandType = CommandType.Text
        _oleDBCommand.Connection = _oleDBConnetion
        _oleDBCommand.CommandText = "SELECT EmailSubject, EmailFrom, EmailContent FROM Emailclient where EmailID = " + EmailID.ToString()

        Dim dataReader As OleDbDataReader

        _oleDBConnetion.Open()
				
        dataReader = _oleDBCommand.ExecuteReader()
	
        While dataReader.Read()		
            lblSubject.Text = dataReader.GetString(0)
            lblFrom.Text = dataReader.GetString(1)
            lblTo.Text = "me@mymail.com"
            lblMessage.Text = dataReader.GetString(2)
            emailDisplay = "inline"
        End While

        dataReader.Close()
        _oleDBConnetion.Close()
    End Sub
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