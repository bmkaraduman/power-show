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
        grid1.EnableTypeValidation = True
		
        grid1.FolderStyle = "styles/grand_gray"

		' setting the event handlers
		AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
		AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
		AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
		AddHandler CType(grid1, Grid).Rebind, AddressOf RebindGrid
		
		' creating the columns
        Dim oCol1 As Column = new Column()
        oCol1.DataField = "ProductID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "PRODUCT ID"
        oCol1.Width = "125"
		
        Dim oCol2 As Column = new Column()
        oCol2.DataField = "ProductName"
        oCol2.HeaderText = "PRODUCT NAME"
        oCol2.Width = "200"
		
        Dim oCol3 As Column = new Column()
        oCol3.DataField = "UnitsInStock"
        oCol3.HeaderText = "UNITS IN STOCK"
        oCol3.Width = "150"
		
        Dim oCol4 As Column = new Column()
        oCol4.DataField = "UnitsOnOrder"
        oCol4.HeaderText = "UNITS ON ORDER"
        oCol4.Width = "150"
											
        Dim oCol5 As Column = new Column()
        oCol5.DataField = "ReorderLevel"
        oCol5.HeaderText = "REORDER LEVEL"
        oCol5.Width = "150"

        Dim oCol6 As Column = new Column()
        oCol6.DataField = "Discontinued"
        oCol6.HeaderText = "DISCONTINUED"
        oCol6.Width = "150"

        Dim oCol7 As Column = new Column()
        oCol7.HeaderText = "EDIT"
        oCol7.Width = "125"
        oCol7.AllowEdit = True
        oCol7.AllowDelete = True

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
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

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 * FROM Products ORDER BY ProductID DESC", myConn)
		myConn.Open()
		
        Dim da As OleDbDataAdapter = New OleDbDataAdapter()
        Dim ds As DataSet = New DataSet()
        da.SelectCommand = myComm
        
        ' This line is needed in order to use the MaxLength and AllowNulls properties
        da.FillSchema(ds, SchemaType.Mapped, "Products")
        da.Fill(ds, "Products")

        grid1.DataSource = ds
		grid1.DataBind()

		myConn.Close()
	End Sub			
    
    Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Products WHERE ProductID = @ProductID", myConn)
        
        myComm.Parameters.Add("@ProductID", OleDbType.Integer).Value = e.Record("ProductID")
        
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Products SET ProductName = @ProductName, UnitsInStock = @UnitsInStock, UnitsOnOrder=@UnitsOnOrder, ReorderLevel=@ReorderLevel, Discontinued=@Discontinued WHERE ProductID = @ProductID", myConn)

        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = e.Record("ProductName")
        myComm.Parameters.Add("@UnitsInStock", OleDbType.VarChar).Value = e.Record("UnitsInStock")
        myComm.Parameters.Add("@UnitsOnOrder", OleDbType.VarChar).Value = e.Record("UnitsOnOrder")
        myComm.Parameters.Add("@ReorderLevel", OleDbType.VarChar).Value = e.Record("ReorderLevel")
        myComm.Parameters.Add("@Discontinued", OleDbType.Boolean).Value = e.Record("Discontinued")
        myComm.Parameters.Add("@ProductID", OleDbType.Integer).Value = e.Record("ProductID")
        
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
		
        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Products (ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued) VALUES(@ProductName, @UnitsInStock, @UnitsOnOrder, @ReorderLevel, @Discontinued)", myConn)
		
        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = e.Record("ProductName")
        myComm.Parameters.Add("@UnitsInStock", OleDbType.VarChar).Value = e.Record("UnitsInStock")
        myComm.Parameters.Add("@UnitsOnOrder", OleDbType.VarChar).Value = e.Record("UnitsOnOrder")
        myComm.Parameters.Add("@ReorderLevel", OleDbType.VarChar).Value = e.Record("ReorderLevel")
        myComm.Parameters.Add("@Discontinued", OleDbType.Boolean).Value = e.Record("Discontinued")
  
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
		<span class="tdText"><b>ASP.NET Grid - Type Validation</b></span>
		<br /><br />
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />
		
		<span class="tdText">
		    To enable the Type Validation feature, just set <b>EnableTypeValidation</b>=<span class="option2">true</span><br />
		    When you Add/Edit records, the values you enter will be validated (they need to have the same type like in the database).<br />
		    Also, the values will be checked against the MaxLength and AllowNulls properties of the columns in the database.
		    <br /><br />
		    In this example, the "UNITS IN STOCK", "UNITS ON ORDER", "REORDER LEVEL" columns must be integers.<br />
		    The "DISCONTINUED" column can have only the true/false values.<br />
		    The "PRODUCT NAME" column has a maximum length of 40 characters, if this limit is exceeded, a message will pop-up.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>