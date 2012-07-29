<%@ Page Language="C#" EnableEventValidation="false"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server" Language="C#">
    void Page_Load(object sender, EventArgs e)
    {
        grid1.HideColumnsWhenGrouping = chkSwitchGroupingMode.Checked;

        if (!chkSwitchGroupingMode.Checked)
        {
            for (int i = 0; i < grid1.Columns.Count; i++)
            {
                grid1.Columns[i].Visible = true;
            }
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
		<span class="tdText"><b>ASP.NET Grid - Hide columns when grouping</b></span>		
		
		<br /><br />
		
		<asp:CheckBox runat="server" ID="chkSwitchGroupingMode" CssClass="tdText" AutoPostBack="true" Checked="true" Text="Hide Columns When Grouping" />
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/grand_gray" AllowAddingRecords="false" DataSourceID="sds1" AllowPageSizeSelection="false" 
			AllowGrouping="true" HideColumnsWhenGrouping="true" ShowGroupsInfo="false" ShowMultiPageGroupsInfo="false">
			<Columns>				
			    <obout:Column ID="Column1" DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Width="150" />
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="200" />				
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="150" />
				<obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" />								
				<obout:Column ID="Column5" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" />	
			</Columns>
		</obout:Grid>
		
		<br />
		<span class="tdText">
		    If <b>HideColumnsWhenGrouping</b> is set to <span class="option2">true</span>, the columns that are used for grouping will be hidden in the grid.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>