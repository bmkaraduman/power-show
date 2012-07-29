<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<script language="VB" runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim grid2 As Obout.Grid.DetailGrid = New DetailGrid()
    Dim grid3 As Obout.Grid.DetailGrid = New DetailGrid()
    Dim grid4 As Obout.Grid.DetailGrid = New DetailGrid()
    Dim grid5 As Obout.Grid.DetailGrid = New DetailGrid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ' Creating grid1
        grid1.ID = "grid1"
        grid1.CallbackMode = true
        grid1.Serialize = false
        grid1.AutoGenerateColumns = false
        grid1.FolderStyle = "styles/premiere_blue"
        grid1.AllowAddingRecords = false
        grid1.DataSourceID = "sds1"
        
        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback
        
        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "CustomerID"        
        oCol1.HeaderText = "CUSTOMER ID"
        oCol1.Visible = false
        
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
        grid2.CallbackMode = true
        grid2.Serialize = false
        grid2.AutoGenerateColumns = false
        grid2.FolderStyle = "styles/premiere_blue"
        grid2.AllowAddingRecords = false
        grid2.ShowFooter = True
        grid2.AllowPageSizeSelection = False
        grid2.AllowPaging = False
        grid2.DataSourceID = "sds2"
        grid2.ForeignKeys = "CustomerID"
        
        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback
        
        ' creating the columns
        Dim oCol2_1 As Column = New Column()
        oCol2_1.DataField = "CustomerID"        
        oCol2_1.HeaderText = "CUSTOMER ID"
        oCol2_1.Visible = false
        
        Dim oCol2_2 As Column = New Column()
        oCol2_2.DataField = "OrderID"        
        oCol2_2.HeaderText = "ORDER ID"
        oCol2_2.Visible = false
        
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
        grid3.CallbackMode = true
        grid3.Serialize = false
        grid3.AutoGenerateColumns = false
        grid3.FolderStyle = "styles/premiere_blue"
        grid3.AllowAddingRecords = false
        grid3.ShowFooter = True
        grid3.AllowPageSizeSelection = False
        grid3.AllowPaging = False
        grid3.DataSourceID = "sds3"
        grid3.ForeignKeys = "OrderID"
        
        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback
        
        ' creating the columns
        Dim oCol3_1 As Column = New Column()
        oCol3_1.DataField = "OrderID"        
        oCol3_1.HeaderText = "ORDER ID"
        oCol3_1.Visible = false
        
        Dim oCol3_2 As Column = New Column()
        oCol3_2.DataField = "OrderID"        
        oCol3_2.HeaderText = "ORDER ID"
        oCol3_2.Visible = false
        
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

        
        
        ' Creating grid4
        grid4.ID = "grid4"
        grid4.CallbackMode = true
        grid4.Serialize = false
        grid4.AutoGenerateColumns = false
        grid4.FolderStyle = "styles/premiere_blue"
        grid4.AllowAddingRecords = false
        grid4.ShowFooter = True
        grid4.AllowPageSizeSelection = False
        grid4.AllowPaging = False
        grid4.DataSourceID = "sds4"
        grid4.ForeignKeys = "ProductID"
        
        grid4.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback
        
        ' creating the columns
        Dim oCol4_1 As Column = New Column()
        oCol4_1.DataField = "ProductID"        
        oCol4_1.HeaderText = "PRODUCT ID"
        oCol4_1.Width = "140"
        
        Dim oCol4_2 As Column = New Column()
        oCol4_2.DataField = "SupplierID"        
        oCol4_2.HeaderText = "SUPPLIER ID"
        oCol4_2.Visible = false
        
        Dim oCol4_3 As Column = New Column()
        oCol4_3.DataField = "UnitPrice"
        oCol4_3.HeaderText = "UNIT PRICE"
        oCol4_3.Width = "165"
        oCol4_3.DataFormatString = "{0:C2}"
        
        Dim oCol4_4 As Column = New Column()
        oCol4_4.DataField = "ProductName"        
        oCol4_4.HeaderText = "PRODUCT NAME"
        oCol4_4.Width = "220"        

        ' add the columns to the Columns collection of the grid
        grid4.Columns.Add(oCol4_1)
        grid4.Columns.Add(oCol4_2)
        grid4.Columns.Add(oCol4_3)
        grid4.Columns.Add(oCol4_4)



        ' Creating grid5
        grid5.ID = "grid5"
        grid5.CallbackMode = true
        grid5.Serialize = false
        grid5.AutoGenerateColumns = false
        grid5.FolderStyle = "styles/premiere_blue"
        grid5.AllowAddingRecords = false
        grid5.ShowFooter = True
        grid5.AllowPageSizeSelection = False
        grid5.AllowPaging = False
        grid5.DataSourceID = "sds5"
        grid5.ForeignKeys = "SupplierID"
        
        ' creating the columns
        Dim oCol5_1 As Column = New Column()
        oCol5_1.DataField = "SupplierID"        
        oCol5_1.HeaderText = "SUPPLIER ID"
        oCol5_1.Width = "100"
        
        Dim oCol5_2 As Column = New Column()
        oCol5_2.DataField = "CompanyName"        
        oCol5_2.HeaderText = "COMPANY NAME"
        oCol5_2.Width = "220"
        
        Dim oCol5_3 As Column = New Column()
        oCol5_3.DataField = "Country"
        oCol5_3.HeaderText = "COUNTRY"
        oCol5_3.Width = "170"
        
        ' add the columns to the Columns collection of the grid
        grid5.Columns.Add(oCol5_1)
        grid5.Columns.Add(oCol5_2)
        grid5.Columns.Add(oCol5_3)

        

        grid4.DetailGrids.Add(grid5)
        grid3.DetailGrids.Add(grid4)
        grid2.DetailGrids.Add(grid3)
        grid1.DetailGrids.Add(grid2)        
        
            
            
        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
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
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Loading unlimited levels of details</b></span>		
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br /><br />				
		
		<span class="tdText">
		    By loading the detail grids "on-demand" (using the <span class="option2">OnCallback</span>) pattern, <br />
		    the number of details levels that the grid can load is unlimited.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 3 * FROM [Customers]"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		 
		<asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM [Orders] WHERE CustomerID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
		</asp:SqlDataSource>
		
		<asp:SqlDataSource runat="server" ID="sds3" SelectCommand="SELECT * FROM [Order Details] WHERE OrderID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </SelectParameters>
		</asp:SqlDataSource>
		
		<asp:SqlDataSource ID="sds4" runat="server" SelectCommand="SELECT ProductID, ProductName, UnitPrice, SupplierID FROM [Products] WHERE ProductID = ?"
            ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
            <SelectParameters>
                <asp:Parameter Name="ProductID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="sds5" runat="server" SelectCommand="SELECT SupplierID, CompanyName, Country  FROM [Suppliers] WHERE SupplierID = ?"
            ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
            <SelectParameters>
                <asp:Parameter Name="SupplierID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>