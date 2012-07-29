<%@ Page Language="C#"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
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

        OleDbCommand myComm = new OleDbCommand("UPDATE Suppliers SET CompanyName = @CompanyName, ContactName = @ContactName, ContactTitle = @ContactTitle, Address = @Address, City = @City, Region = @Region, PostalCode = @PostalCode, Country=@Country, Phone = @Phone, Fax = @Fax, HomePage=@HomePage WHERE SupplierID = @SupplierID", myConn);

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@ContactName", OleDbType.VarChar).Value = e.Record["ContactName"];
        myComm.Parameters.Add("@ContactTitle", OleDbType.VarChar).Value = e.Record["ContactTitle"];
        myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = e.Record["Address"];
        myComm.Parameters.Add("@City", OleDbType.VarChar).Value = e.Record["City"];
        myComm.Parameters.Add("@Region", OleDbType.VarChar).Value = e.Record["Region"];
        myComm.Parameters.Add("@PostalCode", OleDbType.VarChar).Value = e.Record["PostalCode"];
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record["Country"];
        myComm.Parameters.Add("@Phone", OleDbType.VarChar).Value = e.Record["Phone"];
        myComm.Parameters.Add("@Fax", OleDbType.VarChar).Value = e.Record["Fax"];
        myComm.Parameters.Add("@HomePage", OleDbType.VarChar).Value = e.Record["HomePage"];
        myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = e.Record["SupplierID"];
		
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void InsertRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Suppliers (CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax, HomePage) VALUES(@CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Country, @Phone, @Fax, @HomePage)", myConn);

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@ContactName", OleDbType.VarChar).Value = e.Record["ContactName"];
        myComm.Parameters.Add("@ContactTitle", OleDbType.VarChar).Value = e.Record["ContactTitle"];
        myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = e.Record["Address"];
        myComm.Parameters.Add("@City", OleDbType.VarChar).Value = e.Record["City"];
        myComm.Parameters.Add("@Region", OleDbType.VarChar).Value = e.Record["Region"];
        myComm.Parameters.Add("@PostalCode", OleDbType.VarChar).Value = e.Record["PostalCode"];
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record["Country"];
        myComm.Parameters.Add("@Phone", OleDbType.VarChar).Value = e.Record["Phone"];
        myComm.Parameters.Add("@Fax", OleDbType.VarChar).Value = e.Record["Fax"];
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
			.label 
			{
			   text-decoration:bold; 
			}  
			.rowEditTable
			{
			    position: relative;
			    
			}  
			.fieldsetEdit
			{
			    margin-left: 150px;
			}
			.template td div
			{
			    width: 175px;
			    overflow: hidden;
			}
			.ob_gCS, .ob_gCS div, .ob_gCS_F, .ob_gCS_F div 
            {
                  display: none;
            }

			
		</style>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Detail View</b></span>
		<br /><br />			
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			 FolderStyle="" AutoGenerateColumns="false" AllowAddingRecords="true" AllowFiltering="false" PageSize="5"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="ID"  Visible="false" Width="60" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="COMPANY INFORMATION" Width="700" runat="server">
				    <TemplateSettings TemplateID="TemplateCombined" RowEditTemplateControlId="txtCompanyName" RowEditTemplateControlPropertyName="value"/>
				</obout:Column>		
				<obout:Column DataField="ContactName" HeaderText="CONTACT NAME"  Visible="false" Width="500" runat="server">
				    <TemplateSettings RowEditTemplateControlId="txtContactName" RowEditTemplateControlPropertyName="value"/>
				</obout:Column>		
				<obout:Column DataField="ContactTitle" HeaderText="CONTACT TITLE"  Visible="false" Width="500" runat="server">		
				    <TemplateSettings RowEditTemplateControlId="txtContactTitle" RowEditTemplateControlPropertyName="value"/>
				</obout:Column>	
				<obout:Column DataField="Address" HeaderText="COMPANY ADDRESS" Visible="false" Width="500" runat="server">   
				    <TemplateSettings RowEditTemplateControlId="txtAddress" RowEditTemplateControlPropertyName="value"/>
				</obout:Column>	
				<obout:Column DataField="City" HeaderText="CITY" Visible="false"  Width="250" runat="server" >
				    <TemplateSettings RowEditTemplateControlId="txtCity" RowEditTemplateControlPropertyName="value"/>
				</obout:Column>
				<obout:Column DataField="Region" HeaderText="REGION" Visible="false" Width="115" runat="server" >
				    <TemplateSettings RowEditTemplateControlId="txtRegion" RowEditTemplateControlPropertyName="value"/>
				</obout:Column>
				<obout:Column DataField="PostalCode" HeaderText="POSTAL CODE" Visible="false" Width="115" runat="server" >
				    <TemplateSettings RowEditTemplateControlId="txtPostalCode" RowEditTemplateControlPropertyName="value"/>
				</obout:Column>
				<obout:Column DataField="Country" HeaderText="COUNTRY" Visible="false" Width="115" runat="server" >
				    <TemplateSettings RowEditTemplateControlId="txtCountry" RowEditTemplateControlPropertyName="value"/>
				</obout:Column>
				<obout:Column DataField="Phone" HeaderText="PHONE" Visible="false" Width="115" runat="server" >
				    <TemplateSettings RowEditTemplateControlId="txtPhone" RowEditTemplateControlPropertyName="value"/>
				</obout:Column>	
				<obout:Column DataField="Fax" HeaderText="FAX" Visible="false" Width="115" runat="server" >
				    <TemplateSettings RowEditTemplateControlId="txtFax" RowEditTemplateControlPropertyName="value"/>
				</obout:Column>			
				<obout:Column DataField="HomePage" HeaderText="HAS WEBSITE" Visible="false" Width="125" runat="server">
				    <TemplateSettings RowEditTemplateControlId="txtHomePage" RowEditTemplateControlPropertyName="value"/>
				</obout:Column>  
				<obout:Column HeaderText="" Width="200" AllowEdit="true" AllowDelete="true" runat="server" />
			</Columns>
			<TemplateSettings RowEditTemplateId="tplRowEdit" />
			<Templates>				
				<obout:GridTemplate runat="server" ID="TemplateCombined">
					<Template>
					    <table class="template">
					        <tr>
					            <td class="label" align="right" width="125"> Company Name: </td>
					            <td align="left" width="175"><div><%# Container.DataItem["CompanyName"]%></div></td>
					            <td class="label" align="right" width="125">Postal Code: </td>
					            <td align="left" width="175"><%# Container.DataItem["PostalCode"]%></td>
					        </tr>
					        <tr>
					            <td class="label" align="right" width="125">Contact Name: </td>
					            <td align="left" width="175"><div><%# Container.DataItem["ContactName"]%></div></td>
					            <td class="label" align="right" width="125">Country: </td>
					            <td align="left" width="175"><%# Container.DataItem["Country"]%></td>
					        </tr>
					        <tr>
					            <td class="label" align="right" width="125">Contact Title: </td>
					            <td align="left" width="175"><%# Container.DataItem["ContactTitle"]%></td>
					            <td class="label" align="right" width="125">Phone: </td>
					            <td align="left" width="175"><%# Container.DataItem["Phone"]%></td>
					        </tr>
					        <tr>
					            <td class="label" align="right" width="125">Address: </td>
					            <td align="left" width="175"><%# Container.DataItem["Address"]%></td>
					            <td class="label" align="right" width="125">Fax: </td>
					            <td align="left" width="175"><%# Container.DataItem["Fax"]%></td>
					        </tr>
					        <tr>
					            <td class="label" align="right" width="125">City: </td>
					            <td align="left" width="175"><%# Container.DataItem["City"]%></td>
					            <td class="label" align="right" width="125">Home Page: </td>
					            <td align="left" width="175"><%# Container.DataItem["HomePage"]%></td>
					        </tr>
					        <tr>
					            <td class="label" align="right" width="125">Region: </td>
					            <td align="left" width="175"><%# Container.DataItem["Region"]%></td>
					        </tr>
					     </table>
					</Template>
				</obout:GridTemplate>	
				<obout:GridTemplate runat="server" ID="tplRowEdit">
                    <Template>
                        <fieldset style="width: 500px; height: 185px;" class="fieldsetEdit">
                            <legend>Company Information</legend>
                            <table>					                                            
                                <tr>
                                    <td>Company Name:</td>
                                    <td>
                                        <obout:OboutTextBox runat="server" ID="txtCompanyName" Width="150" />
                                    </td>
                                    <td>Postal Code:</td>
                                    <td>
                                        <obout:OboutTextBox runat="server" ID="txtPostalCode" Width="150" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>ContactName:</td>
                                    <td>
                                        <obout:OboutTextBox runat="server" ID="txtContactName" Width="150" />
                                    </td>
                                    <td>Country:</td>
                                    <td>
                                        <obout:OboutTextBox runat="server" ID="txtCountry" Width="150" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Contact Title:</td>
                                    <td>
                                        <obout:OboutTextBox runat="server" ID="txtContactTitle" Width="150" />
                                    </td>
                                    <td>Phone:</td>
                                    <td>
                                        <obout:OboutTextBox runat="server" ID="txtPhone" Width="150" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Address:</td>
                                    <td>
                                        <obout:OboutTextBox runat="server" ID="txtAddress" Width="150" />
                                    </td>
                                    <td>Fax:</td>
                                    <td>
                                        <obout:OboutTextBox runat="server" ID="txtFax" Width="150" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>City:</td>
                                    <td>
                                        <obout:OboutTextBox runat="server" ID="txtCity" Width="150" />
                                     </td>
                                     <td>Home Page:</td>
                                    <td>
                                        <obout:OboutTextBox runat="server" ID="txtHomePage" Width="150" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Region:</td>
                                    <td>
                                        <obout:OboutTextBox runat="server" ID="txtRegion" Width="150" />
                                    </td>
                                </tr>	                                            
                                <tr>
                                    <td colspan="4" align="center">
                                        <obout:OboutButton runat="server" ID="Save" FolderStyle="../interface/styles/premiere_blue/OboutButton" Text="Save" OnClientClick="grid1.save(); return false;"/>
                                        <obout:OboutButton runat="server" ID="Cancel" FolderStyle="../interface/styles/premiere_blue/OboutButton" Text="Cancel" OnClientClick="grid1.cancel(); return false;"/>                                       
                                    </td>
                                </tr>
                            </table>
                         </fieldset>
                     </Template>
				 </obout:GridTemplate>				
			</Templates>
		</obout:Grid>				

		
		<br /><br /><br />
		<span class="tdText">
		    Using templates you can arrange the data from the grid in a detail view structure.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>