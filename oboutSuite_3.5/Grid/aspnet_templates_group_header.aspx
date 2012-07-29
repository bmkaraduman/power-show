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
		<span class="tdText"><b>ASP.NET Grid - Using the GroupHeaderTemplateId property</b></span>
		<br /><br />			
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			FolderStyle="styles/grand_gray" AutoGenerateColumns="false" AllowAddingRecords="false"		
			AllowGrouping="true" GroupBy="Country">
			<Columns>
				<obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="60" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="Company Name" Width="250" runat="server" />
				<obout:Column DataField="Address" HeaderText="Address" Width="175" runat="server" />
				<obout:Column DataField="Country" HeaderText="Country" Width="115" runat="server">
				    <TemplateSettings TemplateID="TemplateCountry" GroupHeaderTemplateId="TemplateCountryGroup" />
				</obout:Column>
				<obout:Column DataField="HomePage" HeaderText="Has WebSite" Width="125" runat="server">
				    <TemplateSettings TemplateId="TemplateHasWebsite" />
				</obout:Column>
			</Columns>
			<Templates>
			    <obout:GridTemplate runat="server" ID="TemplateCountryGroup">
					<Template>
						<b><i><%# Container.Value %></i></b>
					</Template>
				</obout:GridTemplate>
				<obout:GridTemplate runat="server" ID="TemplateCountry">
					<Template>
						<b><u><i><%# Container.Value %></i></u></b>
					</Template>
				</obout:GridTemplate>				
				<obout:GridTemplate runat="server" ID="TemplateHasWebsite" UseQuotes="true">
					<Template>
						<%# (Container.Value == "true" ? "yes" : "no") %>
					</Template>
				</obout:GridTemplate>							
			</Templates>
		</obout:Grid>				

		<br /><br /><br />
		
		<span class="tdText">
		    To customize the data displayed in the headers of the Groups, you can use the <b>GroupHeaderTemplateId</b> property,<br />
		    which can be set using the <b>TemplateSettings</b> property of the Column class.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>