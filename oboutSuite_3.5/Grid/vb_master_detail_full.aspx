<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/VB" runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim grid2 As Obout.Grid.DetailGrid = New DetailGrid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ' Creating grid1
        grid1.ID = "grid1"
        grid1.CallbackMode = true
        grid1.Serialize = false
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = true
        grid1.DataSourceID = "sds1"
        grid1.PageSize = 5
        grid1.AllowFiltering = False

        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback
        
        AddHandler CType(grid1, Grid).InsertCommand, AddressOf EmptyCommand
        AddHandler CType(grid1, Grid).DeleteCommand, AddressOf EmptyCommand
        AddHandler CType(grid1, Grid).UpdateCommand, AddressOf EmptyCommand
        
        grid1.ClientSideEvents.OnClientInsert = "onEmptyCommand"
        grid1.ClientSideEvents.OnClientUpdate = "onEmptyCommand"
        grid1.ClientSideEvents.OnClientDelete = "onEmptyCommand"

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "CustomerID"
        oCol1.HeaderText = "CUSTOMER ID"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "285"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ContactName"
        oCol3.HeaderText = "CONTACT NAME"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "Country"
        oCol4.HeaderText = "COUNTRY"
        
        Dim oCol5 As Column = New Column()
        oCol5.DataField = ""
        oCol5.AllowEdit = true
        oCol5.AllowDelete = True
         oCol5.Width = "140"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)


        ' Creating grid2
        grid2.ID = "grid2"
        grid2.CallbackMode = true
        grid2.Serialize = false
        grid2.AutoGenerateColumns = false
        grid2.AllowAddingRecords = true
        grid2.ShowFooter = True
        grid2.AllowPageSizeSelection = False
        grid2.AllowPaging = False
        grid2.DataSourceID = "sds2"
        grid2.ForeignKeys = "CustomerID"
        grid2.PageSize = 5

        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback
        
        AddHandler CType(grid2, Grid).InsertCommand, AddressOf EmptyCommand
        AddHandler CType(grid2, Grid).DeleteCommand, AddressOf EmptyCommand
        AddHandler CType(grid2, Grid).UpdateCommand, AddressOf EmptyCommand
        
        grid2.ClientSideEvents.OnClientInsert = "onEmptyCommand"
        grid2.ClientSideEvents.OnClientUpdate = "onEmptyCommand"
        grid2.ClientSideEvents.OnClientDelete = "onEmptyCommand"

        
        ' creating the columns
        Dim oCol2_1 As Column = New Column()
        oCol2_1.DataField = "CustomerID"
        oCol2_1.HeaderText = "CUSTOMER ID"
        oCol2_1.Visible = false
        oCol2_1.ReadOnly = true

        Dim oCol2_2 As Column = New Column()
        oCol2_2.DataField = "OrderID"
        oCol2_2.HeaderText = "ORDER ID"
        oCol2_2.Visible = false
        oCol2_1.ReadOnly = true

        Dim oCol2_3 As Column = New Column()
        oCol2_3.DataField = "ShipName"
        oCol2_3.HeaderText = "SHIP NAME"
        oCol2_3.Width = "250"
        
        Dim oCol2_4 As Column = New Column()
        oCol2_4.DataField = "ShipCity"
        oCol2_4.HeaderText = "SHIP CITY"
        oCol2_4.Width = "200"

        Dim oCol2_5 As Column = New Column()
        oCol2_5.DataField = "ShipCountry"
        oCol2_5.HeaderText = "SHIP COUNTRY"
        oCol2_5.DataFormatString = "{0:C2}"
        oCol2_5.Width = "200"

        Dim oCol2_6 As Column = New Column()
        oCol2_6.DataField = ""
        oCol2_6.AllowEdit = true
        oCol2_6.AllowDelete = true
        oCol2_6.Width = "210"
        oCol2_6.Align = "center"

        ' add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_1)
        grid2.Columns.Add(oCol2_2)
        grid2.Columns.Add(oCol2_3)
        grid2.Columns.Add(oCol2_4)
        grid2.Columns.Add(oCol2_5)
        grid2.Columns.Add(oCol2_6)
      
        grid1.DetailGrids.Add(grid2)


        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub
    
    Sub EmptyCommand(ByVal sender As Object, ByVal e As GridRecordEventArgs)
    End Sub
</script>

<html>
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
		<script type="text/javascript">
		    function onEmptyCommand(record) {
		        alert('The operation was successful. For this example, the database has not been updated.');
		    }
		</script>
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Add / edit / delete at runtime</b></span>		
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br /><br />				
		
		<span class="tdText">
		    The DetailGrids can use all the features that are available for regular grids (e.g. adding, editing, deleting, sorting, paging, etc.)
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" ProviderName="System.Data.OleDb"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
		    SelectCommand="SELECT TOP 15 * FROM [Customers]">		    
		 </asp:SqlDataSource>
		 
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
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>