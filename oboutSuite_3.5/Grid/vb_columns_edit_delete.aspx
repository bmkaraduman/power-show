<%@ Page Language="VB"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
	
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )
		grid1.ID = "grid1"
		grid1.CallbackMode = True
		grid1.Serialize = True
		grid1.AutoGenerateColumns = False
		
        grid1.FolderStyle = "styles/grand_gray"

		' setting the event handlers
		AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
		AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
		AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
		AddHandler CType(grid1, Grid).Rebind, AddressOf RebindGrid
		
		' creating the columns
        Dim oCol1 As Column = new Column()
        oCol1.DataField = "SupplierID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "SUPPLIER ID"
        oCol1.Width = "125"
        oCol1.Visible = False

        Dim oCol2 As Column = new Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "250"
       
        Dim oCol4 As Column = new Column()
        oCol4.DataField = "Address"
        oCol4.HeaderText = "ADDRESS"
        oCol4.Width = "175"

        Dim oCol5 As Column = new Column()
        oCol5.DataField = "Country"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "115"

        Dim oCol6 As Column = new Column()
        oCol6.HeaderText = "EDIT"
        oCol6.Width = "125"
        oCol6.AllowEdit = True
        oCol6.AllowDelete = False
        
        Dim oCol7 As Column = new Column()
        oCol7.HeaderText = "DELETE"
        oCol7.Width = "125"
        oCol7.AllowEdit = False
        oCol7.AllowDelete = True

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)
        grid1.Columns.Add(oCol7)
		
		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
				
		If Not Page.IsPostBack Then
			BindGrid()			
		End If
	End Sub

	Sub BindGrid()
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT * FROM Suppliers", myConn)
		myConn.Open()
		'Dim da = new OleDbDataAdapter()
		'Dim ds = new DataSet()
		'da.SelectCommand = myComm
		'da.Fill(ds, "Orders")
		Dim myReader As OleDbDataReader = myComm.ExecuteReader()


		grid1.DataSource = myReader
		grid1.DataBind()

		myConn.Close()
	End Sub				
    
    Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Suppliers WHERE SupplierID = @SupplierID", myConn)
        
        myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = e.Record("SupplierID")
        
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Suppliers SET CompanyName = @CompanyName, Address = @Address, Country=@Country WHERE SupplierID = @SupplierID", myConn)

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record("CompanyName")
        myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = e.Record("Address")
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record("Country")        
        myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = e.Record("SupplierID")
        
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
		
        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Suppliers (CompanyName, Address, Country) VALUES(@CompanyName, @Address, @Country)", myConn)
		
        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record("CompanyName")
        myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = e.Record("Address")
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record("Country")
  
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
	Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
		BindGrid()
	End Sub		
	</script>		

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;
				background-color___:#f6f9fc;
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
		</style>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - AllowEdit/AllowDelete properties for Columns</b></span>
		<br /><br />		
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>				

		<br /><br /><br />
		
		<span class="tdText">
		    Use the <b>AllowEdit</b> and <b>AllowDelete</b> properties of the Column class to create columns that have the "Edit" / "Delete" buttons.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>