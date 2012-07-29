<%@ Page language="VB" Inherits="OboutInc.oboutAJAXPage" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
      
        grid1.ID = "grid1"
        grid1.CallbackMode = true
        grid1.Serialize = true
        grid1.AutoGenerateColumns = false
        grid1.FolderStyle = "../Grid/styles/black_glass"
        grid1.AllowMultiRecordSelection = false
        grid1.GenerateRecordIds = true
        AddHandler grid1.Rebind, AddressOf RebindGrid
        AddHandler grid1.InsertCommand, AddressOf InsertRecord
        AddHandler grid1.UpdateCommand, AddressOf UpdateRecord

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.Visible = false
        oCol1.ReadOnly = true
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "100"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "125"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "RowPosition"
        oCol3.Visible = false

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipCity"
        oCol4.HeaderText = "CITY"
        oCol4.Width = "125"
        
        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipPostalCode"
        oCol5.HeaderText = "POSTAL CODE"
        oCol5.Width = "125"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = "ShipCountry"
        oCol6.HeaderText = "COUNTRY"
        oCol6.Width = "125"

        Dim oCol7 As Column = New Column()
        oCol7.DataField = "OrderDate"
        oCol7.HeaderText = "ORDER DATE"
        oCol7.Width = "125"

        Dim oCol8 As Column = New Column()
        oCol8.AllowEdit = True
        oCol8.HeaderText = "EDIT"
        oCol8.Width = "125"
        oCol8.AllowDelete = True

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)
        grid1.Columns.Add(oCol7)
        grid1.Columns.Add(oCol8)


        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
        
        If Not (Page.IsPostBack) Then
		
            CreateGrid()
        End If
        
    End Sub
    

    Sub CreateGrid()
	
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/MoveOrder.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 * FROM Orders_2 ORDER BY RowPosition ASC", myConn)
        myConn.Open()
        'OleDbDataAdapter da = new OleDbDataAdapter();
        'DataSet ds = new DataSet();
        'da.SelectCommand = myComm;
        'da.Fill(ds, "Orders");*/
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()


        grid1.DataSource = myReader
        grid1.DataBind()

        myConn.Close()
    End Sub
    
		
    Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
	
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/MoveOrder.mdb"))
        myConn.Open()

        Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Orders_2 WHERE OrderID = @OrderID", myConn)

        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")
		
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
    
    Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
	
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/MoveOrder.mdb"))
        myConn.Open()

        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders_2 SET ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry, OrderDate=@OrderDate WHERE OrderID = @OrderID", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@OrderDate", OleDbType.VarChar).Value = e.Record("OrderDate")
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")
		
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
    
    Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
	
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/MoveOrder.mdb"))
        myConn.Open()

        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Orders_2 (ShipName, ShipCity, ShipPostalCode, ShipCountry, OrderDate) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry, @OrderDate)", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@OrderDate", OleDbType.VarChar).Value = e.Record("OrderDate")
		
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
    

    'public int saveRowPosition(string downOrderID, string downPosition, string upOrderID, string upPosition )
    '{
    'OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
    'myConn.Open();

    ' OleDbCommand myComm = new OleDbCommand("UPDATE Orders_2 SET RowPosition = @newPosition WHERE OrderID = @OrderID", myConn);
		
    'myComm.Parameters.Add("@newPosition", OleDbType.Integer).Value = upPosition;
    'myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = downOrderID;
		
		
    ' int ret = myComm.ExecuteNonQuery();
    'If (ret > 0) Then
    '{	
    'OleDbCommand myComm2 = new OleDbCommand("UPDATE Orders_2 SET RowPosition = @newPosition WHERE OrderID = @OrderID", myConn);
			
    'myComm2.Parameters.Add("@newPosition", OleDbType.Integer).Value = downPosition;
    'myComm2.Parameters.Add("@OrderID", OleDbType.Integer).Value = upOrderID;
			
    'ret = myComm2.ExecuteNonQuery();
    '}
    'myConn.Close();
    'return ret;       
    '}

    Function saveRowPosition(ByVal records As String) As Integer
        Dim ret As Integer = 0

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/MoveOrder.mdb"))
        myConn.Open()

        Dim sep As Char() = {"|"}
        Dim rows As String() = records.Split(sep)
        
        For i As Integer = 0 To i < rows.Length - 1
    
            Dim row As String = rows(i)
            Dim sep2 As Char() = {","}
            Dim cells As String() = row.Split(sep2)
             
            Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders_2 SET RowPosition = @newPosition WHERE OrderID = @OrderID", myConn)

            myComm.Parameters.Add("@newPosition", OleDbType.Integer).Value = cells(1)
            myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = cells(0)

            ret = myComm.ExecuteNonQuery()
            If (ret <= 0) Then Return 0
            
        Next
        Return ret
    End Function
    
    Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
	
        CreateGrid()
    End Sub
    
	</script>

