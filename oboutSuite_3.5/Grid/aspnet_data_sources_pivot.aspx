<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
			
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Pivot Table</b></span>		
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" AllowAddingRecords="false" DataSourceID="sds1">
            <Columns>
                <obout:Column DataField="ShipName" HeaderText="CUSTOMER / PRODUCT" />
                <obout:Column DataField="Prod1" HeaderText="CHAI" NullDisplayText="0" />
                <obout:Column DataField="Prod2" HeaderText="CHANG" NullDisplayText="0" />
                <obout:Column DataField="Prod3" HeaderText="SYRUP" NullDisplayText="0" />
                <obout:Column DataField="Prod4" HeaderText="TOFU" NullDisplayText="0" />
            </Columns>
		</obout:Grid>
		
		<br />
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
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>