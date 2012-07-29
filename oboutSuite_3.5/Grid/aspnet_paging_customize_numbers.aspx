<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
	void Page_load(object sender, EventArgs e)		
	{
        grid1.ShowTotalNumberOfPages = chkShowTotalNumberOfPages.Checked;
        grid1.NumberOfPagesShownInFooter = int.Parse(ddlNumberOfPagesShownInFooter.SelectedValue);
        
        
		if (!Page.IsPostBack)
		{
			CreateGrid();			
		}
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 100 * FROM Orders ORDER BY OrderID DESC", myConn);
		myConn.Open();
		/*OleDbDataAdapter da = new OleDbDataAdapter();
		DataSet ds = new DataSet();
		da.SelectCommand = myComm;
		da.Fill(ds, "Orders");*/
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
		<span class="tdText"><b>ASP.NET Grid - Customizing the Number of Pages</b></span>
		
		<br /><br />
        
        <span class="tdText">
	        Show total number of Pages <asp:CheckBox runat="server" ID="chkShowTotalNumberOfPages" Checked="true" AutoPostBack="true" /> <br />
	        Number of Pages shown in Footer
	        <asp:DropDownList runat="server" ID="ddlNumberOfPagesShownInFooter" CssClass="tdText" AutoPostBack="true">
	            <asp:ListItem Value="1">1</asp:ListItem>
	            <asp:ListItem Value="2">2</asp:ListItem>
	            <asp:ListItem Value="3">3</asp:ListItem>
	            <asp:ListItem Value="4">4</asp:ListItem>
	            <asp:ListItem Value="5">5</asp:ListItem>
	            <asp:ListItem Value="6">6</asp:ListItem>
	            <asp:ListItem Value="7" Selected="True">7</asp:ListItem>
	            <asp:ListItem Value="8">8</asp:ListItem>
	            <asp:ListItem Value="9">9</asp:ListItem>
	            <asp:ListItem Value="10">10</asp:ListItem>
	        </asp:DropDownList>
	    </span>

		<br /><br />
					
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" AllowAddingRecords="false"			
			ShowTotalNumberOfPages="true" NumberOfPagesShownInFooter="7">
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="225" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="175" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />				
			</Columns>					
		</obout:Grid>
					
		<br /><br /><br />
		
		<span class="tdText">
		Set the <b>ShowTotalNumberOfPages</b> property to <span class="option2">true</span> to make the Grid display the total number of pages.<br />
		Use the <b>NumberOfPagesShownInFooter</b> property to change the number of pages displayed in the footer.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>