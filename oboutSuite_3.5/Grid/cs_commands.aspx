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
		grid1.AllowAddingRecords = false;
		 
		
		grid1.FolderStyle = "styles/grand_gray";

		// setting the event handlers
		grid1.InsertCommand += new Obout.Grid.Grid.EventHandler(InsertRecord);
		grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
		grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
		grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);
        grid1.ColumnsCreated += new Grid.DefaultEventHandler(grid1_ColumnsCreated);

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
        oCol5.Width = "125";
        oCol5.AllowEdit = true;
        oCol5.AllowDelete = true;
        oCol5.Visible = false;
			

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);		

        if (chkAllowAddNew.Checked == true)
        {
            grid1.AllowAddingRecords = true;
        }
        else
        {
            grid1.AllowAddingRecords = false;
        }

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);            
        
		if (!Page.IsPostBack)
		{
			BindGrid();		
		}
	}

	void BindGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}

    protected void grid1_ColumnsCreated(object sender, EventArgs e)
    {
        if (!grid1.IsCallback)
        {
            grid1.Columns[4].AllowEdit = chkEdit.Checked;
            grid1.Columns[4].AllowDelete = chkDelete.Checked;
            grid1.Columns[4].Visible = chkEdit.Checked || chkDelete.Checked;
        }
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

        OleDbCommand myComm = new OleDbCommand("UPDATE Suppliers SET CompanyName = @CompanyName, Address = @Address, Country=@Country WHERE SupplierID = @SupplierID", myConn);

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
		BindGrid();
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
		<span class="tdText">Add/edit/delete records</span>
		<br /><br />
		
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td class="tdText" valign="middle">Show "Add new" link</td>
				<td class="tdText" valign="middle">
					<asp:checkbox runat="server" id="chkAllowAddNew" CSSClass="tdText"></asp:checkbox>
				</td>
				<td width="15" class="tdText">&#160;</td>
				<td class="tdText" valign="middle">
					<asp:Button ID="Button1" runat="server" Text="Submit" />
				</td>
			</tr>
			<tr>
				<td class="tdText">Show "Edit" column</td>
				<td class="tdText">
					<asp:checkbox runat="server" id="chkEdit" CSSClass="tdText"></asp:checkbox>
				</td>
				<td class="tdText" colspan="2">&#160;</td>
			</tr>
			<tr>
				<td class="tdText">Show "Delete" column</td>
				<td class="tdText">
					<asp:checkbox runat="server" id="chkDelete" CSSClass="tdText"></asp:checkbox>
				</td>
				<td class="tdText" colspan="2">&#160;</td>
			</tr>
		</table>
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>



