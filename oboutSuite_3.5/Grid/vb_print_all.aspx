<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script language="VB" runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()
    
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = true
        grid1.Serialize = false
        grid1.AutoGenerateColumns = false
        grid1.FolderStyle = "styles/premiere_blue"
        grid1.AllowAddingRecords = false
        grid1.DataSourceID = "sds1"
        grid1.PageSizeOptions = "-1,10,50,100"

        grid1.ClientSideEvents.OnClientCallback = "grid1_Callback"

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = true
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "125"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "SHIP NAME"
        oCol2.Width = "150"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        oCol3.Width = "150"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "125"
        
        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "125"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

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
		<script type="text/javascript">
		    var printGridOnCallback = false;
		    var currentPageSize = 10;

		    function printGrid(printAll) {
		        if (printAll) {
		            printGridOnCallback = true;
		            currentPageSize = grid1.getPageSize();
		            ob_grid1PageSizeSelector.value(-1);
		        } else {
		            grid1.print();
		        }

		        return false;
		    }

		    function grid1_Callback() {
		        if (printGridOnCallback) {
		            grid1.print();
		            printGridOnCallback = false;
		            ob_grid1PageSizeSelector.value(currentPageSize);
		        }
		    }
		</script>
		<style type="text/css" media="print">
		    .ob_gPSTT
			{
			    display: none !important;
			}
		</style>
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Printing all the pages of the Grid</b></span>		
		
		<br /><br />
				
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br />
		
		<obout:OboutButton runat="server" Text="Print Current Page" OnClientClick="return printGrid(false);" FolderStyle="../Interface/styles/premiere_blue/OboutButton" />
		
		<obout:OboutButton runat="server" Text="Print All Pages" OnClientClick="return printGrid(true);" FolderStyle="../Interface/styles/premiere_blue/OboutButton" />
		
		<br /><br />
		
		<span class="tdText">
		    Use the <b>print</b> client-side method to print the pages of the grid.<br />
		    In this sample we use a small JavaScript trick to print all the pages from the grid.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 15 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>