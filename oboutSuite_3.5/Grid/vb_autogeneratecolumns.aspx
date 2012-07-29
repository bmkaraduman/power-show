<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">	
	Dim grid1 As Obout.Grid.Grid = New Grid()
	
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)	
		grid1.ID = "grid1"
		grid1.AutoGenerateColumns = True
		grid1.CallbackMode = True
		grid1.Serialize = True
		grid1.EnableRecordHover = True
		
		grid1.FolderStyle = "styles/grand_gray"
		grid1.AllowColumnResizing = False
		grid1.AllowAddingRecords = True
        grid1.AllowFiltering = True
        grid1.ShowLoadingMessage = False
		
		phGrid1.Controls.Add(grid1)
		
		If Not Page.IsPostBack Then		
			BindGrid()
		End If		
	End Sub

	Sub BindGrid()	
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

		Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 50 OrderID, CustomerID, ShipCity, ShipRegion, ShipPostalCode, ShipCountry, EmployeeID, Freight FROM Orders", myConn)
		myConn.Open()
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
	</head>
	<body>
		<form runat="server">			
		<br />
		<span class="tdText"><b>Auto Generate Columns</b></span>
		<br /><br />		
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

		<br /><br /><br />
		
		<span class="tdText">
			The easiest way to create a grid is to set <b>AutoGenerateColumns</b> to <span class="option2">true</span>.<br />
			All the columns from the datasource will be added to the grid.<br /><br />
			See also the <a href="http://www.obout.com/grid/grid_tutorials_columns.aspx">Columns tutorial</a>.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>

