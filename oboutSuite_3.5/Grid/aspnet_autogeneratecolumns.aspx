<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
	void Page_load(object sender, EventArgs e)		
	{		
		if (!Page.IsPostBack)
		{
			CreateGrid();			
		}
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 50 OrderID, CustomerID, ShipCity, ShipRegion, ShipPostalCode, ShipCountry, EmployeeID, Freight FROM Orders", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();


		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}
	
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
	</head>
	<body>
		<form runat="server">			
		<br />
		<span class="tdText"><b>Auto Generate Columns</b></span>
		<br /><br />		
		<obout:Grid id="grid1" runat="server"  AutoGenerateColumns="true" CallbackMode="true" Serialize="true" 
			 FolderStyle="styles/black_glass" AllowColumnResizing="true" EnableRecordHover="true"
			AllowAddingRecords="true" AllowFiltering="true" ShowLoadingMessage="false">
		</obout:Grid>		

		<br /><br /><br />
		
		<span class="tdText">
			The easiest way to create a grid is to set <b>AutoGenerateColumns</b> to <span class="option2">true</span>.<br />
			All the columns from the datasource will be added to the grid.<br /><br />
			See also the <a href="http://www.obout.com/grid/grid_tutorials_columns.aspx">Columns tutorial</a>.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>

