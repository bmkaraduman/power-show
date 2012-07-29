<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
	Grid grid1 = new Grid();
	
	void Page_load(object sender, EventArgs e)		
	{
		grid1.ID = "grid1";		
		grid1.CallbackMode = true;				
		grid1.Serialize = true;
		grid1.AutoGenerateColumns = false;
		
        grid1.FolderStyle = "styles/premiere_blue";
        grid1.AllowFiltering = false;

        grid1.ClientSideEvents.OnClientPopulateControls = "setDefaultValues";

		// setting the event handlers
		grid1.InsertCommand += new Obout.Grid.Grid.EventHandler(InsertRecord);
		grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
		grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
		grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);

        
        
		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "OrderID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "ORDER ID";
		oCol1.Width = "100";
		
		Column oCol2 = new Column();
		oCol2.DataField = "ShipName";		
		oCol2.HeaderText = "NAME";
		oCol2.Width = "200";
		
		Column oCol3 = new Column();
		oCol3.DataField = "ShipCity";		
		oCol3.HeaderText = "CITY";
		oCol3.Width = "150";
		
		Column oCol4 = new Column();
		oCol4.DataField = "ShipPostalCode";		
		oCol4.HeaderText = "POSTAL CODE";
		oCol4.Width = "150";
											
		Column oCol5 = new Column();
		oCol5.DataField = "ShipCountry";		
		oCol5.HeaderText = "COUNTRY";
		oCol5.Width = "150";

		Column oCol6 = new Column();		
		oCol6.HeaderText = "EDIT";
		oCol6.Width = "125";
        oCol6.AllowEdit = true;
        oCol6.AllowDelete = true;

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		grid1.Columns.Add(oCol5);
		grid1.Columns.Add(oCol6);
		
		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
		
		if (!Page.IsPostBack)
		{
			BindGrid();

            // initializing the SelectedRecords collection
            grid1.SelectedRecords = new ArrayList();

            // creating some records that will be selected
            Hashtable oRecord = new Hashtable();
            oRecord.Add("OrderID", "11074");
            oRecord.Add("ShipName", "Simons bistro");
            oRecord.Add("ShipCity", "Kbenhavn");
            oRecord.Add("ShipPostalCode", "17341");
            oRecord.Add("ShipCountry", "Denmark");

            // adding the records to the SelectedRecords collection
            grid1.SelectedRecords.Add(oRecord);
		}		
	}
    
	void BindGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn);
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

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipPostalCode, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
	void RebindGrid(object sender, EventArgs e)
	{
		BindGrid();
	}
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
		<script type="text/javascript">
		function showDefaultValuesForm(bType) {
            if(bType == true) {
                var oDiv = document.getElementById("divDefaultValues");
                oDiv.style.display = "";
            } else {
                var oDiv = document.getElementById("divDefaultValues");
                oDiv.style.display = "none";
            }
        }
        
        function setDefaultValues(record, type) {
            if(type == "add") {
                // default values for add
                var oType = document.getElementById("btnDefaultValuesType1");
                if(oType.checked == true) {
                    if(grid1.SelectedRecords.length > 0) {
	                    record.ShipName = grid1.SelectedRecords[0].ShipName;	                    
	                    record.ShipCity = grid1.SelectedRecords[0].ShipCity;
	                    record.ShipPostalCode = grid1.SelectedRecords[0].ShipPostalCode;
	                    record.ShipCountry = grid1.SelectedRecords[0].ShipCountry;
	                }
	            } else {
	                record.ShipName = document.getElementById("txtDefaultShipName").value;	                
	                record.ShipCity = document.getElementById("txtDefaultShipCity").value;
	                record.ShipPostalCode = document.getElementById("txtDefaultShipPostalCode").value;
	                record.ShipCountry = document.getElementById("txtDefaultShipCountry").value;
	            }
	        } else {
	            // apply changes to the values for the edit controls
	            
	        }	 
        }
		</script>
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Setting Default Values for Add/Edit using the OnClientPopulateControls client-side event</b></span>
		
		<br /><br />
		
		<span class="tdText">
		Default Values for the new records:<br />
		<input type="radio" name="btnDefaultValuesType" id="btnDefaultValuesType1" checked="checked" onclick="showDefaultValuesForm(false)" /> Get default values from the selected record<br />
		<input type="radio" name="btnDefaultValuesType" id="btnDefaultValuesType2" onclick="showDefaultValuesForm(true)" /> Specify the default values manually<br />
		<div id="divDefaultValues" class="tdText" style="display: none;">
		    <table>
		        <tr>
		            <td class="tdText">Ship Name:</td>
		            <td><input type="text" id="txtDefaultShipName" value="Default name" class="tdText" /></td>
		        </tr>
		        <tr>
		            <td class="tdText">Ship City:</td>
		            <td><input type="text" id="txtDefaultShipCity" value="Default city" class="tdText" /></td>
		        </tr>
		        <tr>
		            <td class="tdText">Ship Postal Code:</td>
		            <td><input type="text" id="txtDefaultShipPostalCode" value="Default postal code" class="tdText" /></td>
		        </tr>
		        <tr>
		            <td class="tdText">Ship Country:</td>
		            <td><input type="text" id="txtDefaultShipCountry" value="Default country" class="tdText" /></td>
		        </tr>
		    </table>		    
		</div>
		
		</span>
		
		<br /><br />
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />
		
		<span class="tdText">
		You can use the <b>OnClientPopulateControls</b> client-side event to modify the data inside the controls for add/edit.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>