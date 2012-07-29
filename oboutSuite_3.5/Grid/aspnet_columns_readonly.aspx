<%@ Page Language="C#"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
	void Page_load(object sender, EventArgs e)		
	{       
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
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="false"
			 FolderStyle="styles/black_glass" AutoGenerateColumns="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column DataField="SupplierID" Visible="false" ReadOnly="true" HeaderText="SUPPLIER ID" Width="125" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250" runat="server"/>				
				<obout:Column DataField="Address" HeaderText="ADDRESS" Width="175" runat="server" />
				<obout:Column DataField="Country" HeaderText="COUNTRY" Width="115" runat="server" />
				<obout:Column DataField="Phone" HeaderText="PHONE" Width="175" runat="server" />
				<obout:Column AllowEdit="true" AllowDelete="true" HeaderText="Edit" Width="125" runat="server" />				
			</Columns>			
		</obout:Grid>				

		<br /><br /><br />
		
		<span class="tdText">
		    Set <b>ReadOnly</b> to <span class="option2">true</span> to make a column non-editable.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>