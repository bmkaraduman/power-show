<%@ Page Language="C#" EnableViewState="true"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
	void Page_load(object sender, EventArgs e) {
		if (!Page.IsPostBack) {
			CreateGrid();			
		}
	}
	
	void CreateGrid() {
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 Orders.*, OrderID as EMOrderID FROM Orders", myConn);
		myConn.Open();
		OleDbDataReader myReader = myComm.ExecuteReader();
		
		grid1.DataSource = myReader;
		grid1.DataBind();
		
		myReader.Close();

		myConn.Close();

        EasyMenu1.AttachTo = "";  
		      
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
    }
    void RebindGrid(object sender, EventArgs e)
    {
        CreateGrid();
    }
	</script>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
    <head>
        <style type="text/css">
            .tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;
				background-color___:#f6f9fc;
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
	        function sendEmail(OrderID) {
                var oRecord = document.getElementById(OrderID);
                var sName = oRecord.childNodes[1].firstChild.innerHTML;	    
		        alert('Sending e-mail to ' + sName);
            }

	        function orderInformation(OrderID) {
	            var oRecord = document.getElementById(OrderID);
                var sName = oRecord.childNodes[1].firstChild.innerHTML;	    
		        alert('Order Information for ' + sName);
	        }
        	
	        function orderDate(OrderID) {
	            var oRecord = document.getElementById(OrderID);
                var sName = oRecord.childNodes[1].firstChild.innerHTML;	    
		        alert('Order Date for ' + sName);
	        }
        	
	        function attachMenuToRecords() {
	            // get a list with all the ids of the records	  
                var sRecordsIds = grid1.getRecordsIds();          
                var arrRecordsIds = sRecordsIds.split(",");                                        
                
                for(var i=0; i<arrRecordsIds.length; i++) {         
                    ob_em_EasyMenu1.detachFromControl(arrRecordsIds[i]);
                    ob_em_EasyMenu1.attachToControl(arrRecordsIds[i]);
                }     
	        }
        </script>
    </head>
	<body>
		<form runat="server">
			
			<span class="tdText">
			Right-click on the Order ID item inside the grid.<br />
			Context Easy Menu will pop-up.
			</span>
			
			<br /><br />
			
			<obout:Grid id="grid1" runat="server" CallbackMode="true" GenerateRecordIds="true"
			AllowColumnResizing="true" ShowHeader="true" PageSize="10" ShowFooter="true" AllowMultiRecordSelection="false"
			FolderStyle="styles/premiere_blue" AutoGenerateColumns="false" AllowFiltering="true"
			OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord" OnInsertCommand="InsertRecord" OnRebind="RebindGrid">
			<ClientSideEvents OnClientCallback="attachMenuToRecords" />
			<Columns>
				<obout:Column ID="Column1" DataField="OrderID" HeaderText="Order ID" Width="125" runat="server" />
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="Name" Width="250" runat="server"/>				
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="City" Width="175" runat="server" />				
				<obout:Column ID="Column4" DataField="ShipCountry" HeaderText="Country" Width="175" runat="server" />
				<obout:Column ID="Column5" DataField="" HeaderText="EDIT" Width="175" AllowEdit="true" AllowDelete="true" runat="server" />
			</Columns>
		</obout:Grid>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>		
	</body>
</html>

<oem:easymenu id="EasyMenu1" ShowEvent="ContextMenu" runat="server" StyleFolder="../EasyMenu/styles/windowsxp"
	Width="200" UseIcons="true" IconsPosition="Left" Align="Under">
	<Components>	    
		<oem:MenuItem id="menuItem2" OnClientClick="
			try 
			{
				sendEmail(targetEl.id);
			} 
			catch (e) {}
			"
            InnerHtml="Send Email"></oem:MenuItem>
		<oem:MenuItem id="menuItem3" OnClientClick="
			try 
			{
				orderInformation(targetEl.id);
			} 
			catch (e) {}
			"
            InnerHtml="Order Information"></oem:MenuItem>
		<oem:MenuItem id="menuItem4" OnClientClick="
			try 
			{
				orderDate(targetEl.id);
			} 
			catch (e) {}
			"
            InnerHtml="Order Date"></oem:MenuItem>
	</Components>
</oem:easymenu>
<script type="text/javascript"> 
    // attach the menu to the records of the Grid       
    attachMenuToRecords();
</script>