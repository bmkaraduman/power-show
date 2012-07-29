<%@ Page Language="VB" MasterPageFile="vb_grid.master" Title="obout ASP.NET Grid examples"%>
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
		
        grid1.FolderStyle = "styles/grand_gray"
        grid1.AllowFiltering = True
        grid1.ShowLoadingMessage = False

		' setting the event handlers
		AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
		AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
		AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
		AddHandler CType(grid1, Grid).Rebind, AddressOf RebindGrid
		
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

		Dim oCol6 As Column = new Column()
		oCol6.HeaderText = "EDIT"
		oCol6.Width = "125"
        oCol6.AllowEdit = True
        oCol6.AllowDelete = True

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)
		grid1.Columns.Add(oCol5)
		grid1.Columns.Add(oCol6)
		
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
		
	Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
		myConn.Open()
		Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Orders WHERE OrderID = " + e.Record("OrderID").ToString(), myConn)
		myComm.ExecuteNonQuery()
		myConn.Close()
	End Sub
	
	Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
		myConn.Open()
		Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders SET ShipName='" + e.Record("ShipName").ToString().Replace("'", "''") + "', ShipCity='" + e.Record("ShipCity").ToString().Replace("'", "''") + "', ShipPostalCode='" + e.Record("ShipPostalCode").ToString().Replace("'", "''") + "', ShipCountry='" + e.Record("ShipCountry").ToString().Replace("'", "''") + "' WHERE OrderID = " + e.Record("OrderID").ToString(), myConn)
		myComm.ExecuteNonQuery()
		myConn.Close()
	End Sub
	
	Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
		myConn.Open()
		Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipPostalCode, ShipCountry) VALUES('" + e.Record("ShipName").ToString().Replace("'", "''") + "', '" + e.Record("ShipCity").ToString().Replace("'", "''") + "', '" + e.Record("ShipPostalCode").ToString().Replace("'", "''") + "', '" + e.Record("ShipCountry").ToString().Replace("'", "''") + "')", myConn)
		myComm.ExecuteNonQuery()
		myConn.Close()
	End Sub
	
	Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
		BindGrid()
	End Sub
	</script>

<asp:Content runat="server" ContentPlaceHolderID="vb_contentplaceholder">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Using the Grid with MasterPages</b></span>
		<br /><br />
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />
		
		<span class="tdText">
		The Grid can be placed inside a <b>Content</b> page of a <b>MasterPage</b>
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
</asp:Content>