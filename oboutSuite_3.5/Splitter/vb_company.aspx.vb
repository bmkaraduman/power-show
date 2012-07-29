Imports System
Imports System.Data.OleDb
Imports System.Collections

public class company
	Inherits System.Web.UI.Page
	
	protected gridCompany as Obout.Grid.Grid
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		if not IsPostBack
			LoadCompanies()
		End If
	End Sub
	
	private sub LoadCompanies()
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/company.mdb"))
		myConn.Open()

		dim query as string = "SELECT ID, name, contact FROM Company"
		dim myComm as OleDbCommand = new OleDbCommand(query, myConn)
		dim myReader as OleDbDataReader = myComm.ExecuteReader()
		
		gridCompany.DataSource = myReader
		gridCompany.DataBind()
	
		myReader.Close()
		myConn.Close()	
	End Sub
	
End Class