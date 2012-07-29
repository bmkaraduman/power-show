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
            Session["DataLimit"] = 50;
        }

        if (grid1.PageSize * (grid1.CurrentPageIndex + 1) >= int.Parse(Session["DataLimit"].ToString()))
        {
            Session["DataLimit"] = int.Parse(Session["DataLimit"].ToString()) + 50;
        }

        sds1.SelectCommand = "SELECT TOP " + Session["DataLimit"].ToString() + " * FROM Orders ORDER BY OrderID DESC";
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
		<span class="tdText"><b>ASP.NET Grid - Partial Load</b></span>
		<br /><br />
		
		<asp:SqlDataSource runat="server" ID="sds1"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		</asp:SqlDataSource>
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="false" AutoGenerateColumns="false"
			FolderStyle="styles/premiere_blue" AllowAddingRecords="false" DataSourceID="sds1">
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
			</Columns>					
		</obout:Grid>
					
		<br /><br /><br />
		
		<span class="tdText">
		    Initially the grid loads 50 records. <br />
		    When navigating to the last page (page 5), the next 50 records (51-100) from the database are loaded. <br />
		    When navigating again to the last page (page 10), the next 50 records (101-150) are loaded. <br />
		    This will continune in the same way, until all the records from the database will be loaded.
		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>