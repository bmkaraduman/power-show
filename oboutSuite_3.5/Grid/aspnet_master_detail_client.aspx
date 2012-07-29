<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

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
		<script type="text/javascript">
		    var infoContainer = null;
		    window.onload = function() {
		        infoContainer = document.getElementById('infoContainer');
		        loadDetailGrids(grid1);		        
		    }
		    
		    function loadDetailGrids(gridObj) {
		        var detailGrids = gridObj.DetailGrids;
		        
		        if(detailGrids) {
		            for(var i=0; i<detailGrids.length; i++) {
		                addOptionToDdl(detailGrids[i].ID);
    		            
		                loadDetailGrids(detailGrids[i]);
		            }
		        }
		    }
		    
		    function addOptionToDdl(value) {
		        var option = document.createElement('OPTION');
	            option.text = value;
	            option.value = value;
	            
	            document.getElementById('ddlDetails').options.add(option);
		    }
		    
		    function displayInfo(ddl) {
		        var infoText = '<br />';
		        if(ddl.value != '0') {
		            var gridObj = eval(ddl.value);    		        		            
    		        
		            infoText += 'Grid ID: ' + gridObj.ID + '<br />';
		            infoText += 'Number of records: ' + gridObj.getTotalNumberOfRecords() + '<br />';
		            for(var i in gridObj.ForeignKeys) {
		                infoText += 'Foreign key: ' + i + ' = ' + gridObj.ForeignKeys[i].Value + '<br />';
		            }
		        } else {
		            infoText = '';
		        }
		        
		        infoContainer.innerHTML = infoText;
		    }
		</script>
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Manipulating the Detail Grids on the Client-Side</b></span>		
		
		<br /><br />
		
		<span class="tdText">
		    Select a detail grid to see more information:
		    <select id="ddlDetails" class="tdText" onchange="displayInfo(this)">
		        <option value="0">-- Select --</option>
		    </select>		    
		</span>
		
		<br />
		
		<span id="infoContainer" class="tdText"></span>
		
		<br />
		
		<obout:Grid runat="server" ID="grid1" AutoGenerateColumns="false"
		    DataSourceID="sds1" FolderStyle="styles/premiere_blue" AllowAddingRecords="false">
            <Columns>
                <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" Visible="false"></obout:Column>
                <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250"></obout:Column>
                <obout:Column DataField="ContactName" HeaderText="CONTACT NAME"></obout:Column>
                <obout:Column DataField="Country" HeaderText="COUNTRY"></obout:Column>                
            </Columns>
            <MasterDetailSettings LoadingMode="OnLoad" />
            <DetailGrids>
                <obout:DetailGrid runat="server" ID="grid2" AutoGenerateColumns="false" 
                 AllowAddingRecords="false" ShowFooter="true" AllowPageSizeSelection="false" AllowPaging="false"
                 DataSourceID="sds2" FolderStyle="styles/premiere_blue" ForeignKeys="CustomerID">
                    <Columns>
                        <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="OrderDate" HeaderText="ORDER DATE" DataFormatString="{0:MM/dd/yyyy}" Width="225"></obout:Column>
                        <obout:Column DataField="ShippedDate" HeaderText="SHIPPED DATE" DataFormatString="{0:MM/dd/yyyy}"></obout:Column>
                        <obout:Column DataField="Freight" HeaderText="FREIGHT" DataFormatString="{0:C2}"></obout:Column>
                    </Columns>
                    <MasterDetailSettings LoadingMode="OnLoad" />
                    <DetailGrids>
                        <obout:DetailGrid runat="server" ID="grid3" AutoGenerateColumns="false" 
                             AllowAddingRecords="false" ShowFooter="true" AllowPageSizeSelection="false" AllowPaging="false"
                             DataSourceID="sds3" FolderStyle="styles/premiere_blue" ForeignKeys="OrderID">
                                <Columns>
                                    <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false"></obout:Column>                                
                                    <obout:Column DataField="UnitPrice" HeaderText="UNIT PRICE" DataFormatString="{0:C2}" Width="185"></obout:Column>
                                    <obout:Column DataField="Quantity" HeaderText="QUANTITY" Width="185"></obout:Column>
                                    <obout:Column DataField="Discount" HeaderText="DISCOUNT" DataFormatString="{0:F2}%" Width="185"></obout:Column>
                                </Columns>
                        </obout:DetailGrid>
                    </DetailGrids>
                </obout:DetailGrid>
            </DetailGrids>
        </obout:Grid>
		
		<br /><br />
		
		<span class="tdText">
		    The Grid exposes client-side properties / methods for manipulating the detail grids on the client:<br />
		    <b>DetailGrids</b> - a collection with all the detail grids of a master grid<br />
		    <b>ForeignKeys</b> - a collection with all the foreign keys of a detail grid<br />
		    <b>getDetailGrid</b> - retrieves a detail grid object, based on the value of the foreign key passed as the parameter
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 3 * FROM [Customers]"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		 
		<asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM [Orders] WHERE CustomerID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
		</asp:SqlDataSource>
		
		<asp:SqlDataSource runat="server" ID="sds3" SelectCommand="SELECT * FROM [Order Details] WHERE OrderID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </SelectParameters>
		</asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>