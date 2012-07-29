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
	</head>
	<body>		
		<form id="Form1" runat="server">			
		<br />
		<span class="tdText"><b>ASP.NET Grid with Images</b></span>
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
			<Templates>
				<obout:GridTemplate runat="server" ID="ImageTemplate">
					<Template><img src="resources/images/products/<%# Container.Value %>" alt="" width="50" height="50" /></Template>
				</obout:GridTemplate>
			</Templates>
		</obout:Grid>

		<br /><br /><br />

		<span class="tdText">
			The data from the database can be easily converted to images using Templates.
			<br /><br />
			See the <a href="http://www.obout.com/grid/grid_tutorials_templates.aspx">Templates tutorial</a>.
		</span>

		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
