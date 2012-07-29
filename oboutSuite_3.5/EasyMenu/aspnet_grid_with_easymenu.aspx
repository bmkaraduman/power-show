<%@ Page Language="C#" Debug="true" EnableViewState="true"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
        OleDbCommand myComm = new OleDbCommand("DELETE FROM Orders WHERE OrderID = " + e.Record["OrderID"].ToString(), myConn);
        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();
        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName='" + e.Record["ShipName"].ToString().Replace("'", "''") + "', ShipCity='" + e.Record["ShipCity"].ToString().Replace("'", "''") + "', ShipCountry='" + e.Record["ShipCountry"].ToString().Replace("'", "''") + "' WHERE OrderID = " + e.Record["OrderID"].ToString(), myConn);
        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();
        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipCountry) VALUES('" + e.Record["ShipName"].ToString().Replace("'", "''") + "', '" + e.Record["ShipCity"].ToString().Replace("'", "''") + "', '" + e.Record["ShipCountry"].ToString().Replace("'", "''") + "')", myConn);
        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void RebindGrid(object sender, EventArgs e)
    {
        CreateGrid();
    }
	</script>
	
<script type="text/javascript">
	function sendEmail() {
		var emails = "";
		for(var i=0; i<grid1.SelectedRecords.length;i++) {
			var record = grid1.SelectedRecords[i];
			emails += record.ShipName + ", "
		}

		if (emails == "")
			alert('Select records first.');
		else
			alert('Sending e-mail to ' + emails.substr(0, emails.length - 2) + '.');
    }

	function orderInformation() {
		var emails = "";
		for(var i=0; i<grid1.SelectedRecords.length;i++) {
			var record = grid1.SelectedRecords[i];
			emails += record.ShipName + ", "
		}

		if (emails == "")
			alert('Select records first.');
		else
			alert('Order Information for ' + emails.substr(0, emails.length - 2) + '.');
	}
	
	function orderDate() {
		var emails = "";
		for(var i=0; i<grid1.SelectedRecords.length;i++) {
			var record = grid1.SelectedRecords[i];
			emails += record.ShipName + ", "
		}

		if (emails == "")
			alert('Select records first.');
		else
			alert('Order Date for ' + emails.substr(0, emails.length - 2) + '.');
	}
	
	function attachMenuToRecords() {
	
		var gridContainerID = "<%=grid1.ClientID%>_ob_grid1MainContainer";
		
		// attach menu to grid container
	    ob_em_EasyMenu1.attachToControl(gridContainerID);
		
		// hide menu on clicking the grid container
		document.getElementById(gridContainerID).onclick = function()
		{
			ob_em_EasyMenu1.hideMenu();
		}
		
		gridIds = grid1.getRecordsIds().split(",");
		for (index=0;index<gridIds.length;index++)
		{
			var rowId = gridIds[index];
			
			// attach menu to each grid row
			ob_em_EasyMenu1.attachToControl(rowId);
			
			var rowCells = document.getElementById(rowId).childNodes;
			for (elIndex=0;elIndex<rowCells.length;elIndex++)
			{
				// stop the event propagation when click on grid cells to avoid rows unselection
				rowCells[elIndex].onmousedown = function(e)
				{
					var event = e || window.event; 
					
					// stop event propagation on right mouse click
					if (event.button == 2)
					{
						if (event.stopPropagation) { event.stopPropagation(); } else { event.cancelBubble = true; } 
					}
				}
			}
		}
	}
</script>
<html>	
    <head>
	    <title>obout ASP.NET Easy Menu examples</title>
    	   
	    <!--// Only needed for this page's formatting //-->
	    <style type="text/css">
            .tdText {
				        font:11px Verdana;
				        color:#333333;
			        }
	    </style>
    </head>
	<body>
		<form runat="server">
		    <span class="tdText"><b>ASP.NET Easy Menu - With ASP.NET Grid</b></span>
		    <br /><br /><br />
			<obout:Grid id="grid1" runat="server" CallbackMode="true" GenerateRecordIds="true" AllowAddingRecords="false" 
				AllowColumnResizing="true" ShowHeader="true" PageSize="10" ShowFooter="true" AllowMultiRecordSelection="true"
				AutoGenerateColumns="false">
				<ClientSideEvents OnClientCallback="attachMenuToRecords"/>
				<Columns>
					<obout:Column DataField="OrderID" HeaderText="Order ID" Width="100" runat="server" />
					<obout:Column DataField="ShipName" HeaderText="Name" Width="350" runat="server"/>				
					<obout:Column DataField="ShipCity" HeaderText="City" Width="115" runat="server" />				
					<obout:Column DataField="ShipCountry" HeaderText="Country" Width="115" runat="server" />
				</Columns>
			</obout:Grid>		
		    <br /><br /><br />
		
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	
        </form>
    </body>
</html>

<oem:easymenu id="EasyMenu1" ShowEvent="ContextMenu" runat="server" StyleFolder="styles/windowsxp" 
	Width="200" UseIcons="true" IconsPosition="Left" Align="Cursor" ZIndex="100">
	<Components>	    
		<oem:MenuItem id="menuItem2" OnClientClick="sendEmail();"
            InnerHtml="Send Email"></oem:MenuItem>
		<oem:MenuItem id="menuItem3" OnClientClick="orderInformation();"
            InnerHtml="Order Information"></oem:MenuItem>
		<oem:MenuItem id="menuItem4" OnClientClick="orderDate();"
            InnerHtml="Order Date"></oem:MenuItem>
	</Components>
</oem:easymenu>
<script type="text/javascript"> 
    // attach the menu to the records of the Grid       
    attachMenuToRecords();
</script>