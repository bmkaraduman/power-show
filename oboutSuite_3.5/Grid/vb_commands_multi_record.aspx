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
        grid1.AllowAddingRecords = True
        
        grid1.AllowMultiRecordAdding = True
        grid1.AllowMultiRecordEditing = True
        grid1.AllowMultiRecordDeleting = True
		
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
        oCol4.Width = "125"
        
        Dim oCol5 As Column = New Column()
        oCol5.DataField = ""
        oCol5.HeaderText = ""
        oCol5.Width = "150"
        oCol5.AllowEdit = True
        oCol5.AllowDelete = True
			

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

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
		Dim myReader As OleDbDataReader = myComm.ExecuteReader()

		grid1.DataSource = myReader
		grid1.DataBind()

		myConn.Close()
	End Sub
	
    Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        If e.RecordsCollection.Count > 0 Then                    
            Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
            myConn.Open()
        
            For Each oRecord As Hashtable In e.RecordsCollection
                Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Suppliers WHERE SupplierID = @SupplierID", myConn)
        
                myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = oRecord("SupplierID")
        
                myComm.ExecuteNonQuery()
            Next
            
            myConn.Close()
        End If
    End Sub
	
    Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        If e.RecordsCollection.Count > 0 Then
            Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
            myConn.Open()
        
            For Each oRecord As Hashtable In e.RecordsCollection
                Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Suppliers SET CompanyName = @CompanyName, Address = @Address, Country=@Country WHERE SupplierID = @SupplierID", myConn)

                myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = oRecord("CompanyName")
                myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = oRecord("Address")
                myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = oRecord("Country")
                myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = oRecord("SupplierID")
        
                myComm.ExecuteNonQuery()
            Next
            
            myConn.Close()
        End If
    End Sub
	
    Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        If e.RecordsCollection.Count > 0 Then
            Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
            myConn.Open()
		
            For Each oRecord As Hashtable In e.RecordsCollection
                Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Suppliers (CompanyName, Address, Country) VALUES(@CompanyName, @Address, @Country)", myConn)
		
                myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = oRecord("CompanyName")
                myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = oRecord("Address")
                myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = oRecord("Country")
  
                myComm.ExecuteNonQuery()
            Next
            
            myConn.Close()
        End If
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
					
		<br /><br />
		<span class="tdText">ASP.NET Grid - Multi-Record Add/Edit/Delete</span>			
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br /><br />
		
		<span class="tdText">
		    Make any changes to the Grid (add, edit, delete records) then hit the Save All link.<br />
		    A single trip to the server will take place, persisting all the changes in the database.
		</span>
		
		<br /><br />
		
		<span class="tdText">
		    Use the following properties:
		    <ul>
		        <li><b>AllowMultiRecordAdding</b> - enables the multi-record adding feature</li>
		        <li><b>AllowMultiRecordEditing</b> - enables the multi-record editing feature</li>
		        <li><b>AllowMultiRecordDeleting</b> - enables the multi-record deleting feature</li>
		    </ul>
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>


