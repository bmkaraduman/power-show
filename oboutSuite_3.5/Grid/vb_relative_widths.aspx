<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">	
	Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim grid2 As Obout.Grid.Grid = New Grid()
    Dim grid3 As Obout.Grid.Grid = New Grid()

	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
		grid1.ID = "grid1"
		grid1.CallbackMode = True
		grid1.Serialize = True
		grid1.AutoGenerateColumns = False
		grid1.AllowAddingRecords = False
        grid1.PageSize = 7
        grid1.Width = Unit.Percentage(100)
        grid1.FolderStyle = "styles/premiere_blue"
	
		' creating the columns
		Dim oCol1 As Column = new Column()
		oCol1.DataField = "SupplierID"
		oCol1.ReadOnly = True
		oCol1.HeaderText = "ID"
        oCol1.Width = "10%"

		Dim oCol2 As Column = new Column()
		oCol2.DataField = "CompanyName"
		oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "45%"

		Dim oCol3 As Column = new Column()
		oCol3.DataField = "Address"
		oCol3.HeaderText = "ADDRESS"
        oCol3.Width = "25%"

		Dim oCol4 As Column = new Column()
		oCol4.DataField = "Country"
		oCol4.HeaderText = "COUNTRY"
        oCol4.Width = "20%"
			
		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)

		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
																	
		
		' creating the second grid
		grid2.ID = "grid2"
		grid2.CallbackMode = True
		grid2.Serialize = True		
		grid2.AutoGenerateColumns = False		
		grid2.AllowAddingRecords = False		
        grid2.PageSize = 7
        grid2.Width = Unit.Percentage(75)
        grid2.FolderStyle = "styles/premiere_blue"

		' creating the columns
		oCol1 = new Column()
		oCol1.DataField = "OrderID"
		oCol1.ReadOnly = true
        oCol1.HeaderText = "ID"
        oCol1.Width = "10%"

		oCol2 = new Column()
		oCol2.DataField = "ShipName"
		oCol2.HeaderText = "NAME"
        oCol2.Width = "30%"

		oCol3 = new Column()
		oCol3.DataField = "ShipCity"
		oCol3.HeaderText = "CITY"
        oCol3.Width = "15%"

		oCol4 = new Column()
		oCol4.DataField = "ShipPostalCode"
		oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "20%"

		Dim oCol5 As Column = new Column()
		oCol5.DataField = "ShipCountry"
		oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "25%"
		
		' add the columns to the Columns collection of the grid
		grid2.Columns.Add(oCol1)
		grid2.Columns.Add(oCol2)
		grid2.Columns.Add(oCol3)
		grid2.Columns.Add(oCol4)
        grid2.Columns.Add(oCol5)
        
        
        ' creating the third grid
        grid3.ID = "grid3"
        grid3.CallbackMode = True
        grid3.Serialize = True
        grid3.AutoGenerateColumns = False
        grid3.AllowAddingRecords = False
        grid3.PageSize = 7
        grid3.Width = Unit.Percentage(50)
        grid3.FolderStyle = "styles/premiere_blue"

        ' creating the columns
        oCol1 = New Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ID"
        oCol1.Width = "10%"

        oCol2 = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "30%"

        oCol3 = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        oCol3.Width = "15%"

        oCol4 = New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "20%"

        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "25%"

        ' add the columns to the Columns collection of the grid
        grid3.Columns.Add(oCol1)
        grid3.Columns.Add(oCol2)
        grid3.Columns.Add(oCol3)
        grid3.Columns.Add(oCol4)
        grid3.Columns.Add(oCol5)

        
		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
        phGrid2.Controls.Add(grid2)
        phGrid3.Controls.Add(grid3)

		If Not Page.IsPostBack Then		
			BindGrid()
		End If
	End Sub

	Sub BindGrid()
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
		Dim myComm As OleDbCommand = New OleDbCommand("SELECT * FROM Suppliers", myConn)
		myConn.Open()
		Dim myReader As OleDbDataReader = myComm.ExecuteReader()

		grid1.DataSource = myReader
		grid1.DataBind()

		myConn.Close()

        ' -------------
        
        Dim myConn2 As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm2 As OleDbCommand = New OleDbCommand("SELECT TOP 15 * FROM Orders", myConn2)
		myConn2.Open()
        Dim myReader2 As OleDbDataReader = myComm2.ExecuteReader()

		grid2.DataSource = myReader2
		grid2.DataBind()

        myConn2.Close()
        
        ' -------------
                
        Dim myConn3 As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm3 As OleDbCommand = New OleDbCommand("SELECT TOP 15 * FROM Orders", myConn3)
        myConn3.Open()
        Dim myReader3 As OleDbDataReader = myComm3.ExecuteReader()

        grid3.DataSource = myReader3
        grid3.DataBind()

        myConn3.Close()
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
		<span class="tdText"><b>Using Relative Widths for the Columns/Grid</b></span>
		<br /><br /><br />	
		
		<span class="tdText"><b>Width="100%"</b></span>
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		
		
		<br /><br />
		
		<span class="tdText"><b>Width="75%"</b></span>
		<asp:PlaceHolder ID="phGrid2" runat="server"></asp:PlaceHolder>		
		
		<br /><br />	
		
		<span class="tdText"><b>Width="50%"</b></span>
		<asp:PlaceHolder ID="phGrid3" runat="server"></asp:PlaceHolder>			

		<br /><br />
		
		<span class="tdText">
		    The widths for the Columns/Grid may be specified as a <b>percentage</b> (relative widths).<br />
		    The Grids are automatically resized when the browser window is resized.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>
