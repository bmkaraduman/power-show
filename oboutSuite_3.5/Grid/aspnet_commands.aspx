<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
	void Page_load(object sender, EventArgs e)		
	{
		if (chkAllowAddNew.Checked == true)
		{
			grid1.AllowAddingRecords = true;
		}
		else
		{
			grid1.AllowAddingRecords = false;
		}

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
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			AllowAddingRecords="false" AllowColumnResizing="true" AutoGenerateColumns="false" 
			 FolderStyle="styles/grand_gray" EnableTypeValidation="false" OnColumnsCreated="grid1_ColumnsCreated"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="75" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="Company Name" Width="250" runat="server"/>				
				<obout:Column DataField="Address" HeaderText="Address" Width="225" runat="server" />
				<obout:Column DataField="Country" HeaderText="Country" Width="125" runat="server" />
				<obout:Column DataField="" HeaderText="" Width="125" AllowEdit="true" AllowDelete="true" Visible="false" runat="server" />				
			</Columns>			
		</obout:Grid>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>

	

