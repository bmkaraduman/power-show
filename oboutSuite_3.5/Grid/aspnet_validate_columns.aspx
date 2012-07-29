<%@ Page Language="C#"%>
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

        OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers", myConn);
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

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Suppliers WHERE SupplierID = @SupplierID", myConn);

        myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = e.Record["SupplierID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Suppliers SET CompanyName = @CompanyName, Address = @Address, Country = @Country WHERE SupplierID = @SupplierID", myConn);

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = e.Record["Address"];
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record["Country"];
        myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = e.Record["SupplierID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Suppliers (CompanyName, Address, Country) VALUES(@CompanyName, @Address, @Country)", myConn);

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = e.Record["Address"];
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record["Country"];

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
function onBeforeClientInsert(record) 
{
    for(var i in record) 
    {
        if(record[i] == '') 
        {
            // if value is not filled
            alert("Column " + i + " is mandatory.");
            return false;
        }
    }
    return true;
}

function onBeforeClientUpdate(record) 
{
    for(var i in record) 
    {
        if(record[i] == '') 
        {
            // if value is not filled
            alert("Column " + i + " is mandatory.");
            return false;
        }
    }
    return true;
}

    function onClientEdit(record) { 
        document.getElementById('editTextBox').readOnly = true; 
        return true;
    }

</script>
<style type="text/css">
	.tdText {
		font:11px Verdana;
		color:#333333;
	}
</style>
</head>
<body>	
		<form id="Form1" runat="server">
		<br />
		<span class="tdText"><b>ASP.NET Grid - Validation on unknown columns name</b></span>
		<br /><br />	
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			 FolderStyle="../grid/styles/black_glass" AutoGenerateColumns="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column DataField="SupplierID" Visible="false" ReadOnly="true" HeaderText="SUPPLIER ID" Width="125" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250" runat="server"/>				
				<obout:Column DataField="Address" HeaderText="ADDRESS" Width="185" runat="server" />
				<obout:Column DataField="Country" HeaderText="COUNTRY" Width="125" runat="server" />
				<obout:Column AllowEdit="true" AllowDelete="true" HeaderText="Edit" Width="125" runat="server" />				
			</Columns>
			<ClientSideEvents 
			    OnBeforeClientInsert="onBeforeClientInsert" 
			    OnBeforeClientUpdate="onBeforeClientUpdate" 
			 />
		</obout:Grid>
		 <br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		</form>
</body>
</html>