<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">	
	void Page_load(object sender, EventArgs e)		
	{			
	    CreateGrid();			
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT * FROM Orders", myConn);
		myConn.Open();		
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

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipAddress=@ShipAddress, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record["ShipAddress"];
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

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipAddress, ShipCity, ShipPostalCode, ShipCountry) VALUES(@ShipName, @ShipAddress, @ShipCity, @ShipPostalCode, @ShipCountry)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record["ShipAddress"];
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
    <script type="text/javascript">
        
        function onAdd(record) {

            txtShipCity.enable();
            txtShipPostalCode.enable();

            return true;
        }


        function onEdit(record) {
            txtShipCity.disable();
            txtShipPostalCode.disable();

            return true;
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
		<span class="tdText"><b>ASP.NET Grid - Different Row Fields for Add/Edit</b></span>
		<br /><br />	
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="false" 
			AutoGenerateColumns="false" FolderStyle="styles/black_glass"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<ClientSideEvents OnClientAdd="onAdd" OnClientEdit="onEdit"  />
			<Columns>
				<obout:Column DataField="OrderID" Visible="true" Width="110" ReadOnly="true" HeaderText="ORDER ID" runat="server"/>
                <obout:Column DataField="ShipName" Visible="true" Width="170" HeaderText="NAME" runat="server"/>
                <obout:Column DataField="ShipAddress" Visible="true" Width="125" HeaderText="ADDRESS" runat="server"/>
                <obout:Column DataField="ShipCity"  Visible="true"   Width="130" HeaderText="CITY" runat="server">
                    <TemplateSettings EditTemplateID="TemplateEditShipCity"/>
                </obout:Column>
                <obout:Column DataField="ShipPostalCode" Visible="true"  Width="125" HeaderText="POSTAL CODE" runat="server">
                    <TemplateSettings EditTemplateID="TemplateEditShipPostalCode" />
                </obout:Column>
                <obout:Column DataField="ShipCountry" Visible="true" Width="125" HeaderText="COUNTRY" runat="server"/>               
                <obout:Column HeaderText="EDIT" Width="150" AllowEdit="true" AllowDelete="true" runat="server" />
			</Columns>	
			<Templates>
			    <obout:GridTemplate runat="server" ID="TemplateEditShipCity" ControlID="txtShipCity" ControlPropertyName="value">
			        <Template>
						  <obout:OboutTextBox runat="server" ID="txtShipCity" Width="100%" />
					</Template>
			    </obout:GridTemplate>
			    <obout:GridTemplate runat="server" ID="TemplateEditShipPostalCode" ControlID="txtShipPostalCode" ControlPropertyName="value">
			        <Template>
						  <obout:OboutTextBox runat="server" ID="txtShipPostalCode" Width="100%" />
					</Template>
			    </obout:GridTemplate>
			</Templates>		    	    
		</obout:Grid>
		<br />
		<span class="tdText">This example showcases the use of different edit field for in-line adding and editing.<br /><br />

    In add mode, ShipCity and ShipPostalCode are editable (enabled), but they are read only for edit mode (disabled).<br /> 
    This is achieved using the client-side events of the Grid ("OnClientAdd" and "OnClientEdit")
    along with the  <br />"enable" / "disable" client-side methods of the OboutTextBox control.
</span>
<br /><br /><br />
	
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>

		
