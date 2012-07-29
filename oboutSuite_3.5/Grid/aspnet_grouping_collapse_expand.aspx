<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
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
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Expand / Collapse Groups</b></span>
		<br /><br />
				
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			 FolderStyle="styles/grand_gray" AllowGrouping="true" ShowMultiPageGroupsInfo="true" AllowAddingRecords="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord" ShowCollapsedGroups="true" 
			GroupBy="ShipCountry,ShipCity,ShipName">
			<Columns>
				<obout:Column ID="Column1" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
			    <obout:Column ID="Column2" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column ID="Column3" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column ID="Column4" DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>
				<obout:Column HeaderText="EDIT" AllowEdit="true" AllowDelete="true" Width="125" runat="server" />
			</Columns>					
		</obout:Grid>
	<br />
		<table border="0">
			<tr>
				<td align="center"><input class="tdText" value="Collapse all groups" onclick="gridExpandCollapseLevel(null, false)" id="btnCollapseLevel1" type="button"></td>
				<td align="center"><input class="tdText" value="Collapse level 1" onclick="gridExpandCollapseLevel(1, false)" id="btnCollapseLevel1" type="button"></td>
				<td align="center"><input class="tdText" value="Collapse level 2" onclick="gridExpandCollapseLevel(2, false)" id="btnCollapseLevel2" type="button"></td>
				<td align="center"><input class="tdText" value="Collapse level 3" onclick="gridExpandCollapseLevel(3, false)" id="btnCollapseLevel3" type="button"></td>
			</tr>		    
			<tr>
				<td align="center"><input class="tdText" value="Expand all groups  " onclick="gridExpandCollapseLevel(null, true)" id="btnExpandLevel1" type="button"></td>
				<td align="center"><input class="tdText" value="Expand level 1" onclick="gridExpandCollapseLevel(1, true)" id="btnExpandLevel1" type="button"></td>
				<td align="center"><input class="tdText" value="Expand level 2" onclick="gridExpandCollapseLevel(2, true)" id="btnExpandLevel2" type="button"></td>
				<td align="center"><input class="tdText" value="Expand level 3" onclick="gridExpandCollapseLevel(3, true)" id="btnExpandLevel3" type="button"></td>
			</tr>
		</table>		
		
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
<script language="javascript">
    function gridExpandCollapseLevel(level, isExpand) {
        if (level != null) {
            level = level - 1;
        }
        var tdArr = document.getElementsByTagName("DIV");
        var groupClassNamePrefix = "ob_gRGHB";

        for (i = 0; i < tdArr.length; i++) {
            var td = tdArr[i];
            if (td.className == groupClassNamePrefix) {
                var img = tdArr[i].firstChild;

                var tempLevel = tdArr[i].parentNode.childNodes.length - 3;
                if (level == null || tempLevel == level) {
                    gridExpandCollapseGroup(img, isExpand);
                }
            }
        }
    }
    function gridExpandCollapseGroup(img, isExpand) {
        if ((isExpand && img.src.indexOf("group_btn_open.gif") >= 0)
        || (!isExpand && img.src.indexOf("group_btn_close.gif") >= 0)) {
            grid1.manageGroupExpandCollapse(img, false);
        }
    }
</script>
		
	</body>
</html>