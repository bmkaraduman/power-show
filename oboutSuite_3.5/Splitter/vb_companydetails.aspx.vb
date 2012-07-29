Imports System
Imports System.Data.OleDb

public class companydetails
	Inherits System.Web.UI.Page
	
	protected divdetails as System.Web.UI.HtmlControls.HtmlGenericControl
	protected tableDetails as System.Web.UI.HtmlControls.HtmlTable
	protected lname as System.Web.UI.WebControls.Literal
	protected lDescription as System.Web.UI.WebControls.Literal
	protected lAddress as System.Web.UI.WebControls.Literal
	protected lPhone as System.Web.UI.WebControls.Literal
	protected lfax as System.Web.UI.WebControls.Literal
	protected lEmail as System.Web.UI.WebControls.Literal
	protected lHomepage as System.Web.UI.WebControls.Literal
	protected lContact as System.Web.UI.WebControls.Literal
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		if not Request.QueryString("cID") is nothing
			divDetails.Visible = false
			LoadCompanyDetails(Int32.Parse(Request.QueryString("cID").ToString()))
		else	
			tableDetails.Visible = false
		End If
	End Sub
	
	private sub LoadCompanyDetails(ByVal cID as int32)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/company.mdb"))
		myConn.Open()

		dim query as string = "SELECT name, description, address, phone, fax, email, homepage, contact FROM Company where ID = " + cID.ToString()
		dim myComm as OleDbCommand = new OleDbCommand(query, myConn)
		dim myReader as OleDbDataReader = myComm.ExecuteReader()
		
		while myReader.Read()	
			if myReader.IsDBNull(0) 
				lName.Text = ""
			else
				lName.Text = myReader.GetString(0)
			End If
			if myReader.IsDBNull(1) 
				lDescription.Text = ""
			else
				lDescription.Text = myReader.GetString(1)
			End If
			if myReader.IsDBNull(2) 
				lAddress.Text = ""
			else
				lAddress.Text = myReader.GetString(2)
			End If
			if myReader.IsDBNull(3) 
				lPhone.Text = ""
			else
				lPhone.Text = myReader.GetString(3)
			End If
			if myReader.IsDBNull(4) 
				lFax.Text = ""
			else
				lFax.Text = myReader.GetString(4)
			End If
			if myReader.IsDBNull(5) 
				lEmail.Text = ""
			else
				lEmail.Text = myReader.GetString(5)
			End If
			if myReader.IsDBNull(6) 
				lHomepage.Text = ""
			else
				lHomepage.Text = myReader.GetString(6)
			End If
			if myReader.IsDBNull(7) 
				lContact.Text = ""
			else
				lContact.Text = myReader.GetString(7)
			End If
		End While
		
		myReader.Close()
		myConn.Close()	
	End Sub
	
End Class