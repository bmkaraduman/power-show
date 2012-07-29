<%@ Page Language="C#"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
	void Page_load(object sender, EventArgs e)		
	{
        grid1.Columns[0].Index = Int32.Parse(ddlSupplierID.SelectedValue);
        grid1.Columns[1].Index = Int32.Parse(ddlCompanyName.SelectedValue);
        grid1.Columns[2].Index = Int32.Parse(ddlAddress.SelectedValue);
        grid1.Columns[3].Index = Int32.Parse(ddlCountry.SelectedValue);
        grid1.Columns[4].Index = Int32.Parse(ddlEdit.SelectedValue);
        
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

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Suppliers (CompanyName, Address, Country) VALUES(@CompanyName, @Address, @ShipPostalCode, @Country)", myConn);

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
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Index property for Columns</b></span><br /><br />
		<span class="tdText">Change the position of the columns inside the grid<br /></span>
		<ul>
			<table cellspacing="0" cellpadding="0">
				<tr>
					<td class="tdText">
						<li type="disc">SUPPLIER ID:&#160;</li>
					</td>
					<td class="tdText">
						<asp:DropDownList runat="server" id="ddlSupplierID" CssClass="tdText">
							<asp:ListItem Value="0" Selected="true">1</asp:ListItem>
							<asp:ListItem Value="1">2</asp:ListItem>
							<asp:ListItem Value="2">3</asp:ListItem>
							<asp:ListItem Value="3">4</asp:ListItem>
							<asp:ListItem Value="4">5</asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>
				<tr>
					<td class="tdText">
						<li type="disc">COMPANY NAME:&#160;</li>
					</td>
					<td class="tdText">
						<asp:DropDownList runat="server" id="ddlCompanyName" CssClass="tdText">
							<asp:ListItem Value="0">1</asp:ListItem>
							<asp:ListItem Value="1" Selected="true">2</asp:ListItem>
							<asp:ListItem Value="2">3</asp:ListItem>
							<asp:ListItem Value="3">4</asp:ListItem>
							<asp:ListItem Value="4">5</asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>
				<tr>
					<td class="tdText">
						<li type="disc">ADDRESS:&#160;</li>
					</td>
					<td class="tdText">
						<asp:DropDownList runat="server" id="ddlAddress" CssClass="tdText">
							<asp:ListItem Value="0">1</asp:ListItem>
							<asp:ListItem Value="1">2</asp:ListItem>
							<asp:ListItem Value="2" Selected="true">3</asp:ListItem>
							<asp:ListItem Value="3">4</asp:ListItem>
							<asp:ListItem Value="4">5</asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>				
				<tr>
					<td class="tdText">
						<li type="disc">COUNTRY:&#160;</li>
					</td>
					<td class="tdText">
						<asp:DropDownList runat="server" id="ddlCountry" CssClass="tdText">
							<asp:ListItem Value="0">1</asp:ListItem>
							<asp:ListItem Value="1">2</asp:ListItem>
							<asp:ListItem Value="2">3</asp:ListItem>
							<asp:ListItem Value="3" Selected="true">4</asp:ListItem>
							<asp:ListItem Value="4">5</asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>
				<tr>
					<td class="tdText">
						<li type="disc">EDIT:&#160;</li>
					</td>
					<td class="tdText">
						<asp:DropDownList runat="server" id="ddlEdit" CssClass="tdText">
							<asp:ListItem Value="0">1</asp:ListItem>
							<asp:ListItem Value="1">2</asp:ListItem>
							<asp:ListItem Value="2">3</asp:ListItem>
							<asp:ListItem Value="3">4</asp:ListItem>
							<asp:ListItem Value="4" Selected="true">5</asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>
				<tr>
					<td class="tdText" align="right" colspan="2">
						<input type="submit" value="Submit" class="tdText" />
					</td>
				</tr>
			</table>			
		</ul>			
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="false" AllowFiltering="true"
			 FolderStyle="styles/premiere_blue" AutoGenerateColumns="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="SUPPLIER ID" Width="125" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250" runat="server"/>				
				<obout:Column DataField="Address" HeaderText="ADDRESS" Width="250" runat="server" />
				<obout:Column DataField="Country" HeaderText="COUNTRY" Width="125" runat="server" />				
				<obout:Column AllowEdit="true" AllowDelete="true" HeaderText="EDIT" Width="150" runat="server" />				
			</Columns>			
		</obout:Grid>				

		<br /><br /><br />
		
		<span class="tdText">
		    Use the <b>Index</b> property of the <b>Column</b> class to set the position of the columns inside the Grid.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>