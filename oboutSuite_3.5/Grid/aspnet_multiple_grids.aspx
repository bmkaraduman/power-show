<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
		<link href="resources/custom-styles/black_glass/style.css" rel="Stylesheet" type="text/css" />	
		<link href="resources/custom-styles/grand_gray/style.css" rel="Stylesheet" type="text/css" />		
		<link href="resources/custom-styles/premiere_blue/style.css" rel="Stylesheet" type="text/css" />		
	</head>
	<body>
		<form id="Form1" runat="server">	

		<br />
		<span class="tdText"><b>Multiple ASP.NET Grids on the same page</b></span>
		<br /><br /><br />	
		
		<div class="master">
		    <obout:Grid id="grid1" runat="server" PageSize="5" CallbackMode="true" Serialize="true" DataSourceID="sds2"
			    FolderStyle="_" AutoGenerateColumns="false" AllowAddingRecords="false" AllowPageSizeSelection="false">
			    <Columns>
				    <obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="SUPPLIER ID" Width="125" runat="server"/>				
				    <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="275" runat="server"/>				
				    <obout:Column DataField="Address" HeaderText="ADDRESS"  Width="225" runat="server" />
				    <obout:Column DataField="Country" HeaderText="COUNTRY" Width="115" runat="server" />
			    </Columns>
			     <CssSettings CSSFolderImages="resources/custom-styles/black_glass" /> 	
		    </obout:Grid>		
		</div>
		
		<br /><br /><br />
		
		<div class="ob_gDGCCT" style="background-color: Transparent; padding-left: 0px;">
		    <div class="ob_gDGCCT" style="background-color: Transparent; padding-left: 0px;">
		        <obout:Grid id="grid2" runat="server" PageSize="5" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			        FolderStyle="_" AllowAddingRecords="false" AllowPageSizeSelection="false" DataSourceID="sds1">
			        <Columns>
				        <obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				        <obout:Column DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				        <obout:Column DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				        <obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				        <obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
			        </Columns>	
			        <CssSettings CSSFolderImages="resources/custom-styles/grand_gray" /> 		
		        </obout:Grid>
		    </div>		
		</div>
		<br /><br /><br />
	    <div class="ob_gDGCCT" style="background-color: Transparent; padding-left: 0px;">
	        <obout:Grid id="grid3" runat="server" PageSize="5" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
		        FolderStyle="_" AllowAddingRecords="false" AllowPageSizeSelection="false" DataSourceID="sds1">
		        <Columns>
			        <obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
			        <obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
			        <obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
			        <obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
			        <obout:Column ID="Column5" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
		        </Columns>	
		        <CssSettings CSSFolderImages="resources/custom-styles/premiere_blue" /> 		
	        </obout:Grid>
	    </div>		
		<br /><br />
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>		
		 
		 <asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT TOP 25 * FROM Suppliers ORDER BY SupplierID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>						
		<span class="tdText">
		You can have multiple Grid controls with different styles on the same page, by using the CssSettings property <br />or by using custom stylesheets.
        <br /><br />
        CssSettings should be used for minor customizations, custom stylesheets should be used when using many <br />controls with different styles on the same page (as in this example).

		<br /><br />
		See the <a href="http://www.obout.com/grid/grid_tutorials_styles_advanced.aspx">Advanced Styles Tutorial</a>
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
