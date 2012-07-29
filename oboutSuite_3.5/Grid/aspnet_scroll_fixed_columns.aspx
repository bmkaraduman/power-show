<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
    void ChangeFixedColumns(object sender, EventArgs e)
    {
        grid1.ScrollingSettings.NumberOfFixedColumns = int.Parse(ddlColumns.SelectedValue);
        grid2.ScrollingSettings.NumberOfFixedColumns = int.Parse(ddlColumns.SelectedValue);

        for (int i = 0; i < grid1.Columns.Count; i++)
        {
            grid1.Columns[i].Visible = true;
            grid2.Columns[i].Visible = true;
        }
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
		<span class="tdText"><b>ASP.NET Grid - Horizontal Scrolling with Fixed (Frozen) Columns</b></span>		
		
		<br /><br />
		
		<span class="tdText">
		    Number of fixed(frozen) columns:
		    <asp:DropDownList runat="server" ID="ddlColumns" CssClass="tdText" OnSelectedIndexChanged="ChangeFixedColumns" AutoPostBack="true">
		        <asp:ListItem Value="0">0</asp:ListItem>
		        <asp:ListItem Value="1">1</asp:ListItem>
		        <asp:ListItem Value="2" Selected="True">2</asp:ListItem>
		        <asp:ListItem Value="3">3</asp:ListItem>		        
		    </asp:DropDownList>
		</span>
		
		<br /><br />
		
		<span class="tdText"><b>FixedColumnsPosition="Left"</b></span>
		<br />
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" PageSize="10" AllowAddingRecords="false" DataSourceID="sds1">
			<Columns>				
			    <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Width="150" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="150" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column DataField="ShipAddress" HeaderText="ADDRESS" Width="150" runat="server" />
				<obout:Column DataField="ShipRegion" HeaderText="REGION" Width="150" runat="server" />
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />				
			</Columns>
			<ScrollingSettings ScrollWidth="600" NumberOfFixedColumns="2" FixedColumnsPosition="Left"/>
		</obout:Grid>
		
		<br />
		<span class="tdText">Scroll the grid horizontally: the first columns on the <b>left</b> won't change their position</span>
					
		<br /><br /><br />
		
		<span class="tdText"><b>FixedColumnsPosition="Right"</b></span>
		<br />
		<obout:Grid id="grid2" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" PageSize="10" AllowAddingRecords="false" DataSourceID="sds1">
			<Columns>				
			    <obout:Column ID="Column1" DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Width="150" runat="server"/>
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="150" runat="server"/>				
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column ID="Column5" DataField="ShipAddress" HeaderText="ADDRESS" Width="150" runat="server" />
				<obout:Column ID="Column6" DataField="ShipRegion" HeaderText="REGION" Width="150" runat="server" />
				<obout:Column ID="Column7" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />				
			</Columns>
			<ScrollingSettings ScrollWidth="600" NumberOfFixedColumns="2" FixedColumnsPosition="Right"/>
		</obout:Grid>
		
		<br />
		<span class="tdText">Scroll the grid horizontally: the first columns on the <b>right</b> won't change their position</span>
							
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>