Imports System
Imports System.Data.OleDb
Imports System.Data

public class emailclient_list
	Inherits System.Web.UI.Page
	
	protected emailList as System.Web.UI.WebControls.Repeater

	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		GetEmailContent(int32.Parse(Request.QueryString("CategoryID").ToString()))
	End Sub
	
	public selectedEmailID as Int32 = 0
	public sub GetEmailContent(ByVal CategoryID as Int32)
		dim oleDBConnetion as OleDbConnection = new OleDbConnection()
        oleDBConnetion.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("../App_Data/emailclient.mdb") + "; User Id=; Password="

		' gets the datasource for the emails list
		dim oleDBCommand as OleDbCommand = new OleDbCommand()
		oleDBCommand.CommandType = CommandType.Text
		oleDBCommand.Connection = oleDBConnetion
		oleDBCommand.CommandText = "SELECT EmailID, EmailCategoryID, EmailSubject, EmailFrom, EmailContent FROM EmailClient where EmailCategoryID = " + CategoryID.ToString() + ""

		dim dataReader as OleDbDataReader
		oleDBConnetion.Open()
		dataReader = oleDBCommand.ExecuteReader()
		emailList.DataSource = dataReader
		emailList.DataBind()
		dataReader.Close()
		
		' get the first email from the list for loading it's details
		dim topOleDBCommand as OleDbCommand = new OleDbCommand()
		topOleDBCommand.CommandType = CommandType.Text
		topOleDBCommand.Connection = oleDBConnetion
		topOleDBCommand.CommandText = "SELECT top 1 EmailID FROM EmailClient where EmailCategoryID = " + CategoryID.ToString() + ""
		dim topDataReader as OleDbDataReader
		topDataReader = topOleDBCommand.ExecuteReader()
		if topDataReader.Read() 
			selectedEmailID = topDataReader.GetInt32(0) 
		end if
		topDataReader.Close()
		
		oleDBConnetion.Close()
	End Sub
	
End Class