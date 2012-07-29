<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
	void Page_load(object sender, EventArgs e)
	{		
		CreateGrid();
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();

		OleDbConnection myConn2 = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm2 = new OleDbCommand("SELECT TOP 15 * FROM Orders", myConn2);
		myConn2.Open();
		OleDbDataReader myReader2 = myComm2.ExecuteReader();

		grid2.DataSource = myReader2;
		grid2.DataBind();

		myConn2.Close();

        OleDbConnection myConn3 = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm3 = new OleDbCommand("SELECT TOP 15 * FROM Orders", myConn3);
        myConn3.Open();
        OleDbDataReader myReader3 = myComm3.ExecuteReader();

        grid3.DataSource = myReader3;
        grid3.DataBind();

        myConn3.Close();
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
		<form id="Form1" runat="server">	

		<br />
		<span class="tdText"><b>Using Relative Widths for the Columns/Grid</b></span>
		<br /><br /><br />	
		
		<span class="tdText"><b>Width="100%"</b></span>
		<obout:Grid id="grid1" runat="server" PageSize="7" CallbackMode="true" Serialize="true" Width="100%"
			AutoGenerateColumns="false" AllowAddingRecords="false" AllowPageSizeSelection="false"
			FolderStyle="styles/black_glass">
			<Columns>
				<obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="10%" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="45%" runat="server"/>				
				<obout:Column DataField="Address" HeaderText="ADDRESS"  Width="25%" runat="server" />
				<obout:Column DataField="Country" HeaderText="COUNTRY" Width="20%" runat="server" />					
			</Columns>			
		</obout:Grid>		
		
		<br /><br />
		
		<span class="tdText"><b>Width="75%"</b></span>
		<obout:Grid id="grid2" runat="server" PageSize="7" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			 FolderStyle="styles/black_glass" AllowAddingRecords="false" Width="75%" AllowPageSizeSelection="false">
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ID" Width="10%" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="30%" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="15%" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="20%" runat="server" />
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="25%" runat="server" />
			</Columns>			
		</obout:Grid>
		
		<br /><br />
		
		<span class="tdText"><b>Width="50%"</b></span>
		<obout:Grid id="grid3" runat="server" PageSize="7" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			 FolderStyle="styles/black_glass" AllowAddingRecords="false" Width="50%" AllowPageSizeSelection="false">
			<Columns>
				<obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ID" Width="10%" runat="server"/>
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="30%" runat="server"/>				
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="15%" runat="server" />
				<obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="20%" runat="server" />
				<obout:Column ID="Column5" DataField="ShipCountry" HeaderText="COUNTRY" Width="25%" runat="server" />
			</Columns>			
		</obout:Grid>
				
		<br />	        
		<br />
		
		<span class="tdText">
		    The widths for the Columns/Grid may be specified as a <b>percentage</b> (relative widths).<br />
		    The Grids are automatically resized when the browser window is resized.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
