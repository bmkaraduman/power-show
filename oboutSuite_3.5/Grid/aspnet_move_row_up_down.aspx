<%@ Page language="c#" Inherits="OboutInc.oboutAJAXPage" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">	
	void Page_load(object sender, EventArgs e)
	{		
		if (!Page.IsPostBack)
		{
			CreateGrid();			
		}
	}
	
	void CreateGrid()
	{
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/MoveOrder.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders_2 ORDER BY RowPosition ASC", myConn);
		myConn.Open();
		/*OleDbDataAdapter da = new OleDbDataAdapter();
		DataSet ds = new DataSet();
		da.SelectCommand = myComm;
		da.Fill(ds, "Orders");*/
		OleDbDataReader myReader = myComm.ExecuteReader();


		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}	
		
	void DeleteRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/MoveOrder.mdb"));
		myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Orders_2 WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];
		
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void UpdateRecord(object sender, GridRecordEventArgs e)
	{
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/MoveOrder.mdb"));
		myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders_2 SET ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry, OrderDate=@OrderDate WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@OrderDate", OleDbType.VarChar).Value = e.Record["OrderDate"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];
		
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void InsertRecord(object sender, GridRecordEventArgs e)
	{
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/MoveOrder.mdb"));
		myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders_2 (ShipName, ShipCity, ShipPostalCode, ShipCountry, OrderDate) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry, @OrderDate)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@OrderDate", OleDbType.VarChar).Value = e.Record["OrderDate"];
		
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
/*
   public int saveRowPosition(string downOrderID, string downPosition, string upOrderID, string upPosition )
    {
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders_2 SET RowPosition = @newPosition WHERE OrderID = @OrderID", myConn);
		
		myComm.Parameters.Add("@newPosition", OleDbType.Integer).Value = upPosition;
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = downOrderID;
		
		
        int ret = myComm.ExecuteNonQuery();
		if ( ret > 0 )
		{	
			OleDbCommand myComm2 = new OleDbCommand("UPDATE Orders_2 SET RowPosition = @newPosition WHERE OrderID = @OrderID", myConn);
			
			myComm2.Parameters.Add("@newPosition", OleDbType.Integer).Value = downPosition;
			myComm2.Parameters.Add("@OrderID", OleDbType.Integer).Value = upOrderID;
			
			ret = myComm2.ExecuteNonQuery();
		}
		myConn.Close();
		return ret;       
	}
*/
public int saveRowPosition( string records){
    int ret = 0;

    OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/MoveOrder.mdb"));
    myConn.Open();

    char[] sep = {'|'};
    string[] rows = records.Split(sep);
    

         
    for ( int i = 0; i < rows.Length-1; i++)
    {
        string row = rows[i];
        char[] sep2 = { ',' };
        string[] cells = row.Split(sep2);  
             
        OleDbCommand myComm = new OleDbCommand("UPDATE Orders_2 SET RowPosition = @newPosition WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@newPosition", OleDbType.Integer).Value = cells[1];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = cells[0];

        ret = myComm.ExecuteNonQuery();
        if (ret <= 0) return 0;
    }
    return ret ;
  }
	void RebindGrid(object sender, EventArgs e)
	{
		CreateGrid();
	}
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
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			 FolderStyle="styles/black_glass" AllowMultiRecordSelection="false" GenerateRecordIds="true" OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord" >
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="125" runat="server"/>				
				<obout:Column DataField="RowPosition" Visible="false" runat="server"/>
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="125" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="125" runat="server" />
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="125" runat="server" />
				<obout:Column DataField="OrderDate" HeaderText="ORDER DATE" Width="125" runat="server" />
				<obout:Column HeaderText="EDIT" AllowEdit="true" AllowDelete="true" Width="125" runat="server" />
			</Columns>					
		</obout:Grid>
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
<script type="text/javascript">
	grid1.selectRecord("0");
</script>