<html>
	<head runat="server">
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
		<script type="text/javascript">

		var rowPrefix;

		// find out the row Prefix 
		function getRowPrefix()
		{
			var row0 = grid1.getRecordsIds().split(",")[0];
			
			if ( row0 != null)
			{
				var lastPos = -1;
				for ( var i = row0.length-1; i>=0; i--)
				{
					if ( row0.charAt(i)== '_' )
					{
						lastPos = i;
						break;
					}
				}

				if (lastPos > -1)
				{
					// get Prefix
					return row0.substring(0,lastPos + 1);
				}
			}

			

			return "";
		}


		function moveRowUp() {
			if ( rowPrefix == null)
			{
				rowPrefix = getRowPrefix();
			}

			var index = null;

			if ( grid1.SelectedRecords[0] == null ) {
				alert("Please select a record.");
				return;
			}
			for(var i=0; i<grid1.Rows.length; i++) {
				if(grid1.Rows[i].Cells[0].Value == grid1.SelectedRecords[0].OrderID) {
					index = i;
					break;
				}
			}

		    if( index != null) {
				var rowMove = document.getElementById(rowPrefix + index );
				var rowPre = rowMove.previousSibling;
				if ( rowMove != null && rowPre != null)
				{
					rowMove.parentNode.insertBefore( rowMove, rowPre);
			
					swap( rowPre, rowMove, index, index - 1 );
				}
				
		    }
		}

		function moveRowDown() {
			if ( rowPrefix == null)
			{
				rowPrefix = getRowPrefix();
			}
			var index = null;

			if ( grid1.SelectedRecords[0] == null ) {
				alert("Please select a record.");
				return;
			}
			for(var i=0; i<grid1.Rows.length; i++) {
				if(grid1.Rows[i].Cells[0].Value == grid1.SelectedRecords[0].OrderID) {
					index = i;
					break;
				}
			}

		    if( index != null) {
				var rowMove = document.getElementById(rowPrefix + index );
				var rowNext = rowMove.nextSibling;
				if ( rowMove != null && rowNext != null)
				{
					rowMove.parentNode.insertBefore( rowNext, rowMove);
			
					swap( rowNext, rowMove, index, index + 1 );
				}
				
		    }
		}
		
		function swap( row1, row2, idx1, idx2){
			// swap Edit & Delete Link
			var div1 = row1.lastChild.firstChild;
			var div2 = row2.lastChild.firstChild;
			
			var edit1 = div1.firstChild;
			var delete1 = div1.lastChild;

			var edit2 = div2.firstChild;
			var delete2 = div2.lastChild;

			var tmp = edit1.onclick;
			edit1.onclick = edit2.onclick;
			edit2.onclick = tmp;

			tmp = delete1.onclick;
			delete1.onclick = delete2.onclick;
			delete2.onclick = tmp;

			// swap row ID
			tmp = row1.id;
			row1.id = row2.id;
			row2.id = tmp;

			// swap grid data;
			tmp = grid1.Rows[idx1];
			grid1.Rows[idx1] = grid1.Rows[idx2];
			grid1.Rows[idx2] = tmp;

			//swap grid row position
			tmp = grid1.Rows[idx1].Cells[2].Value ;
			grid1.Rows[idx1].Cells[2].Value  = grid1.Rows[idx2].Cells[2].Value ;
			grid1.Rows[idx2].Cells[2].Value  = tmp;


		}
		function updateGrid(gridRows){  
			//update to DB
			var records = "";
			for (var i =0; i< gridRows.length; i++){
			    records += gridRows[i].Cells[0].Value + "," + gridRows[i].Cells[2].Value + "|";
			}
			
			ob_post.AddParam("records", records);
			ob_post.post(null, "saveRowPosition", handlingUpdate);
		}
		
		function handlingUpdate(effectedRecords){
			if (effectedRecords > 0)
			{
				alert('The new row position was saved into the database.');
				//. In a real application, the database will be updated. ');
			}else{
				alert('DB error ! The new row position was not saved into the database.');
			}

		}
		</script>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Move a Record up/down on the Client-Side</b></span>
		<br /><br />
		<span class="tdText">
		    <input type="button" onclick="moveRowUp()" value="Move up" class="tdText" />
		    <input type="button" onclick="moveRowDown()" value="Move down" class="tdText" />
		    <input type="button" onclick="updateGrid( grid1.Rows);" value="Save the row position to database" class="tdText" />
		</span>
		<br /><br />
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>			
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
<script type="text/javascript">
	grid1.selectRecord("0");
</script>