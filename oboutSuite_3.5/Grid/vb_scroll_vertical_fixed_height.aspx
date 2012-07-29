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
        
        grid1.FolderStyle = "styles/grand_gray"
        grid1.PageSize = 50
        grid1.ScrollingSettings.ScrollHeight = 250
        grid1.AllowFiltering = True
        
        grid1.ClientSideEvents.OnClientCallback = "resizeGrid"
        grid1.ClientSideEvents.OnBeforeClientAdd = "onAction"
        grid1.ClientSideEvents.OnClientCancelAdd = "onAction"
        grid1.ClientSideEvents.OnClientEdit = "onAction"
        grid1.ClientSideEvents.OnClientCancelEdit = "onAction"
        

        ' setting the event handlers
        AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
        AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
        AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
        AddHandler CType(grid1, Grid).Rebind, AddressOf RebindGrid
		
        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "125"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "200"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        oCol3.Width = "150"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "150"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "150"

        Dim oCol6 As Column = New Column()
        oCol6.HeaderText = ""
        oCol6.Width = "150"
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

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 50 * FROM Orders ORDER BY OrderID DESC", myConn)
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
        
        Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn)
        
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")
        
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")
        
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
		
        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipPostalCode, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry)", myConn)
		
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
  
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
        BindGrid()
    End Sub
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>obout ASP.NET Grid examples</title>
    <style type="text/css">
        .tdText
        {
            font: 11px Verdana;
            color: #333333;
        }
        .option2
        {
            font: 11px Verdana;
            color: #0033cc;
            padding-left: 4px;
            padding-right: 4px;
        }
        a
        {
            font: 11px Verdana;
            color: #315686;
            text-decoration: underline;
        }
        a:hover
        {
            color: crimson;
        }
        .ob_gBody
        {
            border-bottom: 1px solid #C3C9CE;
        }
    </style>

    <script type="text/javascript">

        var RealHeight = 0;
        function onAction() {
            if (RealHeight == 0) {
                RealHeight = grid1.o_l1s;
                grid1.o_l1s = 0;
                window.setTimeout(restoreRealHeight, 50);
            }
        }

        function restoreRealHeight() {
            grid1.o_l1s = RealHeight;
            RealHeight = 0;
        }

        function resizeGrid() {
            var container = grid1.GridBodyContainer.firstChild;

            grid1.GridBodyContainer.style.height = grid1.o_l1s + 'px';
        }

        function getFilterRowHeight() {
            return grid1.GridFooterContainer.firstChild.firstChild.childNodes[2].offsetHeight;
        }

        function increaseGridHeight() {
            grid1.o_l1s += getFilterRowHeight();
            resizeGrid();
        }

        function decreaseGridHeight() {
            grid1.o_l1s -= getFilterRowHeight();
            resizeGrid();
        }

        window.onload = function() {
            resizeGrid();

            oboutGrid.prototype.showFilterOld = oboutGrid.prototype.showFilter;
            oboutGrid.prototype.showFilter = function() {
                this.showFilterOld();
                decreaseGridHeight();
            }

            oboutGrid.prototype.hideFilterOld = oboutGrid.prototype.hideFilter;
            oboutGrid.prototype.hideFilter = function() {
                increaseGridHeight();
                this.hideFilterOld();
            }
        }
    </script>

</head>
<body>
    <form id="Form1" runat="server">
    <br />
    <span class="tdText"><b>ASP.NET Grid - Fixed Height</b></span>
    <br />
    <br />
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
    <br />
    <br />
    <br />
    <span class="tdText">The Grid can have a fixed height, independent on the number of
        records that are loaded. </span>
    <br />
    <br />
    <br />
    <a href="Default.aspx?type=VBNET">« Back to examples</a>
    </form>
</body>
</html>
