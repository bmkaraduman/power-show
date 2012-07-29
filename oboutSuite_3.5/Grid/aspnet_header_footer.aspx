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
            CreateGrid(grid1);
            CreateGrid(grid2);
            CreateGrid(grid3);
        }
	}

	
	void CreateGrid(Grid grid)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

        grid.DataSource = myReader;
        grid.DataBind();

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
		<span class="tdText"><b>Showing/hiding the header and the footer</b></span>
		
		<br /><br />	
				
		<obout:Grid id="grid1" runat="server" ShowHeader="false" ShowFooter="false" CallbackMode="true" 
			Serialize="true" AllowAddingRecords="false" AllowColumnResizing="true" 
			FolderStyle="styles/grand_gray" AutoGenerateColumns="false">
			<Columns>
				<obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="45" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="Company Name" Width="275" runat="server"/>				
				<obout:Column DataField="Address" HeaderText="Address" Width="225" runat="server" />
				<obout:Column DataField="Country" HeaderText="Country" Width="115" runat="server" />								
			</Columns>			
		</obout:Grid>
		
		<br /><br />
		
		<obout:Grid id="grid2" runat="server" ShowHeader="true" ShowFooter="false" CallbackMode="true" 
			Serialize="true" AllowAddingRecords="false" AllowColumnResizing="true" 
			FolderStyle="styles/grand_gray" AutoGenerateColumns="false">
			<Columns>
				<obout:Column ID="Column1" DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="45" runat="server"/>				
				<obout:Column ID="Column2" DataField="CompanyName" HeaderText="Company Name" Width="275" runat="server"/>				
				<obout:Column ID="Column3" DataField="Address" HeaderText="Address" Width="225" runat="server" />
				<obout:Column ID="Column4" DataField="Country" HeaderText="Country" Width="115" runat="server" />								
			</Columns>			
		</obout:Grid>
		
		<br /><br />
		
		<obout:Grid id="grid3" runat="server" ShowHeader="false" ShowFooter="true" CallbackMode="true" 
			Serialize="true" AllowAddingRecords="false" AllowColumnResizing="true" 
			FolderStyle="styles/grand_gray" AutoGenerateColumns="false">
			<Columns>
				<obout:Column ID="Column5" DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="45" runat="server"/>				
				<obout:Column ID="Column6" DataField="CompanyName" HeaderText="Company Name" Width="275" runat="server"/>				
				<obout:Column ID="Column7" DataField="Address" HeaderText="Address" Width="225" runat="server" />
				<obout:Column ID="Column8" DataField="Country" HeaderText="Country" Width="115" runat="server" />								
			</Columns>			
		</obout:Grid>

		<br /><br /><br />
		<span class="tdText">
		You can use the <b>ShowHeader</b> and <b>ShowFooter</b> properties to show/hide the header/footer of the grid.
		</span>
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>

<style type="text/css">
    .ob_gBCont
    {
    	border: 1px solid #C3C9CE;
    }
</style>


