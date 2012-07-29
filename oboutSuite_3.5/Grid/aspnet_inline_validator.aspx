<%@ Page Language="C#" Inherits="OboutInc.oboutAJAXPage"  %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
    //string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["northwind"].ConnectionString;
	void Page_load(object sender, EventArgs e)		
	{
        //if (!Page.IsPostBack)
        //{
            CreateGrid();
        //}
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

        OleDbCommand myComm = new OleDbCommand("UPDATE Suppliers SET CompanyName = @CompanyName, Address = @Address, Country = @Country WHERE SupplierID = @SupplierID", myConn);

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
	<head runat="server">
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
			
            /* for node text */
            td.ob_t2 {
	            color:navy;
	            FONT: 8pt Tahoma; 
	            vertical-align:middle; 
	            border:none; 
	            background-color:transparent;
	            padding:2px;
            }
		</style>
<script type="text/javascript">

function onBeforeClientInsert(record)
{
    return validate();
}

function onBeforeClientUpdate(record)
{
    return validate();
}
function onEdit()
{
    return validate();
}
function validate()
{
    if(!Page_ClientValidate())
    {
        alert('Error: Mandatory fields required');
        return false;
    }
    return true;
}
</script>
</head>
	<body>
		<form id="Form1" runat="server">
		<br />
		<span class="tdText"><b>ASP.NET Grid - Inline validator</b></span>
		<br /><br />	
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="false"
			 FolderStyle="../grid/styles/black_glass" AutoGenerateColumns="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  
			OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord"
			PageSize="10">
			<ClientSideEvents OnBeforeClientInsert="onBeforeClientInsert" OnBeforeClientUpdate="onBeforeClientUpdate" OnClientEdit="onEdit"/>
			<Columns>
				<obout:Column DataField="SupplierID" Visible="false" ReadOnly="true" HeaderText="SUPPLIER ID" Width="125" runat="server" />
				<obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="220" runat="server">
				    <TemplateSettings EditTemplateId="CompanyEditTemplate" />
				</obout:Column>				
				<obout:Column DataField="Address" HeaderText="ADDRESS" Width="180" runat="server">
				    <TemplateSettings EditTemplateId="AddressEditTemplate" />
				</obout:Column>
				<obout:Column DataField="Country" HeaderText="COUNTRY" Width="160" runat="server">
				    <TemplateSettings EditTemplateId="CountryEditTemplate" />
				</obout:Column>
				<obout:Column AllowEdit="true" AllowDelete="true" HeaderText="Edit" Width="150" runat="server" />				
			</Columns>
			<Templates>
			    <obout:GridTemplate ID="CompanyEditTemplate" runat="server" ControlID="CompanyEdit" ControlPropertyName="value">
			        <Template>
			            <asp:TextBox runat="server" ID="CompanyEdit" style="width: 160px;" CssClass="ob_gEC"/><br />
                        <asp:RequiredFieldValidator runat="server"  Display="Dynamic" id="rfvCompany" controlToValidate="CompanyEdit" errormessage="Required" text=""/>
			        </Template>
			    </obout:GridTemplate>
			    <obout:GridTemplate ID="AddressEditTemplate" runat="server" ControlID="AddressEdit" ControlPropertyName="value">
			        <Template>
			            <asp:TextBox runat="server" ID="AddressEdit" style="width: 110px;" CssClass="ob_gEC"/><br />
                        <asp:RequiredFieldValidator runat="server"  Display="Dynamic" id="rfvAddress" controlToValidate="AddressEdit" errormessage="Required" text="" SetFocusOnError="true"/>
			        </Template>
			    </obout:GridTemplate>
			    <obout:GridTemplate ID="CountryEditTemplate" runat="server" ControlID="CountryEdit" ControlPropertyName="value">
			        <Template>
			            <asp:TextBox runat="server" ID="CountryEdit" style="width: 110px;" CssClass="ob_gEC"/><br />
                        <asp:RequiredFieldValidator runat="server"  Display="Dynamic" id="rfvCountry" controlToValidate="CountryEdit" errormessage="Required" text=""/>
			        </Template>
			    </obout:GridTemplate>
			</Templates>
		</obout:Grid>
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		</form>
</body>
</html>