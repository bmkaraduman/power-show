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
        grid1.AllowFiltering = True
        grid1.AllowAddingRecords = False        
		
        grid1.FolderStyle = "styles/grand_gray"
		
		' creating the columns
		Dim oCol1 As Column = new Column()
		oCol1.DataField = "OrderID"
		oCol1.ReadOnly = True
		oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "100"
        oCol1.FilterOptions.Add(New FilterOption(FilterOptionType.NoFilter))
        oCol1.FilterOptions.Add(New FilterOption(FilterOptionType.EqualTo))
        oCol1.FilterOptions.Add(New FilterOption(FilterOptionType.SmallerThan))
        oCol1.FilterOptions.Add(New FilterOption(FilterOptionType.GreaterThan))

		Dim oCol2 As Column = new Column()
		oCol2.DataField = "ShipName"
		oCol2.HeaderText = "NAME"
        oCol2.Width = "225"
        oCol2.FilterOptions.Add(New FilterOption(FilterOptionType.NoFilter))
        oCol2.FilterOptions.Add(New FilterOption(FilterOptionType.Contains))
        oCol2.FilterOptions.Add(New FilterOption(FilterOptionType.DoesNotContain))
        oCol2.FilterOptions.Add(New FilterOption(FilterOptionType.StartsWith))
        oCol2.FilterOptions.Add(New FilterOption(FilterOptionType.EndsWith))

		Dim oCol3 As Column = new Column()
		oCol3.DataField = "ShipCity"
		oCol3.HeaderText = "CITY"
        oCol3.Width = "175"
        oCol3.FilterOptions.Add(New FilterOption(FilterOptionType.NoFilter))
        oCol3.FilterOptions.Add(New FilterOption(FilterOptionType.EqualTo))
        oCol3.FilterOptions.Add(New FilterOption(FilterOptionType.Contains))
        oCol3.FilterOptions.Add(New FilterOption(FilterOptionType.DoesNotContain))
        oCol3.FilterOptions.Add(New FilterOption(FilterOptionType.StartsWith))
        oCol3.FilterOptions.Add(New FilterOption(FilterOptionType.EndsWith))
        oCol3.FilterOptions.Add(New FilterOption(FilterOptionType.IsEmpty))
        oCol3.FilterOptions.Add(New FilterOption(FilterOptionType.IsNotEmpty))

		Dim oCol4 As Column = new Column()
		oCol4.DataField = "ShipPostalCode"
		oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "175"
        oCol4.FilterOptions.Add(New FilterOption(FilterOptionType.NoFilter))
        oCol4.FilterOptions.Add(New FilterOption(FilterOptionType.Contains))
        oCol4.FilterOptions.Add(New FilterOption(FilterOptionType.IsEmpty))
        oCol4.FilterOptions.Add(New FilterOption(FilterOptionType.IsNotEmpty))

		Dim oCol5 As Column = new Column()
		oCol5.DataField = "ShipCountry"
		oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "150"
        oCol5.FilterOptions.Add(New FilterOption(FilterOptionType.NoFilter))
        oCol5.FilterOptions.Add(New FilterOption(FilterOptionType.Contains))
        oCol5.FilterOptions.Add(New FilterOption(FilterOptionType.StartsWith))
        oCol5.FilterOptions.Add(New FilterOption(FilterOptionType.EndsWith))

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)
		grid1.Columns.Add(oCol5)
		
		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
				
		If Not Page.IsPostBack Then
			BindGrid()			
		End If
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
	</head>
	<body>	
		<form id="Form1" runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Customizing the Filter Options for each Column</b></span>
		<br /><br />
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />
		
		<span class="tdText">
		Use the <b>FilterOptions</b> property of the Column class to customize the Filter Options for each column.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>