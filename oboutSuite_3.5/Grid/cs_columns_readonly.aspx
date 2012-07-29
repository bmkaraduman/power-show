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
        oCol1.HeaderText = "SUPPLIER ID";
        oCol1.Width = "125";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";
        oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "250";

        Column oCol4 = new Column();
        oCol4.DataField = "Address";
        oCol4.HeaderText = "ADDRESS";
        oCol4.Width = "175";

        Column oCol5 = new Column();
        oCol5.DataField = "Country";
        oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "115";
        
        Column oCol6 = new Column();
        oCol6.DataField = "Phone";
        oCol6.HeaderText = "PHONE";
        oCol6.Width = "115";

        Column oCol7 = new Column();
        oCol7.HeaderText = "EDIT";
        oCol7.Width = "175";
        oCol7.AllowEdit = true;
        oCol7.AllowDelete = true;

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol6);
        grid1.Columns.Add(oCol7);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
        
        if (chkCompanyName.Checked == true)
        {
            grid1.Columns[1].ReadOnly = true;
        }
        else
        {
            grid1.Columns[1].ReadOnly = false;
        }

        if (chkAddress.Checked == true)
        {
            grid1.Columns[2].ReadOnly = true;
        }
        else
        {
            grid1.Columns[2].ReadOnly = false;
        }

        if (chkCountry.Checked == true)
        {
            grid1.Columns[3].ReadOnly = true;
        }
        else
        {
            grid1.Columns[3].ReadOnly = false;
        }

        if (chkPhone.Checked == true)
        {
            grid1.Columns[4].ReadOnly = true;
        }
        else
        {
            grid1.Columns[4].ReadOnly = false;
        }
        
		CreateGrid();
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

        OleDbCommand myComm = new OleDbCommand("UPDATE Suppliers SET CompanyName = @CompanyName, Address = @Address, Country=@Country, Phone=@Phone WHERE SupplierID = @SupplierID", myConn);

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = e.Record["Address"];
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record["Country"];
        myComm.Parameters.Add("@Phone", OleDbType.VarChar).Value = e.Record["Phone"];
        myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = e.Record["SupplierID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Suppliers (CompanyName, Address, Country, Phone) VALUES(@CompanyName, @Address, @Country, @Phone)", myConn);

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = e.Record["Address"];
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record["Country"];
        myComm.Parameters.Add("@Phone", OleDbType.VarChar).Value = e.Record["Phone"];

        myComm.ExecuteNonQuery();
        myConn.Close();
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
		<span class="tdText"><b>ASP.NET Grid - ReadOnly property for Columns</b></span><br /><br />
		<span class="tdText">Make the columns of the ASP.NET Grid read-only:<br /></span>
		<ul>
			<table cellspacing="0" cellpadding="0">				
				<tr>
					<td class="tdText">
						<li type="disc">COMPANY NAME</li>
					</td>
					<td class="tdText">
						<asp:checkbox runat="server" ID="chkCompanyName"></asp:checkbox>
					</td>
				</tr>
				<tr>
					<td class="tdText">
						<li type="disc">ADDRESS</li>
					</td>
					<td class="tdText">
						<asp:checkbox runat="server" ID="chkAddress"></asp:checkbox>
					</td>
				</tr>
				<tr>
					<td class="tdText">
						<li type="disc">COUNTRY</li>
					</td>
					<td class="tdText">
						<asp:checkbox runat="server" ID="chkCountry"></asp:checkbox>
					</td>
				</tr>
				<tr>
					<td class="tdText">
						<li type="disc">PHONE</li>
					</td>
					<td class="tdText">
						<asp:checkbox runat="server" ID="chkPhone"></asp:checkbox>
					</td>
				</tr>
				<tr>
					<td class="tdText" align="right" colspan="2">
						<input type="submit" value="Set ReadOnly property" class="tdText" />
					</td>
				</tr>
			</table>			
		</ul>			
					
        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		

		<br /><br /><br />
		
		<span class="tdText">
		    Set <b>ReadOnly</b> to <span class="option2">true</span> to make a column non-editable.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>