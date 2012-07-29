<%@ Page Language="C#" %>
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

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 27 * FROM Products", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();
		/*OleDbDataAdapter da = new OleDbDataAdapter();
		DataSet ds = new DataSet();
		da.SelectCommand = myComm;
		da.Fill(ds, "Products");*/
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
        <script type="text/javascript">
            function exportToExcel() {
                grid1.exportToExcel();
            }
		</script>		
	</head>
	<body>		
		<form id="Form1" runat="server">			
		
        <br />
		
        <span class="tdText"><b>ASP.NET Grid - Export Images</b></span>
		
        <br /><br />

        <obout:OboutButton ID="OboutButton1" runat="server" Text="Export to Excel" OnClientClick="exportToExcel();return false;" />
        
        <br /><br />						
		
        <obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			 FolderStyle="styles/grand_gray" AllowAddingRecords="false" PageSize="5">
			<Columns>
				<obout:Column DataField="ProductID" ReadOnly="true" HeaderText="Product ID" Width="125" runat="server"/>				
				<obout:Column DataField="ProductName" HeaderText="Product Name" Width="225" runat="server"/>				
				<obout:Column DataField="UnitPrice" HeaderText="Unit Price" Width="150" runat="server" />
				<obout:Column DataField="Image" HeaderText="Image" Width="125" Align="center" runat="server">
				    <TemplateSettings TemplateID="ImageTemplate" />
				</obout:Column>
			</Columns>
            <ExportingSettings ExportTemplates="true" />
			<Templates>
				<obout:GridTemplate runat="server" ID="ImageTemplate">
					<Template><img src="http://www.obout.com/grid/images/products/<%# Container.Value %>" alt="" width="50" height="50" /></Template>
				</obout:GridTemplate>
			</Templates>
		</obout:Grid>

		<br /><br /><br />

		<span class="tdText">
			Using the exporting feature of the Grid you can export the data formatted using templates.<br /><br />
            By default, when exporting a grid, the data formatted using templates is not included in the generated excel / word file.<br />
            You need to set <b>ExportingSettings.ExportTemplates</b> to <span class="option2">true</span> in order to export the templates.<br /><br />

            When exporting templates you can export the images from within the templates as well.<br />
            The images need to be loaded from a live server, not from a local machine, <br />
            otherwise they won't show up correctly in the exported file.

		</span>

		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
