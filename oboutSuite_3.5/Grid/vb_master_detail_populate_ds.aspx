<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script language="VB" runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim grid2 As Obout.Grid.DetailGrid = New DetailGrid()
    Dim grid3 As Obout.Grid.DetailGrid = New DetailGrid()

    Sub Page_init(ByVal sender As Object, ByVal e As EventArgs)
  
        ' Creating grid1
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = False
        grid1.AutoGenerateColumns = False
        grid1.FolderStyle = "styles/grand_gray"
        grid1.AllowAddingRecords = False
        
        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback
        
        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "CustomerID"
        oCol1.HeaderText = "CUSTOMER ID"
        oCol1.Visible = False
        
        Dim oCol2 As Column = New Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "250"
        
        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ContactName"
        oCol3.HeaderText = "CONTACT NAME"
        
        Dim oCol4 As Column = New Column()
        oCol4.DataField = "Country"
        oCol4.HeaderText = "COUNTRY"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        
        
        
        ' Creating grid2
        grid2.ID = "grid2"
        grid2.CallbackMode = True
        grid2.Serialize = False
        grid2.AutoGenerateColumns = False
        grid2.FolderStyle = "styles/grand_gray"
        grid2.AllowAddingRecords = False
        grid2.ShowFooter = True
        grid2.AllowPageSizeSelection = False
        grid2.AllowPaging = False
        grid2.ForeignKeys = "CustomerID"
        
        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback
        
        ' creating the columns
        Dim oCol2_1 As Column = New Column()
        oCol2_1.DataField = "CustomerID"
        oCol2_1.HeaderText = "CUSTOMER ID"
        oCol2_1.Visible = False
        
        Dim oCol2_2 As Column = New Column()
        oCol2_2.DataField = "OrderID"
        oCol2_2.HeaderText = "ORDER ID"
        oCol2_2.Visible = False
        
        Dim oCol2_3 As Column = New Column()
        oCol2_3.DataField = "OrderDate"
        oCol2_3.HeaderText = "ORDER DATE"
        oCol2_3.Width = "225"
        oCol2_3.DataFormatString = "{0:MM/dd/yyyy}"
        
        Dim oCol2_4 As Column = New Column()
        oCol2_4.DataField = "ShippedDate"
        oCol2_4.HeaderText = "SHIPPED DATE"
        oCol2_4.DataFormatString = "{0:MM/dd/yyyy}"
        
        Dim oCol2_5 As Column = New Column()
        oCol2_5.DataField = "Freight"
        oCol2_5.HeaderText = "FREIGHT"
        oCol2_5.DataFormatString = "{0:C2}"

        ' add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_1)
        grid2.Columns.Add(oCol2_2)
        grid2.Columns.Add(oCol2_3)
        grid2.Columns.Add(oCol2_4)
        grid2.Columns.Add(oCol2_5)
        
        
        
        ' Creating grid3
        grid3.ID = "grid3"
        grid3.CallbackMode = True
        grid3.Serialize = False
        grid3.AutoGenerateColumns = False
        grid3.FolderStyle = "styles/grand_gray"
        grid3.AllowAddingRecords = False
        grid3.ShowFooter = True
        grid3.AllowPageSizeSelection = False
        grid3.AllowPaging = False
        grid3.ForeignKeys = "OrderID"
        
        ' creating the columns
        Dim oCol3_1 As Column = New Column()
        oCol3_1.DataField = "OrderID"
        oCol3_1.HeaderText = "ORDER ID"
        oCol3_1.Visible = False
        
        Dim oCol3_2 As Column = New Column()
        oCol3_2.DataField = "OrderID"
        oCol3_2.HeaderText = "ORDER ID"
        oCol3_2.Visible = False
        
        Dim oCol3_3 As Column = New Column()
        oCol3_3.DataField = "UnitPrice"
        oCol3_3.HeaderText = "UNIT PRICE"
        oCol3_3.Width = "185"
        oCol3_3.DataFormatString = "{0:C2}"
        
        Dim oCol3_4 As Column = New Column()
        oCol3_4.DataField = "Quantity"
        oCol3_4.HeaderText = "QUANTITY"
        oCol3_4.Width = "185"
        
        Dim oCol3_5 As Column = New Column()
        oCol3_5.DataField = "Discount"
        oCol3_5.HeaderText = "DISCOUNT"
        oCol3_5.DataFormatString = "{0:F2}%"
        oCol3_5.Width = "185"

        ' add the columns to the Columns collection of the grid
        grid3.Columns.Add(oCol3_1)
        grid3.Columns.Add(oCol3_2)
        grid3.Columns.Add(oCol3_3)
        grid3.Columns.Add(oCol3_4)
        grid3.Columns.Add(oCol3_5)


        grid2.DetailGrids.Add(grid3)
        grid1.DetailGrids.Add(grid2)
        
            
            
        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub
    
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        
        PopulateGrid(grid3, "Order Details", 0)
        PopulateGrid(grid2, "Orders", 0)
        PopulateGrid(grid1, "Customers", 3)
        
    End Sub
    
    Sub PopulateGrid(ByRef tempGrid As Grid, ByVal tableName As String, ByVal limit As Integer)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT" + IIf(limit <> 0, " TOP 3 ", " ") + "* FROM [" + tableName + "]", myConn)
        myConn.Open()

        Dim da As OleDbDataAdapter = New OleDbDataAdapter()
        Dim ds As DataSet = New DataSet()
        da.SelectCommand = myComm
        da.Fill(ds, tableName)

        tempGrid.DataSource = ds.Tables(0).DefaultView
        tempGrid.DataBind()

        myConn.Close()
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
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Populating from DataSets</b></span>		
		
		<br /><br />

        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br /><br />				
		
		<span class="tdText">
		    The detail grids can be populated from DataSets too.
		</span>			
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>