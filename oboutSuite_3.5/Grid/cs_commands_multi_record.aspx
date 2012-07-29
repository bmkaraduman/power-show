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
        grid1.AllowAddingRecords = true;
        
        grid1.AllowMultiRecordAdding = true;
        grid1.AllowMultiRecordEditing = true;
        grid1.AllowMultiRecordDeleting = true;


        grid1.FolderStyle = "styles/grand_gray";

        // setting the event handlers
        grid1.InsertCommand += new Obout.Grid.Grid.EventHandler(InsertRecord);
        grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
        grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
        grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "SupplierID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ID";
        oCol1.Width = "75";

        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";
        oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "250";

        Column oCol3 = new Column();
        oCol3.DataField = "Address";
        oCol3.HeaderText = "ADDRESS";
        oCol3.Width = "225";

        Column oCol4 = new Column();
        oCol4.DataField = "Country";
        oCol4.HeaderText = "COUNTRY";
        oCol4.Width = "125";
        
        Column oCol5 = new Column();
        oCol5.DataField = "";
        oCol5.HeaderText = "";
        oCol5.Width = "150";
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
	</head>
	<body>
		<form runat="server">
					
		<br /><br />
		<span class="tdText"><b>ASP.NET Grid - Multi-Record Add/Edit/Delete</b></span>
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
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


