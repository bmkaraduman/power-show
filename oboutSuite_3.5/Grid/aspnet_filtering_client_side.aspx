<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server" Language="C#">
    void Page_Load(object sender, EventArgs e)
    {
        ddlCountries.Attributes["onchange"] = "filterGrid(this)";
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
		    function filterGrid(ddl) {
		        grid1.addFilterCriteria('ShipCountry', OboutGridFilterCriteria.EqualTo, ddl.value);                
                grid1.executeFilter();
		    }		    
		</script>
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Programmatic Filtering on the Client-Side</b></span>		
		
		<br /><br />
		
		<asp:DropDownList runat="server" ID="ddlCountries" DataSourceID="sds2" 
		    DataTextField="ShipCountry" DataValueField="ShipCountry" CssClass="tdText" />
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/premiere_blue" AllowAddingRecords="false" DataSourceID="sds1" AllowFiltering="true"
			FilterType="ProgrammaticOnly">
			<Columns>				
			    <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Width="150" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />								
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />				
			</Columns>
		</obout:Grid>
		
		<br />
		<span class="tdText">
		    Use the <span class="option2">addFilterCriteria</span> and <span class="option2">executeFilter</span> client-side methods to filter the grid on the client-side.<br />
		    If you want to hide the filter cells and the filter buttons (Show Filter etc.), please set <b>FilterType</b> to <span class="option2">ProgrammaticOnly</span>.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 15 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		 
		 <asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountry ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>