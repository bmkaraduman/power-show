<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
	
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.AllowSorting = True
        grid1.AllowAddingRecords = False
        grid1.AllowFiltering = True
		
        ' setting the initial paging properties
        grid1.PageSize = 5
        grid1.CurrentPageIndex = 5
		
		
        grid1.FolderStyle = "styles/premiere_blue"
		
        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "ProductID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "Product ID"
        oCol1.Width = "175"
		
        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ProductName"
        oCol2.HeaderText = "Product Name"
        oCol2.Width = "275"
		
        Dim oCol3 As Column = New Column()
        oCol3.DataField = "UnitPrice"
        oCol3.HeaderText = "Unit Price"
        oCol3.Width = "250"
		
        Dim oCol4 As Column = New Column()
        oCol4.DataField = "Discontinued"
        oCol4.HeaderText = "Discontinued"
        oCol4.Width = "150"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
		
        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
		
        If Not Page.IsPostBack Then
            BindGrid()
        End If
    End Sub

	Sub BindGrid()
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

		Dim myComm As OleDbCommand = New OleDbCommand("SELECT * FROM Products", myConn)
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
		<span class="tdText"><b>ASP.NET Grid Paging</b></span>
		<br /><br />				
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

		<br /><br />

		<span class="tdText">
			The Grid has two properties for paging:<br />
			<ul>
				<li type="disc">
					<b>PageSize</b> - the number of records per page
				</li>
				<li type="disc">
					<b>CurrentPageIndex</b> - the zero-based index of the page that will be loaded
				</li>
			</ul>
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>