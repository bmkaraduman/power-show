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

		' setting the initial paging properties
		grid1.PageSize = 5
		grid1.CurrentPageIndex = 5

		
		grid1.FolderStyle = "styles/grand_gray"

		' creating the columns
		Dim oCol1 As Column = new Column()
		oCol1.DataField = "ProductID"
		oCol1.ReadOnly = true
		oCol1.HeaderText = "Product ID"
        oCol1.Width = "125"
        oCol1.SortOrder = SortOrderType.Desc

		Dim oCol2 As Column = new Column()
		oCol2.DataField = "ProductName"
		oCol2.HeaderText = "Product Name"
		oCol2.Width = "225"

		Dim oCol3 As Column = new Column()
		oCol3.DataField = "UnitPrice"
		oCol3.HeaderText = "Unit Price"
		oCol3.Width = "200"

		Dim oCol4 As Column = new Column()
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

		If chkEnableSorting.Checked = True Then		
			grid1.AllowSorting = True		
		Else		
			grid1.AllowSorting = False
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
		<span class="tdText"><b>ASP.NET Grid - Simple Sorting</b></span>
		<br /><br />	
			
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td class="tdText" valign="middle">Enable sorting</td>
				<td class="tdText" valign="middle">
					<asp:checkbox runat="server" id="chkEnableSorting" CSSClass="tdText" Checked="true"></asp:checkbox>
				</td>
				<td width="15" class="tdText">&#160;</td>
				<td class="tdText" valign="middle">
					<input type="submit" value="Submit" class="tdText" />
				</td>
			</tr>			
		</table>
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>			

		<br /><br /><br />

		<span class="tdText">
		Set <b>AllowSorting</b> to <span class="option2">true</span> to enable the sorting feature.<br />
		Use the <b>SortOrder</b> property of the <b>Column</b> class if you want to automatically sort a column when the page loads.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>
