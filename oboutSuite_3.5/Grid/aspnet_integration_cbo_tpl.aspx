<%@ Page Language="C#"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
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
		<link type="text/css" rel="stylesheet" href="../Combobox/styles/gray/style.css" />
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Combobox inside Templates</b></span>
		<br /><br />			
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			 FolderStyle="styles/premiere_blue" AutoGenerateColumns="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="60" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="Company Name" Width="250" runat="server"/>				
				<obout:Column DataField="Address" HeaderText="Address"  Width="175" runat="server" />
				<obout:Column DataField="Country" HeaderText="Country" Width="150" runat="server">
				    <TemplateSettings EditTemplateID="TemplateEditCountry" />
				</obout:Column>
				<obout:Column DataField="HomePage" HeaderText="Has WebSite" Width="125" runat="server">
				    <TemplateSettings TemplateID="TemplateHasWebsite" EditTemplateID="TemplateEditHasWebsite" />
				</obout:Column>
				<obout:Column AllowEdit="true" AllowDelete="true" HeaderText="" Width="125" runat="server" />
			</Columns>
			<Templates>				
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
				<obout:GridTemplate runat="server" ID="TemplateEditCountry" ControlID="cbo1" ControlPropertyName="value">
					<Template>
						<obout:ComboBox runat="server" ID="cbo1" Height="150" Width="100%" FolderStyle="../Combobox/styles/premiere_blue">
							<Items>
								<obout:ComboBoxItem ID="Option1" runat="server" Value="Australia" Text="Australia" />
								<obout:ComboBoxItem ID="Option2" runat="server" Value="Brazil" Text="Brazil" />
								<obout:ComboBoxItem ID="Option3" runat="server" Value="Canada" Text="Canada" />
								<obout:ComboBoxItem ID="Option4" runat="server" Value="Denmark" Text="Denmark" />
								<obout:ComboBoxItem ID="Option5" runat="server" Value="Finland" Text="Finland" />
								<obout:ComboBoxItem ID="Option6" runat="server" Value="France" Text="France" />
								<obout:ComboBoxItem ID="Option7" runat="server" Value="Germany" Text="Germany" />
								<obout:ComboBoxItem ID="Option8" runat="server" Value="Italy" Text="Italy" />
								<obout:ComboBoxItem ID="Option9" runat="server" Value="Japan" Text="Japan" />
								<obout:ComboBoxItem ID="Option10" runat="server" Value="Norway" Text="Norway" />
								<obout:ComboBoxItem ID="Option11" runat="server" Value="Singapore" Text="Singapore" />
								<obout:ComboBoxItem ID="Option12" runat="server" Value="Spain" Text="Spain" />
								<obout:ComboBoxItem ID="Option13" runat="server" Value="Sweden" Text="Sweden" />
								<obout:ComboBoxItem ID="Option14" runat="server" Value="UK" Text="UK" />
								<obout:ComboBoxItem ID="Option15" runat="server" Value="USA" Text="USA" />
							</Items>
						</obout:ComboBox>
					</Template>
				</obout:GridTemplate>
			</Templates>
		</obout:Grid>				

		<br /><br /><br />
		
		<span class="tdText">
		The displayed data can be formatted using templates. Grid also supports templates<br />
		for edit mode. These templates can contain any HTML/ASP.NET control.<br /><br />
		See the <a href="http://www.obout.com/grid/grid_tutorials_templates.aspx">Templates tutorial</a>
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>