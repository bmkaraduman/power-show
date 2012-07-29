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
        grid1.AllowAddingRecords = False
        
        grid1.ShowTotalNumberOfPages = True
        grid1.NumberOfPagesShownInFooter = 7
		
        grid1.FolderStyle = "styles/grand_gray"
		
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

		Dim oCol3 As Column = new Column()
		oCol3.DataField = "ShipCity"
		oCol3.HeaderText = "CITY"
		oCol3.Width = "150"

		Dim oCol4 As Column = new Column()
		oCol4.DataField = "ShipPostalCode"
		oCol4.HeaderText = "POSTAL CODE"
		oCol4.Width = "150"

		Dim oCol5 As Column = new Column()
		oCol5.DataField = "ShipCountry"
		oCol5.HeaderText = "COUNTRY"
		oCol5.Width = "150"

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)
		grid1.Columns.Add(oCol5)
		
		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
		
        grid1.ShowTotalNumberOfPages = chkShowTotalNumberOfPages.Checked
        grid1.NumberOfPagesShownInFooter = Int32.Parse(ddlNumberOfPagesShownInFooter.SelectedValue)
        
		If Not Page.IsPostBack Then
			BindGrid()			
		End If
	End Sub

	Sub BindGrid()
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 100 * FROM Orders ORDER BY OrderID DESC", myConn)
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
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Customizing the Number of Pages</b></span>
		
		<br /><br />
        
        <span class="tdText">
	        Show total number of Pages <asp:CheckBox runat="server" ID="chkShowTotalNumberOfPages" Checked="true" AutoPostBack="true" /> <br />
	        Number of Pages shown in Footer
	        <asp:DropDownList runat="server" ID="ddlNumberOfPagesShownInFooter" CssClass="tdText" AutoPostBack="true">
	            <asp:ListItem Value="1">1</asp:ListItem>
	            <asp:ListItem Value="2">2</asp:ListItem>
	            <asp:ListItem Value="3">3</asp:ListItem>
	            <asp:ListItem Value="4">4</asp:ListItem>
	            <asp:ListItem Value="5">5</asp:ListItem>
	            <asp:ListItem Value="6">6</asp:ListItem>
	            <asp:ListItem Value="7" Selected="True">7</asp:ListItem>
	            <asp:ListItem Value="8">8</asp:ListItem>
	            <asp:ListItem Value="9">9</asp:ListItem>
	            <asp:ListItem Value="10">10</asp:ListItem>
	        </asp:DropDownList>
	    </span>

		<br /><br />
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
				
		<br /><br /><br />
		
		<span class="tdText">
		Set the <b>ShowTotalNumberOfPages</b> property to <span class="option2">true</span> to make the Grid display the total number of pages.<br />
		Use the <b>NumberOfPagesShownInFooter</b> property to change the number of pages displayed in the footer.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>