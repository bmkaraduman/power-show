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

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Products", myConn);
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
		<span class="tdText"><b>ASP.NET Grid Paging</b></span>
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" AllowSorting="true" CallbackMode="true" Serialize="true" 
			AllowAddingRecords="false" AllowColumnResizing="true" PageSize="5" CurrentPageIndex="5" 
			 FolderStyle="styles/premiere_blue" AutoGenerateColumns="false"
			AllowFiltering="true">
			<Columns>
				<obout:Column DataField="ProductID" ReadOnly="true" HeaderText="Product ID" Width="175" runat="server"/>				
				<obout:Column DataField="ProductName" HeaderText="Product Name" Width="275" runat="server"/>				
				<obout:Column DataField="UnitPrice" HeaderText="Unit Price" Width="250" runat="server" />
				<obout:Column DataField="Discontinued" HeaderText="Discontinued" Width="150" runat="server" />								
			</Columns>			
		</obout:Grid>				

		<br /><br />

		<span class="tdText">
			The Grid has two properties for paging:<br />
			<ul>
				<li type="disc">
					<b>PageSize</b> - the number of records per page
				</li>
				<li type="disc">
					<b>CurrentPageIndex</b> - the zero-based index of the page that will be loaded
				</li>
			</ul>
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>