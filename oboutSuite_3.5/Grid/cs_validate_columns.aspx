<%@ Page Language="C#"%>
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
        grid1.Rebind += RebindGrid;
        grid1.InsertCommand += InsertRecord;
        grid1.DeleteCommand += DeleteRecord;
        grid1.UpdateCommand += UpdateRecord;

        grid1.ClientSideEvents.OnBeforeClientInsert = "onBeforeClientInsert";
        grid1.ClientSideEvents.OnBeforeClientUpdate = "onBeforeClientUpdate";

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "SupplierID";
        oCol1.Visible = false;
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "SUPPLIER ID";
        oCol1.Width = "125";

        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";
        oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "250";

        Column oCol3 = new Column();
        oCol3.DataField = "Address";
        oCol3.HeaderText = "ADDRESS";
        oCol3.Width = "185";

        Column oCol4 = new Column();
        oCol4.DataField = "Country";
        oCol4.HeaderText = "COUNTRY";
        oCol4.Width = "125";

        Column oCol5 = new Column();
        oCol5.HeaderText = "Edit";
        oCol5.Width = "125";
        oCol5.AllowEdit = true;
        oCol5.AllowDelete = true;


        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

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
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
		
		 <br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		</form>
</body>
</html>