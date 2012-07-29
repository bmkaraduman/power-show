<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">	
	Dim grid1 As Obout.Grid.Grid = New Grid()
	
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )
		grid1.ID = "grid1"
		grid1.CallbackMode = True
		grid1.Serialize = True
		grid1.AutoGenerateColumns = False
		
        grid1.FolderStyle = "styles/premiere_blue"
        grid1.AllowColumnResizing = False
        grid1.AllowAddingRecords = False
        grid1.ShowFooter = False
		
		' creating the columns
        Dim oCol1 As Column = new Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "100"

        Dim oCol2 As Column = new Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "200"

        Dim oCol4 As Column = new Column()
        oCol4.DataField = "ShipCity"
        oCol4.HeaderText = "CITY"
        oCol4.Width = "150"
        
        Dim oCol4_1 As Column = New Column()
        oCol4_1.DataField = "ShipPostalCode"
        oCol4_1.HeaderText = "POSTAL CODE"
        oCol4_1.Width = "150"

        Dim oCol5 As Column = new Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "150"

        Dim oCol6 As Column = new Column()
        oCol6.DataField = "OrderDate"
        oCol6.HeaderText = "ORDER DATE"
        oCol6.Width = "200"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol4_1)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)        
		
		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
		        
        BindGrid()
		
	End Sub

	Sub BindGrid()
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn)
		myConn.Open()
		'Dim da = new OleDbDataAdapter()
		'Dim ds = new DataSet()
		'da.SelectCommand = myComm
		'da.Fill(ds, "Orders")
		Dim myReader As OleDbDataReader = myComm.ExecuteReader()


		grid1.DataSource = myReader
		grid1.DataBind()

		myConn.Close()
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
		function show_hide_Column(index) {
	        var oChk = document.getElementById("chkCol" + index);
	        if(oChk.checked == true) {  
	            grid1.showColumn(index);
	        } else {
	            grid1.hideColumn(index);
	        }
	    }
		</script>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Show/Hide columns</b></span>
		<br /><br /><br />
		<span class="tdText">Check/uncheck the checkboxes to show/hide the columns</span>
		<table>
		    <tr>
		        <td class="tdText">
		            <input type="checkbox" id="chkCol0" onclick="show_hide_Column(0)" checked="checked" /> ORDER ID
		        </td>
		        <td class="tdText">
		            <input type="checkbox" id="chkCol1" onclick="show_hide_Column(1)" checked="checked" /> NAME
		        </td>
		        <td class="tdText">
		            <input type="checkbox" id="chkCol2" onclick="show_hide_Column(2)" checked="checked" /> CITY
		        </td>
		    </tr>
		    <tr>
		        <td class="tdText">
		            <input type="checkbox" id="chkCol3" onclick="show_hide_Column(3)" checked="checked" /> POSTAL CODE
		        </td>
		        <td class="tdText">
		            <input type="checkbox" id="chkCol4" onclick="show_hide_Column(4)" checked="checked" /> COUNTRY
		        </td>
		        <td class="tdText">
		            <input type="checkbox" id="chkCol5" onclick="show_hide_Column(5)" checked="checked" /> ORDER DATE
		        </td>
		    </tr>
		</table>
		<br />		
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
					
		<br /><br /><br />
		
		<span class="tdText">
		Use the <b>showColumn</b> and <b>hideColumn</b> client-side methods to show/hide columns from the Grid.<br />
		Use the index or the DataField of the column as the parameter for these methods.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
		<style type="text/css">
		    .ob_gPST
		    {
		        display: none;
		    }
		    .ob_gPSS
		    {
		        display: none;
		    }
		</style>
	</body>
</html>