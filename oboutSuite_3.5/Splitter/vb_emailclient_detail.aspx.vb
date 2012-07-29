Imports System
Imports System.Data.OleDb
Imports System.Data

public class emailclient_detail
	Inherits System.Web.UI.Page
	
	protected lblSubject as System.Web.UI.WebControls.Label
	protected lblFrom as System.Web.UI.WebControls.Label
	protected lblTo as System.Web.UI.WebControls.Label
	protected lblMessage as System.Web.UI.WebControls.Label

	public emailDisplay as string = "none"
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		GetEmailDetail(Int32.Parse(Request.QueryString("EmailID").ToString()))
	End Sub
	
	public sub GetEmailDetail(ByVal EmailID as Int32)
		dim oleDBConnetion as OleDbConnection = new OleDbConnection()
        oleDBConnetion.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("../App_Data/emailclient.mdb") + "; User Id=; Password="

		dim oleDBCommand as OleDbCommand = new OleDbCommand()
		oleDBCommand.CommandType = CommandType.Text
		oleDBCommand.Connection = oleDBConnetion
		oleDBCommand.CommandText = "SELECT EmailSubject, EmailFrom, EmailContent FROM Emailclient where EmailID = " + EmailID.ToString() + ""

		dim dataReader as OleDbDataReader
		oleDBConnetion.Open()
		dataReader = oleDBCommand.ExecuteReader()
		
		while dataReader.Read()	
			lblSubject.Text = dataReader.GetString(0)
			lblFrom.Text = dataReader.GetString(1)
			lblTo.Text = "me@mymail.com"
			lblMessage.Text = dataReader.GetString(2)
			emailDisplay = "inline"
		End While

		dataReader.Close()
		oleDBConnetion.Close()
	End Sub
	
End Class