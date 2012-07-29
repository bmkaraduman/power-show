<%@ Page Language="VB" %>
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
		
        grid1.FolderStyle = "styles/premiere_blue"

		' setting the event handlers
		AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
		AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
		AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
		AddHandler CType(grid1, Grid).Rebind, AddressOf RebindGrid
		
		' creating the columns
        Dim oCol1 As Column = new Column()
        oCol1.DataField = "ShipperID"
        oCol1.ReadOnly = true
        oCol1.HeaderText = "SHIPPER ID"
        oCol1.Width = "100"
        oCol1.Visible = false

        Dim oCol2 As Column = new Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "200"

        Dim oCol3 As Column = new Column()
        oCol3.DataField = "Phone"
        oCol3.HeaderText = "PHONE"
        oCol3.Width = "150"

        Dim oCol4 As Column = new Column()
        oCol4.DataField = "Website"
        oCol4.HeaderText = "WEBSITE"
        oCol4.Width = "350"
        oCol4.ParseHTML = true

        Dim oCol5 As Column = new Column()
        oCol5.DataField = "HasEmail"
        oCol5.HeaderText = "HAS EMAIL"
        oCol5.Width = "350"
        oCol5.ParseHTML = true

        Dim oCol6 As Column = new Column()
        oCol6.HeaderText = "EDIT"
        oCol6.Width = "125"
        oCol6.AllowEdit = true
        oCol6.AllowDelete = true

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)
		grid1.Columns.Add(oCol5)
		grid1.Columns.Add(oCol6)
		
		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
				
		If Not Page.IsPostBack Then
			BindGrid()			
		End If
	End Sub

	Sub BindGrid()
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT * FROM Shippers ORDER BY ShipperID DESC", myConn)
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
        
        Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Shippers WHERE ShipperID = @ShipperID", myConn)
        
        myComm.Parameters.Add("@ShipperID", OleDbType.Integer).Value = e.Record("ShipperID")
        
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Shippers SET CompanyName = @CompanyName, Phone = @Phone, Website=@Website, HasEmail=@HasEmail WHERE ShipperID = @ShipperID", myConn)

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record("CompanyName")
        myComm.Parameters.Add("@Phone", OleDbType.VarChar).Value = e.Record("Phone")
        myComm.Parameters.Add("@Website", OleDbType.VarChar).Value = e.Record("Website")
        myComm.Parameters.Add("@HasEmail", OleDbType.VarChar).Value = e.Record("HasEmail")
        myComm.Parameters.Add("@ShipperID", OleDbType.Integer).Value = e.Record("ShipperID")
        
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
		
        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Shippers (CompanyName, Phone, Website, HasEmail) VALUES(@CompanyName, @Phone, @Website, @HasEmail)", myConn)
		
        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record("CompanyName")
        myComm.Parameters.Add("@Phone", OleDbType.VarChar).Value = e.Record("Phone")
        myComm.Parameters.Add("@Website", OleDbType.VarChar).Value = e.Record("Website")
        myComm.Parameters.Add("@HasEmail", OleDbType.VarChar).Value = e.Record("HasEmail")
  
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
		<span class="tdText"><b>ASP.NET Grid - ParseHTML property for the Columns</b></span>
		<br /><br />
				
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />
		
		<span class="tdText">
		    Use the <b>ParseHTML</b> property of the Column class if you have HTML content in your database and<br />
		    you want to show the HTML elements in the Grid (not the HTML text).
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>