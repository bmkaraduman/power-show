<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">	
    Grid grid1 = new Grid();
    Grid grid2 = new Grid();
    Grid grid3 = new Grid();
	void Page_load(object sender, EventArgs e)
	{
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.FolderStyle = "../Grid/styles/black_glass";
        grid1.PageSize = 7;
        grid1.Width = Unit.Percentage(100);
        grid1.AllowAddingRecords = false;

        // creating the columns
        Column oCol11 = new Column();
        oCol11.DataField = "SupplierID";
        oCol11.ReadOnly = true;
        oCol11.HeaderText = "ID";
        oCol11.Width = "10%"; 
        
        Column oCol12 = new Column();
        oCol12.DataField = "CompanyName";
        oCol12.HeaderText = "COMPANY NAME";
        oCol12.Width = "45%"; 
        
        Column oCol13 = new Column();
        oCol13.DataField = "Address";
        oCol13.HeaderText = "ADDRESS";
        oCol13.Width = "25%"; 
        
        Column oCol14 = new Column();
        oCol14.DataField = "Country";
        oCol14.HeaderText = "COUNTRY";
        oCol14.Width = "20%";

        grid2.ID = "grid2";
        grid2.CallbackMode = true;
        grid2.Serialize = true;
        grid2.AutoGenerateColumns = false;
        grid2.FolderStyle = "../Grid/styles/black_glass";
        grid2.PageSize = 7;
        grid2.Width = Unit.Percentage(75);
        grid2.AllowAddingRecords = false;

        Column oCol21 = new Column();
        oCol21.DataField = "OrderID";
        oCol21.ReadOnly = true;
        oCol21.HeaderText = "ID";
        oCol21.Width = "10%";

        Column oCol22 = new Column();
        oCol22.DataField = "ShipName";
        oCol22.HeaderText = "NAME";
        oCol22.Width = "30%";

        Column oCol23 = new Column();
        oCol23.DataField = "ShipCity";
        oCol23.HeaderText = "CITY";
        oCol23.Width = "15%";

        Column oCol24 = new Column();
        oCol24.DataField = "ShipPostalCode";
        oCol24.HeaderText = "POSTAL CODE";
        oCol24.Width = "20%";

        Column oCol25 = new Column();
        oCol25.DataField = "ShipCountry";
        oCol25.HeaderText = "COUNTRY";
        oCol25.Width = "25%";

        grid3.ID = "grid3";
        grid3.CallbackMode = true;
        grid3.Serialize = true;
        grid3.AutoGenerateColumns = false;
        grid3.FolderStyle = "../Grid/styles/black_glass";
        grid3.PageSize = 7;
        grid3.Width = Unit.Percentage(50);
        grid3.AllowAddingRecords = false;

        Column oCol31 = new Column();
        oCol31.DataField = "OrderID";
        oCol31.ReadOnly = true;
        oCol31.HeaderText = "ID";
        oCol31.Width = "10%";

        Column oCol32 = new Column();
        oCol32.DataField = "ShipName";
        oCol32.HeaderText = "NAME";
        oCol32.Width = "30%";

        Column oCol33 = new Column();
        oCol33.DataField = "ShipCity";
        oCol33.HeaderText = "CITY";
        oCol33.Width = "15%";

        Column oCol34 = new Column();
        oCol34.DataField = "ShipPostalCode";
        oCol34.HeaderText = "POSTAL CODE";
        oCol34.Width = "20%";

        Column oCol35 = new Column();
        oCol35.DataField = "ShipCountry";
        oCol35.HeaderText = "COUNTRY";
        oCol35.Width = "25%";


        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol11);
        grid1.Columns.Add(oCol12);
        grid1.Columns.Add(oCol13);
        grid1.Columns.Add(oCol14);

        grid2.Columns.Add(oCol21);
        grid2.Columns.Add(oCol22);
        grid2.Columns.Add(oCol23);
        grid2.Columns.Add(oCol24);
        grid2.Columns.Add(oCol25);

        grid3.Columns.Add(oCol31);
        grid3.Columns.Add(oCol32);
        grid3.Columns.Add(oCol33);
        grid3.Columns.Add(oCol34);
        grid3.Columns.Add(oCol35);


        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
        phGrid2.Controls.Add(grid2);
        phGrid3.Controls.Add(grid3);

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
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		
		
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
		<asp:PlaceHolder ID="phGrid2" runat="server"></asp:PlaceHolder>	
		
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
		<asp:PlaceHolder ID="phGrid3" runat="server"></asp:PlaceHolder>	
		
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
