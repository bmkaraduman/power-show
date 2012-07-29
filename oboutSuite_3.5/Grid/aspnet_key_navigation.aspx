<%@ Page Language="C#"%>
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

        OleDbCommand myComm = new OleDbCommand("UPDATE Suppliers SET CompanyName = @CompanyName, Address = @Address, Country=@Country, HomePage=@HomePage WHERE SupplierID = @SupplierID", myConn);

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = e.Record["Address"];
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record["Country"];
        myComm.Parameters.Add("@HomePage", OleDbType.VarChar).Value = e.Record["HomePage"];
        myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = e.Record["SupplierID"];
        
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void InsertRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();        		

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Suppliers (CompanyName, Address, Country, HomePage) VALUES(@CompanyName, @Address, @Country, @HomePage)", myConn);

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = e.Record["Address"];
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record["Country"];
        myComm.Parameters.Add("@HomePage", OleDbType.VarChar).Value = e.Record["HomePage"];
        
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
	</head>
	<body>	
		<form runat="server">
					
		<br />
        <span class="tdText"><b>ASP.NET Grid - Key Navigation</b></span>
		
		<br /><br />
		<span class="tdText">
            Use your keyboard to navigate through records/pages,<br />
            add/edit records or select records.
        </span>
        <br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AllowKeyNavigation="true"
			 FolderStyle="styles/premiere_blue" AutoGenerateColumns="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="60" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="Company Name" Width="250" runat="server"/>				
				<obout:Column DataField="Address" HeaderText="Address" Width="175" runat="server" />
				<obout:Column DataField="Country" HeaderText="Country" Width="115" runat="server" />
				<obout:Column DataField="HomePage" HeaderText="Has WebSite" Width="125" runat="server" />
				<obout:Column AllowEdit="true" AllowDelete="true" HeaderText="" Width="125" runat="server" />
			</Columns>			
		</obout:Grid>				

		<br /><br /><br />
		
		<span class="tdText">
		To enable the Key Navigation feature set <b>AllowKeyNavigation</b> to <span class="option2">true</span>.<br />
            The following keys may be used with the Grid:<br /><br /><br />
            Navigation
            <ul>
                <li>
                    <b>Arrow-Up</b> - navigate through the records - up
                </li>
                <li>
                    <b>Arrow-Down</b> - navigate through the records - down
                </li>
                <li>
                    <b>Arrow-Left</b> - previous page
                </li>
                <li>
                    <b>Arrow-Right</b> - next page
                </li>
                <li>
                    <b>Home</b> - first page
                </li>
                <li>
                    <b>End</b> - last page
                </li>
            </ul>
            <br />
            Add/Edit Records
            <ul>
                <li>
                    <b>Enter</b> - edit/update/insert record
                </li>
                <li>
                    <b>Esc</b> - cancel edit/insert
                </li>
                <li>
                    <b>a</b> - add a new record
                </li>
                <li>
                    <b>TAB</b> - navigate through the textboxes that appear in edit mode
                </li>
                <li>
                    <b>SHIFT + TAB</b> - navigate backwards through the textboxes that appear in edit mode
                </li>
            </ul>
            <br />
            Selecting Records
            <ul>
                <li>
                    <b>Space</b> - select the highlighted record
                </li>
                <li>
                    <b>CTRL + Space</b> - select multiple records
                </li>    
            </ul>
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>