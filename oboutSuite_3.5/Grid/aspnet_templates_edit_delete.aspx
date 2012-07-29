<%@ Page Language="C#"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

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
			.tdTextSmall {
	            font:9px Verdana;
	            color:#333333;
            }
			.btspace {
				padding-left:38px;
			}
		</style>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Templates</b></span>
		<br /><br />			
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			 FolderStyle="styles/black_glass" AutoGenerateColumns="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="60" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="Company Name" Width="250" runat="server"/>
				<obout:Column DataField="Address" HeaderText="Address" Width="175" runat="server">
				    <TemplateSettings EditTemplateID="TemplateEditAddress" />
				</obout:Column>
				<obout:Column DataField="Country" HeaderText="Country" SortOrder="Asc" Width="115" runat="server" >
				    <TemplateSettings EditTemplateID="TemplateEditCountry" />
				</obout:Column>
				<obout:Column DataField="HomePage" HeaderText="Has WebSite" Width="105" runat="server">
				    <TemplateSettings TemplateID="TemplateHasWebsite" EditTemplateID="TemplateEditHasWebsite" />
				</obout:Column>
				<obout:Column AllowEdit="true" AllowDelete="true" HeaderText="" Width="165" runat="server" >
				    <TemplateSettings TemplateId="editBtnTemplate" EditTemplateId="updateBtnTemplate" />
				</obout:Column>
			</Columns>
			<Templates>
				<obout:GridTemplate runat="server" ID="TemplateEditAddress" ControlID="txtAddress" ControlPropertyName="value">
					<Template>
						<textarea id="txtAddress" rows="3" class="ob_gEC" style="overflow: auto;"></textarea>
					</Template>
				</obout:GridTemplate>
				<obout:GridTemplate runat="server" ID="TemplateHasWebsite" UseQuotes="true">
					<Template>
						<%# (Container.Value == "true" ? "yes" : "no") %>
					</Template>
				</obout:GridTemplate>
				<obout:GridTemplate runat="server" ID="TemplateEditHasWebsite" ControlID="chkHasWebsite" ControlPropertyName="checked" UseQuotes="false">
					<Template>
						<input type="checkbox" id="chkHasWebsite"/>
					</Template>
				</obout:GridTemplate>
				<obout:GridTemplate runat="server" ID="TemplateEditCountry" ControlID="ddlCountries" ControlPropertyName="value">
					<Template>
						<select id="ddlCountries" class="ob_gEC">							
								<option value="Australia">Australia</option>
								<option value="Brazil">Brazil</option>
								<option value="Canada">Canada</option>
								<option value="Denmark">Denmark</option>
								<option value="Finland">Finland</option>
								<option value="France">France</option>
								<option value="Germany">Germany</option>
								<option value="Italy">Italy</option>
								<option value="Japan">Japan</option>
								<option value="Norway">Norway</option>
								<option value="Singapore">Singapore</option>
								<option value="Spain">Spain</option>
								<option value="Sweden">Sweden</option>
								<option value="UK">UK</option>
								<option value="USA">USA</option>							
						</select>						
					</Template>
				</obout:GridTemplate>

				<obout:GridTemplate runat="server" ID="editBtnTemplate">
                    <Template>
						<%#Container.DataItem["HomePage"].ToString() == "true" ? "<input type=\"button\" id=\"btnEdit\" value=\"Edit\" onclick=\"grid1.edit_record(this)\"  class=\"tdText\"/>" : "<span class=\"btspace\">&nbsp;</span>"%>
                        <%#Container.DataItem["Country"].ToString()!="Brazil"?"<input type=\"button\" id=\"btnDelete\" value=\"Delete\" onclick=\"grid1.delete_record(this)\" class=\"tdText\"/>" : ""%>
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="updateBtnTemplate">
                    <Template>
                        <input type="button" id="btnUpdate" value="Update" onclick="grid1.update_record(this)" class="tdText"/> 
                        <input type="button" id="btnCancel" value="Cancel" onclick="grid1.cancel_edit(this)" class="tdText"/> 
                    </Template>
                </obout:GridTemplate>		
			</Templates>
		</obout:Grid>				

		<br /><br /><br />
		
		<span class="tdText">
		The displayed data can be formatted using templates. <br>
		Grid also supports templates for edit/delete links.<br> 
		This sample allows users to edit the suppliers which have a website <br>
		and delete the suppliers which are located outside Brazil.<br /><br />
		See the <a href="http://www.obout.com/grid/grid_tutorials_templates.aspx">Templates tutorial</a>
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
<!--[if IE]>
	<style>
		.btspace {
			padding-left:26px;
		}
	</style>
<![endif]-->