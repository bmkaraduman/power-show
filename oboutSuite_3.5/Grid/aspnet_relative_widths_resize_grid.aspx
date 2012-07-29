<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

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
			.ob_gCS, .ob_gCS div, .ob_gCS_F, .ob_gCS_F div 
            {
                  display: none;
            }

		</style>
		
		<script type="text/javascript">
		function hide_Column(grid, index, width) {
			// call the method for hiding the column here:
			grid.hideColumn(index);

			// replace 100%, 75% or 50% with the width of your grid
			grid.GridMainContainer.style.width = width;    
				
			grid.GridHeaderContainer.style.width =  grid.GridMainContainer.offsetWidth + 'px';
			grid.GridHeaderContainer.firstChild.style.width =  grid.GridMainContainer.offsetWidth + 'px';
				
			grid.GridBodyContainer.style.width =  grid.GridMainContainer.offsetWidth + 'px';
			grid.GridBodyContainer.firstChild.style.width =  grid.GridMainContainer.offsetWidth + 'px';
				
			if(grid.GridFooterContainer && grid.GridFooterContainer.firstChild) {
				grid.GridFooterContainer.style.width =  grid.GridMainContainer.offsetWidth + 'px';
				grid.GridFooterContainer.firstChild.style.width =  grid.GridMainContainer.offsetWidth + 'px';
			} 

	    }
		</script>	
	</head>
	<body>
		<form id="Form1" runat="server">	

		<br />
		<span class="tdText"><b>Using Relative Widths for the Columns/Grid</b></span>
		<br /><br /><br />	
		<span class="tdText">Press the buttons to hide the columns</span>
		<table>
		    <tr>
		        <td class="tdText">
		            <input type="button" id="btnCol0" onclick="hide_Column(grid1, 0, '100%')" value="ID" />
		        </td>
		        <td class="tdText">
		            <input type="button" id="btnCol1" onclick="hide_Column(grid1, 1, '100%')"  value="Company Name"/>
		        </td>
		        <td class="tdText">
		            <input type="button" id="btnCol2" onclick="hide_Column(grid1, 2, '100%')" value="Address" />
		        </td>
		        <td class="tdText">
		            <input type="button" id="btnCol3" onclick="hide_Column(grid1, 3, '100%')"  value="Country"/>
		        </td>
		    </tr>
		</table>
		<br />		
		<span class="tdText"><b>Width="100%"</b></span>
		<obout:Grid id="grid1" runat="server" PageSize="7" CallbackMode="true" Serialize="true" Width="100%"
			AutoGenerateColumns="false" AllowAddingRecords="false"
			FolderStyle="styles/black_glass">
			<Columns>
				<obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="10%" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="45%" runat="server"/>				
				<obout:Column DataField="Address" HeaderText="ADDRESS"  Width="25%" runat="server" />
				<obout:Column DataField="Country" HeaderText="COUNTRY" Width="20%" runat="server" />					
			</Columns>			
		</obout:Grid>		
		
		<br /><br /><br /><br />
		<span class="tdText">Press the buttons to hide the columns</span>
		<table>
		    <tr>
		        <td class="tdText">
		            <input type="button" id="btnCol0" onclick="hide_Column(grid2, 0, '75%')" value="ID" />
		        </td>
		        <td class="tdText">
		            <input type="button" id="btnCol1" onclick="hide_Column(grid2, 1, '75%')"  value="Name"/>
		        </td>
		        <td class="tdText">
		            <input type="button" id="btnCol2" onclick="hide_Column(grid2, 2, '75%')" value="City" />
		        </td>
		        <td class="tdText">
		            <input type="button" id="btnCol3" onclick="hide_Column(grid2, 3, '75%')"  value="Postal Code"/>
		        </td>
		        <td class="tdText">
		            <input type="button" id="btnCol4" onclick="hide_Column(grid2, 4, '75%')"  value="Country"/>
		        </td>
		    </tr>
		</table>
		<br />		
		<span class="tdText"><b>Width="75%"</b></span>
		<obout:Grid id="grid2" runat="server" PageSize="7" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			 FolderStyle="styles/black_glass" AllowAddingRecords="false" Width="75%">
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ID" Width="10%" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="30%" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="15%" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="20%" runat="server" />
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="25%" runat="server" />
			</Columns>			
		</obout:Grid>
		
		<br /><br /><br /><br />
		<span class="tdText">Press the buttons to hide the columns</span>
		<table>
		    <tr>
		        <td class="tdText">
		            <input type="button" id="btnCol0" onclick="hide_Column(grid3, 0, '50%')" value="ID" />
		        </td>
		        <td class="tdText">
		            <input type="button" id="btnCol1" onclick="hide_Column(grid3, 1, '50%')"  value="Name"/>
		        </td>
		        <td class="tdText">
		            <input type="button" id="btnCol2" onclick="hide_Column(grid3, 2, '50%')" value="City" />
		        </td>
		        <td class="tdText">
		            <input type="button" id="btnCol3" onclick="hide_Column(grid3, 3, '50%')"  value="Postal Code"/>
		        </td>
		        <td class="tdText">
		            <input type="button" id="btnCol4" onclick="hide_Column(grid3, 4, '50%')"  value="Country"/>
		        </td>
		    </tr>
		</table>
		<br />		
		<span class="tdText"><b>Width="50%"</b></span>
		<obout:Grid id="grid3" runat="server" PageSize="7" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			 FolderStyle="styles/black_glass" AllowAddingRecords="false" Width="50%">
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
