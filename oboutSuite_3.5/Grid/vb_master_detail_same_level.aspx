<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<script language="VB" runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim grid2 As Obout.Grid.DetailGrid = New DetailGrid()
    Dim grid3 As Obout.Grid.DetailGrid = New DetailGrid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ' Creating grid1
        grid1.ID = "grid1"
        grid1.CallbackMode = true
        grid1.Serialize = false
        grid1.AutoGenerateColumns = false
        grid1.FolderStyle = "styles/premiere_blue"
        grid1.AllowAddingRecords = false
        grid1.DataSourceID = "sds1"
        
        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnLoad
        
        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "CustomerID"
        oCol1.Visible = false
        
        Dim oCol2 As Column = New Column()
        oCol2.DataField = "EmployeeID"
        oCol2.Visible = false
        
        Dim oCol3 As Column = New Column()
        oCol3.DataField = "OrderID"        
        oCol3.Visible = false
        
        Dim oCol4 As Column = New Column()
        oCol4.DataField = "OrderDate"        
        oCol4.HeaderText = "ORDER DATE"
        oCol4.DataFormatString = "{0:MM/dd/yyyy}"
        oCol4.Width = "190"
        
        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShippedDate"
        oCol5.HeaderText = "SHIPPED DATE"
        oCol5.DataFormatString = "{0:MM/dd/yyyy}"
        
        Dim oCol6 As Column = New Column()
        oCol6.DataField = "Freight"
        oCol6.HeaderText = "FREIGHT"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)
        
        
        
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
        grid2.ForeignKeys = "EmployeeID"
        
        ' creating the columns
        Dim oCol2_1 As Column = New Column()
        oCol2_1.DataField = "EmployeeID"
        oCol2_1.Visible = false
        
        Dim oCol2_2 As Column = New Column()
        oCol2_2.DataField = "LastName"        
        oCol2_2.HeaderText = "EMPLOYEE LAST NAME"
        
        Dim oCol2_3 As Column = New Column()
        oCol2_3.DataField = "FirstName"
        oCol2_3.HeaderText = "EMPLOYEE FIRST NAME"
        
        Dim oCol2_4 As Column = New Column()
        oCol2_4.DataField = "Country"        
        oCol2_4.HeaderText = "COUNTRY"
        
        ' add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_1)
        grid2.Columns.Add(oCol2_2)
        grid2.Columns.Add(oCol2_3)
        grid2.Columns.Add(oCol2_4)
        
        
        
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
        grid3.ForeignKeys = "CustomerID"
        
        ' creating the columns
        Dim oCol3_1 As Column = New Column()
        oCol3_1.DataField = "CustomerID"
        oCol3_1.Visible = false
        
        Dim oCol3_2 As Column = New Column()
        oCol3_2.DataField = "CompanyName"        
        oCol3_2.HeaderText = "CUSTOMER"
        
        Dim oCol3_3 As Column = New Column()
        oCol3_3.DataField = "ContactName"
        oCol3_3.HeaderText = "CUSTOMER CONTACT"
        
        Dim oCol3_4 As Column = New Column()
        oCol3_4.DataField = "Country"        
        oCol3_4.HeaderText = "COUNTRY"
        
        ' add the columns to the Columns collection of the grid
        grid3.Columns.Add(oCol3_1)
        grid3.Columns.Add(oCol3_2)
        grid3.Columns.Add(oCol3_3)
        grid3.Columns.Add(oCol3_4)


        grid1.DetailGrids.Add(grid2)
        grid1.DetailGrids.Add(grid3)        
        
            
            
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
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Multiple Detail Grids on the same Level</b></span>		
		
		<br /><br />
		
        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br /><br />				
		
		<span class="tdText">
		    You can have multiple detail grids on the same level.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 3 * FROM [Orders]"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		</asp:SqlDataSource>
		
		<asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM [Employees] WHERE EmployeeID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </SelectParameters>
		</asp:SqlDataSource>
				
		<asp:SqlDataSource runat="server" ID="sds3" SelectCommand="SELECT * FROM [Customers] WHERE CustomerID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters> 
		</asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>