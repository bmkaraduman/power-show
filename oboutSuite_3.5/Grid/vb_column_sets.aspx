<%@ Page Language="VB" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="VB" runat="server">	
    Dim grid1 As Obout.Grid.Grid = New Grid()
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = true
        grid1.Serialize = true
        grid1.AutoGenerateColumns = false
        grid1.FolderStyle = "../grid/styles/grand_gray"
        grid1.AllowFiltering = true

        AddHandler grid1.Rebind, AddressOf RebindGrid
        AddHandler grid1.InsertCommand, AddressOf InsertRecord
        AddHandler grid1.DeleteCommand, AddressOf DeleteRecord
        AddHandler grid1.UpdateCommand, AddressOf UpdateRecord

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = true
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "100"

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
        oCol6.AllowEdit = true
        oCol6.HeaderText = "EDIT"
        oCol6.Width = "125"
        oCol6.AllowDelete = true

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    
        if not(Page.IsPostBack) Then
        
            CreateGrid()
        End If
    End Sub

    Sub CreateGrid()
    
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn)
        myConn.Open()

        Dim da As OleDbDataAdapter = New OleDbDataAdapter()
        Dim ds As DataSet = New DataSet()
        da.SelectCommand = myComm
        da.Fill(ds, "Orders")


        grid1.DataSource = ds.Tables(0)
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
    
        CreateGrid()
    End Sub
</script>


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
        .ob_MHcell
        {
            color: #FFFFFF;
            cursor: pointer;
            font-family: Verdana;
            font-size: 13px;
            font-weight: bold;
            height: 20px;
            padding-bottom: 3px;
        }
        .ob_MHTCell
        {
            border-color: -moz-use-text-color transparent -moz-use-text-color #CCCCD3;
            border-right:solid 1px #CCCCD3;
            padding-right: 0;
        }
        .ob_MHTbl
        {
            background-image:url(styles/grand_gray/header_without_grouping.gif);
            background-color:#C4C6D1;          
            background-repeat: repeat-x;
            border-left: 0px solid transparent;
            border-right: 0px solid transparent;
        }
    </style>

    <script type="text/javascript">

        window.onload = function() {

            var newRow = new AddMultiColumnHeader("ob_gridMultiColumnHeader");

            newRow.AddCell("colum 1 & 2", 304, "#C4C6D1", "styles/grand_gray/header_without_grouping.gif");
            newRow.AddCell("column 3 & 4 & 5", 454, "#C4C6D1", "styles/grand_gray/header_without_grouping.gif");

        }



        function AddMultiColumnHeader(id) {

            this.ID = id;

            var hRow = createElement("div", "ob_gHContWG");

            var hRTbl = createTable("ob_MHTbl", null);
            hRTbl.id = this.ID;  
            hRow.appendChild(hRTbl);

            var hContainer = document.getElementById("grid1_ob_grid1HeaderContainer");
            hContainer.parentNode.insertBefore(hRow, hContainer);

            this.AddCell = function AddMColHCell(hContainer, hText, width, bgcolor, bgImage) {

                var headerRow = document.getElementById(this.ID);

                headerRow.style.cssText = "border-collapse: collapse;";

                var hTCell = createElement("td", "ob_MHTCell");
                var hTDCell = createElement("div", "ob_MHcell");

                hTDCell.appendChild(document.createTextNode(hText));

                hTCell.style.cssText = "width:" + width + "px; background-image:url(" + bgImage + ");background-color:" + bgcolor + ";";
                hTDCell.style.cssText = "text-align:center;";

                hTCell.appendChild(hTDCell);

                var hTRC = headerRow.firstChild.firstChild.lastChild;
                headerRow.firstChild.firstChild.insertBefore(hTCell, hTRC);

            }

        }

        function createTable(className, checkEmpty) {
            var tblHeader = createElement("table", className);
            tblHeader.setAttribute("cellspacing", "0");
            tblHeader.setAttribute("cellpadding", "0");
            tblHeader.setAttribute("border", "0");

            tblHeader.setAttribute("width", "100%");

            if (checkEmpty == null) {

                var tbdy = document.createElement("tbody");

                var tRow = createElement("tr","ob_gHR");
                tRow.appendChild(createElement("td","ob_gCH"));
                tbdy.appendChild(tRow);
                tblHeader.appendChild(tbdy);

            }

            return tblHeader;
        }


        function createElement(elm, className) {
            var newElem = document.createElement(elm);
            newElem.setAttribute((document.all ? 'className' : 'class'), className);
            return newElem;
        }
       	
    </script>

</head>
<body>
    <form id="Form1" runat="server">
    <br />
    <span class="tdText"><b>ASP.NET Grid - Multiple header rows</b></span>
    <br />
    <br />
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		
    <br />
    <br />
    <br />
    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
    </form>
</body>
</html>
