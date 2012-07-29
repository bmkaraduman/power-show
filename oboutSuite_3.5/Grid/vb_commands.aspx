<%@ Page Language="VB"  %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
	
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
		grid1.ID = "grid1"
        grid1.CallbackMode = True
		grid1.Serialize = True
		grid1.AutoGenerateColumns = False
		grid1.AllowAddingRecords = False
		 
		
		grid1.FolderStyle = "styles/grand_gray"

		' setting the event handlers
		AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
		AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
        AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
        AddHandler CType(grid1, Grid).Rebind, AddressOf RebindGrid
        AddHandler CType(grid1, Grid).ColumnsCreated, AddressOf grid1_ColumnsCreated



		' creating the columns
		Dim oCol1 As Column = new Column()
		oCol1.DataField = "SupplierID"
		oCol1.ReadOnly = True
		oCol1.HeaderText = "ID"
		oCol1.Width = "45"

		Dim oCol2 As Column = new Column()
		oCol2.DataField = "CompanyName"
		oCol2.HeaderText = "COMPANY NAME"
		oCol2.Width = "250"

		Dim oCol3 As Column = new Column()
		oCol3.DataField = "Address"
		oCol3.HeaderText = "ADDRESS"
		oCol3.Width = "225"

		Dim oCol4 As Column = new Column()
		oCol4.DataField = "Country"
		oCol4.HeaderText = "COUNTRY"
        oCol4.Width = "100"
        
        Dim oCol5 As Column = New Column()
        oCol5.DataField = ""
        oCol5.HeaderText = ""
        oCol5.Width = "125"
        oCol5.AllowEdit = True
        oCol5.AllowDelete = True
        oCol5.Visible = False
			

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
		
        If chkAllowAddNew.Checked = True Then
            grid1.AllowAddingRecords = True
        Else
            grid1.AllowAddingRecords = False
        End If 
        
        If Not Page.IsPostBack Then
            BindGrid()
        End If
    End Sub

	Sub BindGrid()	
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

		Dim myComm As OleDbCommand = New OleDbCommand("SELECT * FROM Suppliers", myConn)
		myConn.Open()
		Dim myReader As OleDbDataReader = myComm.ExecuteReader()

		grid1.DataSource = myReader
		grid1.DataBind()

		myConn.Close()
    End Sub
    
    Sub grid1_ColumnsCreated(ByVal sender As Object, ByVal e As EventArgs)
    
        If Not grid1.IsCallback Then
        
            grid1.Columns(4).AllowEdit = chkEdit.Checked
            grid1.Columns(4).AllowDelete = chkDelete.Checked
            grid1.Columns(4).Visible = chkEdit.Checked Or chkDelete.Checked
        End If
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
		<form id="Form1" runat="server">
					
		<br /><br />
		<span class="tdText">Add/edit/delete records</span>
		<br /><br />
		
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td class="tdText" valign="middle">Show "Add new" link</td>
				<td class="tdText" valign="middle">
					<asp:checkbox runat="server" id="chkAllowAddNew" CSSClass="tdText"></asp:checkbox>
				</td>
				<td width="15" class="tdText">&#160;</td>
				<td class="tdText" valign="middle">
					<asp:Button ID="Button1" runat="server" Text="Submit" />
				</td>
			</tr>
			<tr>
				<td class="tdText">Show "Edit" column</td>
				<td class="tdText">
					<asp:checkbox runat="server" id="chkEdit" CSSClass="tdText"></asp:checkbox>
				</td>
				<td class="tdText" colspan="2">&#160;</td>
			</tr>
			<tr>
				<td class="tdText">Show "Delete" column</td>
				<td class="tdText">
					<asp:checkbox runat="server" id="chkDelete" CSSClass="tdText"></asp:checkbox>
				</td>
				<td class="tdText" colspan="2">&#160;</td>
			</tr>
		</table>
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>



