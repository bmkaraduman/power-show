<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">		
<script language="VB" runat="server">	
    Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim grid2 As Obout.Grid.Grid = New Grid()
    Dim grid3 As Obout.Grid.Grid = New Grid()
    
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.FolderStyle = "../Grid/styles/black_glass"
        grid1.PageSize = 7
        grid1.Width = Unit.Percentage(100)
        grid1.AllowAddingRecords = False

        ' creating the columns
        Dim oCol11 As Column = New Column()
        oCol11.DataField = "SupplierID"
        oCol11.ReadOnly = True
        oCol11.HeaderText = "ID"
        oCol11.Width = "10%"
        
        Dim oCol12 As Column = New Column()
        oCol12.DataField = "CompanyName"
        oCol12.HeaderText = "COMPANY NAME"
        oCol12.Width = "45%"
        
        Dim oCol13 As Column = New Column()
        oCol13.DataField = "Address"
        oCol13.HeaderText = "ADDRESS"
        oCol13.Width = "25%"
        
        Dim oCol14 As Column = New Column()
        oCol14.DataField = "Country"
        oCol14.HeaderText = "COUNTRY"
        oCol14.Width = "20%"

        grid2.ID = "grid2"
        grid2.CallbackMode = True
        grid2.Serialize = True
        grid2.AutoGenerateColumns = False
        grid2.FolderStyle = "../Grid/styles/black_glass"
        grid2.PageSize = 7
        grid2.Width = Unit.Percentage(75)
        grid2.AllowAddingRecords = False

        Dim oCol21 As Column = New Column()
        oCol21.DataField = "OrderID"
        oCol21.ReadOnly = True
        oCol21.HeaderText = "ID"
        oCol21.Width = "10%"

        Dim oCol22 As Column = New Column()
        oCol22.DataField = "ShipName"
        oCol22.HeaderText = "NAME"
        oCol22.Width = "30%"

        Dim oCol23 As Column = New Column()
        oCol23.DataField = "ShipCity"
        oCol23.HeaderText = "CITY"
        oCol23.Width = "15%"

        Dim oCol24 As Column = New Column()
        oCol24.DataField = "ShipPostalCode"
        oCol24.HeaderText = "POSTAL CODE"
        oCol24.Width = "20%"

        Dim oCol25 As Column = New Column()
        oCol25.DataField = "ShipCountry"
        oCol25.HeaderText = "COUNTRY"
        oCol25.Width = "25%"

        grid3.ID = "grid3"
        grid3.CallbackMode = True
        grid3.Serialize = True
        grid3.AutoGenerateColumns = False
        grid3.FolderStyle = "../Grid/styles/black_glass"
        grid3.PageSize = 7
        grid3.Width = Unit.Percentage(50)
        grid3.AllowAddingRecords = False

        Dim oCol31 As Column = New Column()
        oCol31.DataField = "OrderID"
        oCol31.ReadOnly = True
        oCol31.HeaderText = "ID"
        oCol31.Width = "10%"

        Dim oCol32 As Column = New Column()
        oCol32.DataField = "ShipName"
        oCol32.HeaderText = "NAME"
        oCol32.Width = "30%"

        Dim oCol33 As Column = New Column()
        oCol33.DataField = "ShipCity"
        oCol33.HeaderText = "CITY"
        oCol33.Width = "15%"

        Dim oCol34 As Column = New Column()
        oCol34.DataField = "ShipPostalCode"
        oCol34.HeaderText = "POSTAL CODE"
        oCol34.Width = "20%"

        Dim oCol35 As Column = New Column()
        oCol35.DataField = "ShipCountry"
        oCol35.HeaderText = "COUNTRY"
        oCol35.Width = "25%"


        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol11)
        grid1.Columns.Add(oCol12)
        grid1.Columns.Add(oCol13)
        grid1.Columns.Add(oCol14)

        grid2.Columns.Add(oCol21)
        grid2.Columns.Add(oCol22)
        grid2.Columns.Add(oCol23)
        grid2.Columns.Add(oCol24)
        grid2.Columns.Add(oCol25)

        grid3.Columns.Add(oCol31)
        grid3.Columns.Add(oCol32)
        grid3.Columns.Add(oCol33)
        grid3.Columns.Add(oCol34)
        grid3.Columns.Add(oCol35)


        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
        phGrid2.Controls.Add(grid2)
        phGrid3.Controls.Add(grid3)

        CreateGrid()
    
    End Sub
    

    Sub CreateGrid()

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT * FROM Suppliers", myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()

        grid1.DataSource = myReader
        grid1.DataBind()

        myConn.Close()

        Dim myConn2 As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm2 As OleDbCommand = New OleDbCommand("SELECT TOP 15 * FROM Orders", myConn2)
        myConn2.Open()
        Dim myReader2 As OleDbDataReader = myComm2.ExecuteReader()

        grid2.DataSource = myReader2
        grid2.DataBind()

        myConn2.Close()

        Dim myConn3 As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm3 As OleDbCommand = New OleDbCommand("SELECT TOP 15 * FROM Orders", myConn3)
        myConn3.Open()
        Dim myReader3 As OleDbDataReader = myComm3.ExecuteReader()

        grid3.DataSource = myReader3
        grid3.DataBind()

        myConn3.Close()
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
