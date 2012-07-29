<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
	Grid grid1 = new Grid();
	
	void Page_load(object sender, EventArgs e)		
	{
		grid1.ID = "grid1";		
		grid1.CallbackMode = true;				
		grid1.Serialize = true;
		grid1.AutoGenerateColumns = false;
        grid1.DataSourceID = "sds1";
        grid1.AllowAddingRecords = false;
		
		grid1.FolderStyle = "styles/black_glass";
		
		// creating the columns
		Column oCol1 = new Column();
        oCol1.DataField = "ShipName";
        oCol1.HeaderText = "CUSTOMER / PRODUCT";
        oCol1.NullDisplayText = "ShipName";
		
		Column oCol2 = new Column();
        oCol2.DataField = "Prod1";
        oCol2.HeaderText = "CHAI";
        oCol2.NullDisplayText = "0";

		
		Column oCol3 = new Column();
        oCol3.DataField = "Prod2";
        oCol3.HeaderText = "CHANG";
        oCol3.NullDisplayText = "0";
        
		Column oCol4 = new Column();
        oCol4.DataField = "Prod3";
        oCol4.HeaderText = "SYRUP";
        oCol4.NullDisplayText = "0";
											
		Column oCol5 = new Column();
        oCol5.DataField = "Prod4";
        oCol5.HeaderText = "TOFU";
        oCol5.NullDisplayText = "0";


		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		grid1.Columns.Add(oCol5);
		
		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
		
	}	
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
		<span class="tdText"><b>ASP.NET Grid - Pivot Table</b></span>		
		<br /><br />
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		<br /><br />
		<span class="tdText">
		    Using the Grid you can generate a PIVOT table displaying data from multiple tables.<br />
            The Grid from this sample uses product names (loaded from the Products table) as columns and <br />
            customer names (loaded from the Orders table) as rows.
		</span>
		
		<asp:SqlDataSource runat="server" ID="sds1" 
            SelectCommand="SELECT TOP 25 O.ShipName,
                            (SELECT SUM(Quantity) FROM [Order Details] WHERE OrderID = O.OrderID AND ProductID = 1) AS Prod1,
                            (SELECT SUM(Quantity) FROM [Order Details] WHERE OrderID = O.OrderID AND ProductID = 2) AS Prod2,
                            (SELECT SUM(Quantity) FROM [Order Details] WHERE OrderID = O.OrderID AND ProductID = 3) AS Prod3,
                            (SELECT SUM(Quantity) FROM [Order Details] WHERE OrderID = O.OrderID AND ProductID = 14) AS Prod4
                            FROM Orders O INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID 
                            WHERE OD.ProductID IN (1,2,3,4)"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb" />
				
		<br /><br /><br />		
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>