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

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 50 * FROM Orders", myConn);
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
		<span class="tdText"><b>ASP.NET Grid - Multi-Column Sorting</b></span>
		
		<br /><br />	
			
		<span class="tdText">Press the <b>CTRL</b> key while clicking on the headers of the columns to sort them.</span>
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" AllowSorting="true"
			CallbackMode="true" Serialize="true" AllowAddingRecords="false" AllowColumnResizing="true" 
			 FolderStyle="styles/black_glass" AutoGenerateColumns="false" >
			<Columns>						
			    <obout:Column ID="Column1" DataField="ShipCountry" HeaderText="COUNTRY" Width="225" runat="server" />
				<obout:Column ID="Column2" DataField="ShipCity" HeaderText="CITY" Width="175" runat="server"/>								
				<obout:Column ID="Column3" DataField="ShipName" HeaderText="NAME" Width="225" runat="server" />								
			</Columns>		
		</obout:Grid>				

		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
