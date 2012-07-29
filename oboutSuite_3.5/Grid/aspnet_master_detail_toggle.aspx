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
			
			input.tdText 
			{
				width: 150px;
			}
		</style>
		<script type="text/javascript">
		    var elementsToExpand;
		    function toggleDetailLevel(level, expand) {
		        var elements = document.getElementsByTagName('IMG');
		        elementsToExpand = new Array();
		        for(var i=0; i<elements.length; i++) {
		            try {
		                if (elements[i].parentNode.className == 'ob_gDGEB') {
		                    var isExpanded = false;
		                    if (elements[i].src.toString().indexOf('details_btn_open.gif') == -1) {
		                        isExpanded = true;
		                    }
		                    
                            if(isExpanded != expand && level == getDetailGridLevel(elements[i])) {
                                elementsToExpand.push(elements[i]);
                                window.setTimeout('toggleDetailGrid(' + (elementsToExpand.length - 1) + ')', 250);
                            }
		                }
		            } catch(ex) {};
		        }
		    }
		    
		    function toggleDetailGrid(i) {
		        try {
		            elementsToExpand[i].onclick();
		        } catch(ex) {};
		    }
		    
		    function getDetailGridLevel(element) {
		        var level = 0;
		        while(element.parentNode && element.id != grid1.GridBodyContainer.id) {
		            element = element.parentNode;
		            
		            if(element.className == 'ob_gDGCCT') {
		                level++;
		            }
		        }
		        
		        return level;
		    }
		</script>
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Expand / Collapse All Details</b></span>		
		
		<br /><br />
		
		<obout:Grid runat="server" ID="grid1" AutoGenerateColumns="false" Serialize="false"
		    DataSourceID="sds1" FolderStyle="styles/grand_gray" AllowAddingRecords="false">
            <Columns>
                <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" Visible="false"></obout:Column>
                <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250"></obout:Column>
                <obout:Column DataField="ContactName" HeaderText="CONTACT NAME"></obout:Column>
                <obout:Column DataField="Country" HeaderText="COUNTRY"></obout:Column>                
            </Columns>
            <MasterDetailSettings LoadingMode="OnLoad" />
            <DetailGrids>
                <obout:DetailGrid runat="server" ID="grid2" AutoGenerateColumns="false" 
                 AllowAddingRecords="false" PageSize="1" Serialize="false"
                 ShowFooter="true" AllowPageSizeSelection="false" AllowPaging="false"
                 DataSourceID="sds2" FolderStyle="styles/grand_gray" ForeignKeys="CustomerID">
                    <Columns>
                        <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="OrderDate" HeaderText="ORDER DATE" DataFormatString="{0:MM/dd/yyyy}" Width="225"></obout:Column>
                        <obout:Column DataField="ShippedDate" HeaderText="SHIPPED DATE" DataFormatString="{0:MM/dd/yyyy}"></obout:Column>
                        <obout:Column DataField="Freight" HeaderText="FREIGHT" DataFormatString="{0:C2}"></obout:Column>
                    </Columns>
                    <MasterDetailSettings LoadingMode="OnLoad" />
                    <DetailGrids>
                        <obout:DetailGrid runat="server" ID="grid3" AutoGenerateColumns="false"  Serialize="false"
                             AllowAddingRecords="false" ShowFooter="true" AllowPageSizeSelection="false" AllowPaging="false"
                             DataSourceID="sds3" FolderStyle="styles/grand_gray" ForeignKeys="OrderID">
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
		
		<input type="button" value="Expand 1st level" onclick="toggleDetailLevel(0, true)" class="tdText" /> 
		<input type="button" value="Expand 2nd level" onclick="toggleDetailLevel(1, true)" class="tdText" /> 
		
		<br />
		
		<input type="button" value="Collapse 1st level" onclick="toggleDetailLevel(0, false)" class="tdText" /> 
		<input type="button" value="Collapse 2nd level" onclick="toggleDetailLevel(1, false)" class="tdText" />
		
		<br /><br />
		
		<span class="tdText">
		    You can expand/collapse all detail levels by using a custom JavaScript function: <span class="option2">toggleDetailLevel</span> <br />
		    This feature works with both <b>OnCallback</b> and <b>OnLoad</b> patterns.
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