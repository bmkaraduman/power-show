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

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}
	void DeleteRecord(object sender, GridRecordEventArgs e)
	{
        if (e.RecordsCollection.Count > 0)
        {
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
            myConn.Open();

            foreach (Hashtable oRecord in e.RecordsCollection)
            {
                OleDbCommand myComm = new OleDbCommand("DELETE FROM Suppliers WHERE SupplierID = @SupplierID", myConn);

                myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = oRecord["SupplierID"];

                myComm.ExecuteNonQuery();
            }
            
            myConn.Close();
        }
	}
	void UpdateRecord(object sender, GridRecordEventArgs e)
	{
        if (e.RecordsCollection.Count > 0)
        {
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
            myConn.Open();

            foreach (Hashtable oRecord in e.RecordsCollection)
            {
                OleDbCommand myComm = new OleDbCommand("UPDATE Suppliers SET CompanyName = @CompanyName, Address = @Address, Country=@Country WHERE SupplierID = @SupplierID", myConn);

                myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = oRecord["CompanyName"];
                myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = oRecord["Address"];
                myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = oRecord["Country"];
                myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = oRecord["SupplierID"];

                myComm.ExecuteNonQuery();
            }
                
            myConn.Close();
        }
	}
	void InsertRecord(object sender, GridRecordEventArgs e)
	{
        if (e.RecordsCollection.Count > 0)
        {
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
            myConn.Open();

            foreach (Hashtable oRecord in e.RecordsCollection)
            {
                OleDbCommand myComm = new OleDbCommand("INSERT INTO Suppliers (CompanyName, Address, Country) VALUES(@CompanyName, @Address, @Country)", myConn);

                myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = oRecord["CompanyName"];
                myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = oRecord["Address"];
                myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = oRecord["Country"];

                myComm.ExecuteNonQuery();
            }
            
            myConn.Close();
        }	
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
					
		<br /><br />
		<span class="tdText"><b>ASP.NET Grid - Multi-Record Add/Edit/Delete</b></span>
		
		<br /><br />

		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			AllowAddingRecords="true" AllowColumnResizing="true" AutoGenerateColumns="false" FolderStyle="styles/black_glass"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord"
			AllowMultiRecordAdding="true" AllowMultiRecordEditing="true" AllowMultiRecordDeleting="true">
			<Columns>
				<obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="75" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250" runat="server"/>				
				<obout:Column DataField="Address" HeaderText="ADDRESS" Width="225" runat="server" />
				<obout:Column DataField="Country" HeaderText="COUNTRY" Width="125" runat="server" />
				<obout:Column DataField="" AllowEdit="true" AllowDelete="true" HeaderText="" Width="150" runat="server" />
			</Columns>			
		</obout:Grid>
		
		<br /><br />
		
		<span class="tdText">
		    Make any changes to the Grid (add, edit, delete records) then hit the Save All link.<br />
		    A single trip to the server will take place, persisting all the changes in the database.
		</span>
		
		<br /><br />
		
		<span class="tdText">
		    Use the following properties:
		    <ul>
		        <li><b>AllowMultiRecordAdding</b> - enables the multi-record adding feature</li>
		        <li><b>AllowMultiRecordEditing</b> - enables the multi-record editing feature</li>
		        <li><b>AllowMultiRecordDeleting</b> - enables the multi-record deleting feature</li>
		    </ul>
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>


