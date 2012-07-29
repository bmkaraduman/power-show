<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.Odbc" %>
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
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Orders ORDER BY OrderID ASC", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();
		/*OleDbDataAdapter da = new OleDbDataAdapter();
		DataSet ds = new DataSet();
		da.SelectCommand = myComm;
		da.Fill(ds, "Orders");*/
		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}

	void DeleteRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();
        
		OleDbCommand myComm = new OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];
        
		myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void UpdateRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();        		

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];        
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];
        
        myComm.ExecuteNonQuery();
		myConn.Close();

        // setting select record.
        Hashtable oRecord = new Hashtable();
        oRecord.Add("OrderID", e.Record["OrderID"].ToString());
        oRecord.Add("ShipName", e.Record["ShipName"].ToString());
        oRecord.Add("ShipCity", e.Record["ShipCity"].ToString());
        oRecord.Add("ShipCountry", e.Record["ShipCountry"].ToString());

        grid1.SelectedRecords = new ArrayList();
        grid1.SelectedRecords.Add(oRecord);
                
	}
	void InsertRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();
		        

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipCountry)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];        
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        
        myComm.ExecuteNonQuery();
		myConn.Close();

        
        // getting the new order ID and count the records.
        int newOrderID = -1;
        int recordsCount = 0;
        
        OdbcConnection myConn2 = new OdbcConnection( "Driver={Microsoft Access Driver (*.mdb)};DBQ="+ Server.MapPath("../App_Data/Northwind.mdb"));
        myConn2.Open();
        OdbcCommand oCommand = new OdbcCommand("SELECT Max(OrderID), Count(OrderID) FROM Orders");        
        oCommand.Connection = myConn2;
        
        OdbcDataReader oReader = oCommand.ExecuteReader();
        if (oReader.Read())
        {
            if (oReader.GetValue(0).ToString() != System.String.Empty )
            {
                newOrderID = oReader.GetInt32(0);
                recordsCount = oReader.GetInt32(1);
            }
        }
        //move to last page.
        grid1.CurrentPageIndex = recordsCount  / grid1.PageSize;
        
        if ( newOrderID >= 0 ) {
            Hashtable oRecord = new Hashtable();
            oRecord.Add("OrderID", newOrderID + "" );
            oRecord.Add("ShipName", e.Record["ShipName"].ToString());
            oRecord.Add("ShipCity", e.Record["ShipCity"].ToString());
            oRecord.Add("ShipCountry", e.Record["ShipCountry"].ToString());

            grid1.SelectedRecords = new ArrayList();
            grid1.SelectedRecords.Add(oRecord);
            CreateGrid();
        }
        myConn2.Close();
	}
	void RebindGrid(object sender, EventArgs e)
	{
		CreateGrid();
	}
	</script>
<html>
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
		<script language="javascript">	
	        // Client-Side Events for Insert
	        function OnBeforeInsert(record) {
		        deselectAllRecords();
		        return true;
	        }			
	        function OnBeforeUpdate(record) {
                deselectAllRecords();
		        return true;
	        }	
	        
  	        function deselectAllRecords() {
                //var count = parseInt ( document.getElementById('ob_grid1PageSizeSelector').value );

            	var selectArr = document.getElementsByTagName("select");

			    for (i=0; i< selectArr.length; i++){
				    if ( selectArr[i].id  && selectArr[i].id.indexOf("PageSizeSelector")>= 0 ){
					    var count = parseInt ( selectArr[i].value );
                        for (j=0;j< count; j++){
                            grid1.deselectRecord(j);
                        }

					    break;

				    }
			    }


            }
	        	
		</script>
	</head>
	<body>		
		<form runat="server">
		
		<br />
		<span class="tdText"><b>ASP.NET Grid - Navigating to the inserted/updated record</b></span>
		<br /><br />
		
		
		<obout:Grid id="grid1" runat="server" CallbackMode="false" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" OnRebind="RebindGrid"
			OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
            
            <ClientSideEvents
			    OnBeforeClientUpdate="OnBeforeUpdate" OnBeforeClientInsert="OnBeforeInsert"/>			
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="220" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="170" runat="server" />				
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="170" runat="server" />
				<obout:Column HeaderText="EDIT" AllowEdit="true" AllowDelete="true" Width="170" runat="server" />
			</Columns>				
		</obout:Grid>		
		<br /><br /><br />
		<span class="tdText">
		   After a record is inserted/updated, the Grid will automatically navigate to the<br>
		   correct page where the record is located and select the record.</span>		
		<br /><br /><br />
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>


