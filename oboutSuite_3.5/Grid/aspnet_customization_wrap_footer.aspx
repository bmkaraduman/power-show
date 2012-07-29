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
		
		<style type="text/css">
		    .ob_gFCont
			{
			    background-color: #B5B5B5 !important;
			    background-image: none !important;
			}
		    
			.two-columns .ob_gFCont
			{
			    height: 81px !important;
			}
			
			.one-column .ob_gFCont
			{
			    height: 54px !important;
			}												
			
			.one-column .ob_gFPT
			{
			    display: none;			    
			}
			
			.one-column .ob_gFP
			{
			    margin-right: 0px !important;
			}
			
			.one-column .ob_gH .ob_gC_Fc div.ob_gHSI
			{			    
                right: 12px !important;
			}
			
			.ob_gFEC
			{
			    position: relative !important;
			}
			
			.ob_gFP
			{
			    float: left !important;
			}
			
			.ob_gALFS
			{
			    visibility: hidden;
			}
			
			.ob_gFALC
			{
			    float: left !important;
			}
			
			.ob_gPLD, .ob_gPLCL, .ob_gPLCLH
			{
			    height: 16px !important;
			}
			
		</style>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Wrap Footer Elements</b></span>
		<br /><br />
	    
        <table>
            <tr>
                <td>
                    <div class="two-columns">
		                <obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			                AllowFiltering="true" DataSourceID="sds1" PageSizeOptions="10,20,30,40,50">
			                <Columns>
				                <obout:Column ID="Column4" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server" Visible="false"/>
				                <obout:Column ID="Column5" DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				                <obout:Column ID="Column6" DataField="ShipCity" HeaderText="CITY" Width="185" runat="server" />				
			                </Columns>					
		                </obout:Grid>
                    </div>
                </td>
                <td width="25">&#160;</td>
                <td valign="top">
                    <div class="one-column">
		                <obout:Grid id="grid2" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			                AllowFiltering="true" DataSourceID="sds1" PageSizeOptions="10,20,30,40,50">
			                <Columns>
				                <obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server" Visible="false"/>
				                <obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>
			                </Columns>					
		                </obout:Grid>
                    </div>
                </td>
            </tr>
        </table>
        
        <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
					
		<br /><br /><br />
		
		<span class="tdText">
            In some situations the width of the Grid needs to be very small and thus the elements from the footer <br />
            (e.g. page size selector, paging buttons, won't fit on a single line). Using custom CSS styles the elements<br />
            can be arranged on multiple lines in the footer of the Grid.
        </span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>