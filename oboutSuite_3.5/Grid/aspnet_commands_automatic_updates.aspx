<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
		
        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry, Sent=@Sent WHERE OrderID = @OrderID", myConn);
                
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = e.Record["Sent"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];
        
        myComm.ExecuteNonQuery();
        myConn.Close();
	}
	void InsertRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipPostalCode, ShipCountry, Sent) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry, @Sent)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = e.Record["Sent"];
        
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
		<script type="text/javascript">
		    function updateCountry(sCountry, iRowIndex) {
		        var oRecord = new Object();
		        
		        oRecord.OrderID = grid1.Rows[iRowIndex].Cells[0].Value;
		        oRecord.ShipName = grid1.Rows[iRowIndex].Cells[1].Value;
		        oRecord.ShipCity = grid1.Rows[iRowIndex].Cells[2].Value;
		        oRecord.ShipPostalCode = grid1.Rows[iRowIndex].Cells[3].Value;
		        oRecord.ShipCountry = sCountry;
		        oRecord.Sent = grid1.Rows[iRowIndex].Cells[5].Value;
		        
		        grid1.executeUpdate(oRecord);
		    }
		    
		    function updateSent(bSent, iRowIndex) {
		        var oRecord = new Object();
		        
		        oRecord.OrderID = grid1.Rows[iRowIndex].Cells[0].Value;
		        oRecord.ShipName = grid1.Rows[iRowIndex].Cells[1].Value;
		        oRecord.ShipCity = grid1.Rows[iRowIndex].Cells[2].Value;
		        oRecord.ShipPostalCode = grid1.Rows[iRowIndex].Cells[3].Value;
		        oRecord.ShipCountry = grid1.Rows[iRowIndex].Cells[4].Value;
		        oRecord.Sent = bSent;
		        
		        grid1.executeUpdate(oRecord);
		    }
		</script>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Automatic Updates</b></span>
		
		<br /><br />
		
		<span class="tdText">
		    Change the countries using the drop-down lists, check/uncheck the "SENT" checkboxes - <br />
		    the changes will be updated automatically in the database, without pressing any link/button.
		</span>
			
		<br /><br />
				
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/grand_gray" AllowAddingRecords="false" AllowRecordSelection="false" ShowLoadingMessage="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server">
				    <TemplateSettings TemplateId="tplCountry" />
				</obout:Column>
				<obout:Column DataField="Sent" HeaderText="SENT" Width="100" runat="server">
				    <TemplateSettings TemplateId="tplSent" />
				</obout:Column>
			</Columns>
			<Templates>
			    <obout:GridTemplate runat="server" ID="tplCountry">
			        <Template>
			            <select class="ob_gEC" onchange="updateCountry(this.value, <%# Container.PageRecordIndex %>)">
			                <option value=""></option>			                 
			                <option value="Argentina" <%# Container.Value == "Argentina" ? "selected='selected'" : "" %>>Argentina</option>
			                <option value="Austria" <%# Container.Value == "Austria" ? "selected='selected'" : "" %>>Austria</option>		                 
			                <option value="Brazil" <%# Container.Value == "Brazil" ? "selected='selected'" : "" %>>Brazil</option>
			                <option value="Denmark" <%# Container.Value == "Denmark" ? "selected='selected'" : "" %>>Denmark</option>
			                <option value="France" <%# Container.Value == "France" ? "selected='selected'" : "" %>>France</option>			                 
			                <option value="Germany" <%# Container.Value == "Germany" ? "selected='selected'" : "" %>>Germany</option>
			                <option value="Ireland" <%# Container.Value == "Ireland" ? "selected='selected'" : "" %>>Ireland</option>
			                <option value="Italy" <%# Container.Value == "Italy" ? "selected='selected'" : "" %>>Italy</option>
			                <option value="Mexico" <%# Container.Value == "Mexico" ? "selected='selected'" : "" %>>Mexico</option>
			                <option value="Switzerland" <%# Container.Value == "Switzerland" ? "selected='selected'" : "" %>>Switzerland</option>
                            <option value="UK" <%# Container.Value == "UK" ? "selected='selected'" : "" %>>UK</option>
			                <option value="USA" <%# Container.Value == "USA" ? "selected='selected'" : "" %>>USA</option>
			                <option value="Venezuela" <%# Container.Value == "Venezuela" ? "selected='selected'" : "" %>>Venezuela</option>
			            </select>
			        </Template>
			    </obout:GridTemplate>
			    <obout:GridTemplate runat="server" ID="tplSent">
			        <Template>
			            <input type="checkbox" onclick="updateSent(this.checked, <%# Container.PageRecordIndex %>)" <%# Container.Value == "True" ? "checked='checked'" : "" %> />
			        </Template>
			    </obout:GridTemplate>
			</Templates>
		</obout:Grid>
					
		<br /><br /><br />
		
		<span class="tdText">
		You can use the new <b>executeInsert</b>, <b>executeUpdate</b> and <b>executeDelete</b> client-side methods<br />
		to insert, update and delete records from the Grid without pressing any link/button.
        </span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>