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

		
        grid1.FolderStyle = "styles/premiere_blue"

		' creating the columns
		Dim oCol1 As Column = new Column()
        oCol1.DataField = "ShipCountry"
		oCol1.ReadOnly = true
        oCol1.HeaderText = "COUNTRY"
        oCol1.Width = "225"

		Dim oCol2 As Column = new Column()
        oCol2.DataField = "ShipCity"
        oCol2.HeaderText = "CITY"
        oCol2.Width = "175"

		Dim oCol3 As Column = new Column()
        oCol3.DataField = "ShipName"
        oCol3.HeaderText = "NAME"
        oCol3.Width = "225"

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)

		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)

		If Not Page.IsPostBack Then		
			BindGrid()
		End If
		
	End Sub

	Sub BindGrid()	
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 50 * FROM Orders", myConn)
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
		<span class="tdText"><b>ASP.NET Grid - Multi-Column Sorting</b></span>
		
		<br /><br />	
			
		<span class="tdText">Press the <b>CTRL</b> key while clicking on the headers of the columns to sort them.</span>
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>			

		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>
