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
		    .custom .ob_gPSTT
	        {
	            float: right !important;		        
	        }
    	    
	        .custom .ob_gFCont
	        {
	            padding-right: 80px !important;
	        }		    
    	    
	        .custom .ob_gFEC
	        {
	            left: 0px !important;
	            right: auto !important;
	        }
    	    
	        .custom .ob_gFALC
	        {
	            float: left !important;
	        }
    	    
	        .custom .ob_gFAL
	        {
	            float: left !important;
	        }
    	    
	        .custom .ob_gALFS
	        {
	            float: left !important;
	        }
    	    
	        .custom .ob_gFP
	        {
	            float: left !important;
	            margin-left: 20px !important;
	            width: auto;
	            #width: 390px;
	        }
	        
	        .custom .ob_gPBC
	        {
	        }
	        
	        .custom .ob_gPLC
	        {
	            
	        }
	        
	        .custom .ob_gFPT
	        {
	            
	        }
	        
	        .custom .no-paging .ob_gFP
	        {
	            width: auto !important;
	        }
	        
	        .custom .no-paging .ob_gFP .ob_gFPT
            {
                float: left !important;
            }
		</style>
	</head>
	<body>	
		<form runat="server">
					
		<br />
		
		<span class="tdText"><b>ASP.NET Grid - Align Elements in Footer</b></span>
		
		<br /><br />
				
		<br />
        
        <span class="tdText">Standard alignment - page size selector on the left / paging buttons on the right:</span>
        <obout:Grid id="grid0" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" PageSize="2"
			FolderStyle="../grid/styles/black_glass" AllowAddingRecords="false" DataSourceID="sds1">
			<Columns>
			    <obout:Column ID="Column1" DataField="OrderID" Visible="false" ReadOnly="true" HeaderText="ORDER ID" Width="125" runat="server"/>
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="175" runat="server"/>				
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column ID="Column5" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
			</Columns>
		</obout:Grid>
		
		<br /><br />
		
		<div class="custom">
		
		    <span class="tdText">Custom alignment - paging buttons on the left / page size selector on the right:</span>
		    <obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" PageSize="2"
			    FolderStyle="../grid/styles/black_glass" AllowAddingRecords="false" DataSourceID="sds1">
			    <Columns>
			        <obout:Column ID="Column6" DataField="OrderID" Visible="false" ReadOnly="true" HeaderText="ORDER ID" Width="125" runat="server"/>
				    <obout:Column ID="Column7" DataField="ShipName" HeaderText="NAME" Width="175" runat="server"/>				
				    <obout:Column ID="Column8" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				    <obout:Column ID="Column9" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				    <obout:Column ID="Column10" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
			    </Columns>
		    </obout:Grid>
    		
		    <br /><br />
    		
    		<span class="tdText">Custom alignment - paging buttons and "Add New" link on the left:</span>
		    <obout:Grid id="grid2" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" PageSize="2"
			    FolderStyle="../grid/styles/black_glass" AllowAddingRecords="true" AllowPageSizeSelection="false" DataSourceID="sds1">
			    <Columns>
			        <obout:Column ID="Column11" DataField="OrderID" Visible="false" ReadOnly="true" HeaderText="ORDER ID" Width="125" runat="server"/>
				    <obout:Column ID="Column12" DataField="ShipName" HeaderText="NAME" Width="175" runat="server"/>				
				    <obout:Column ID="Column13" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				    <obout:Column ID="Column14" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				    <obout:Column ID="Column15" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
			    </Columns>
		    </obout:Grid>
    		
		    <br /><br />
    		
            <div class="no-paging">
    		    <span class="tdText">Custom alignment - "Add New" and filter links on the left / page size selector on the right:</span>
		        <obout:Grid id="grid3" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" PageSize="2"
			        FolderStyle="../grid/styles/black_glass" AllowPaging="false" AllowAddingRecords="true" 
                    AllowFiltering="true" AllowPageSizeSelection="true" DataSourceID="sds1">
			        <Columns>
			            <obout:Column ID="Column16" DataField="OrderID" Visible="false" ReadOnly="true" HeaderText="ORDER ID" Width="125" runat="server"/>
				        <obout:Column ID="Column17" DataField="ShipName" HeaderText="NAME" Width="175" runat="server"/>				
				        <obout:Column ID="Column18" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				        <obout:Column ID="Column19" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				        <obout:Column ID="Column20" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
			        </Columns>
		        </obout:Grid>
            </div>
		
		</div>
		
		<br /><br />
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 10 * FROM Orders"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<span class="tdText">
		    You can easily change the position of the elements in the footer of the Grid using CSS.
		</span>
					
		<br /><br /><br />
				
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>