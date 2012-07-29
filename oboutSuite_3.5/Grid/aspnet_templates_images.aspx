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

        OleDbCommand myComm = new OleDbCommand("UPDATE Suppliers SET CompanyName = @CompanyName, Address = @Address, Country=@Country, City=@City WHERE SupplierID = @SupplierID", myConn);

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = e.Record["Address"];
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record["Country"];
        myComm.Parameters.Add("@City", OleDbType.VarChar).Value = e.Record["City"];
        myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = e.Record["SupplierID"];
		
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void InsertRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Suppliers (CompanyName, Address, Country, City) VALUES(@CompanyName, @Address, @Country, @City)", myConn);

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = e.Record["Address"];
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record["Country"];
        myComm.Parameters.Add("@City", OleDbType.VarChar).Value = e.Record["City"];
		
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
			.tdTextSmall {
	            font:9px Verdana;
	            color:#333333;
            }
            .icon
            {
               cursor: pointer;
            }
		</style>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Use Images for Add /Edit / Delete</b></span>
		<br /><br />			
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			 FolderStyle="styles/grand_gray" AutoGenerateColumns="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="60" Visible="false" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250" runat="server"/>				
				<obout:Column DataField="Address" HeaderText="COMPANY ADDRESS" Width="200" runat="server" />
				<obout:Column DataField="City" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column DataField="Country" HeaderText="COUNTRY" Width="150" runat="server" />	
				<obout:Column HeaderText="EDIT" Width="125" AllowEdit="true" AllowDelete="true" runat="server">
				    <TemplateSettings TemplateId="editBtnTemplate" EditTemplateId="updateBtnTemplate" />
				</obout:Column>							
			</Columns>
			<TemplateSettings NewRecord_TemplateId="addTemplate" NewRecord_EditTemplateId="saveTemplate" />
			<Templates>								
				<obout:GridTemplate runat="server" ID="editBtnTemplate">
                    <Template>
                        <img src="resources/images/Edit.png" height="20" onclick="grid1.edit_record(this)" alt="" title="Edit" class="icon"/>
                        
                        <img src="resources/images/Delete.png" height="20" onclick="grid1.delete_record(this)" alt="" title="Delete" class="icon"/>
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="updateBtnTemplate">
                    <Template>
                        <img src="resources/images/Save.png" height="20"  onclick="grid1.update_record(this)" alt="" title="Save" class="icon"/> 
                        
                        <img src="resources/images/Delete.png" height="20" onclick="grid1.cancel_edit(this)" alt="" title="Cancel" class="icon"/> 
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="addTemplate">
                    <Template>
                        <img src="resources/images/Add.png" height="20" onclick="grid1.addRecord()" alt="" title="Add New" class="icon"/>
                    </Template>
                </obout:GridTemplate>
                 <obout:GridTemplate runat="server" ID="saveTemplate">
                    <Template>
                        <img src="resources/images/Save.png" height="18" onclick="grid1.insertRecord()" alt="" title="Save" class="icon"/>
                        
                        <img src="resources/images/Delete.png" height="18" onclick="grid1.cancelNewRecord()" alt="" title="Cancel" class="icon"/>
                    </Template>
                </obout:GridTemplate>				
			</Templates>
		</obout:Grid>				

		<br /><br /><br />
		
		<span class="tdText">
		    Use the <b>TemplateId</b> and <b>EditTemplateId</b> properties of the <b>Column</b> class to specify the Templates for the Edit/Delete/Update/Cancel Images.
		    <br /><br />
		    Use the <b>NewRecord_TemplateId</b> and <b>NewRecord_EditTemplateId</b> properties of the <b>Grid</b> class to specify the Templates for the Add New/Save/Cancel Images.
		</span>
        
        <br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>