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
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Populating from Generic Collections</b></span>		
		
		<br /><br />
		
		<obout:Grid runat="server" ID="grid1" AutoGenerateColumns="false"
		    DataSourceID="ods1" FolderStyle="styles/premiere_blue" AllowAddingRecords="false">
            <Columns>
                <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" Visible="false"></obout:Column>
                <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250"></obout:Column>
                <obout:Column DataField="ContactName" HeaderText="CONTACT NAME"></obout:Column>
                <obout:Column DataField="Country" HeaderText="COUNTRY"></obout:Column>                
            </Columns>
            <MasterDetailSettings LoadingMode="OnCallback" />
            <DetailGrids>
                <obout:DetailGrid runat="server" ID="grid2" AutoGenerateColumns="false" 
                 AllowAddingRecords="false" ShowFooter="true" AllowPageSizeSelection="false" AllowPaging="false"
                 DataSourceID="ods2" FolderStyle="styles/premiere_blue" ForeignKeys="CustomerID">
                    <Columns>
                        <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="OrderDate" HeaderText="ORDER DATE" DataFormatString="{0:MM/dd/yyyy}" Width="227"></obout:Column>
                        <obout:Column DataField="ShippedDate" HeaderText="SHIPPED DATE" DataFormatString="{0:MM/dd/yyyy}"></obout:Column>
                        <obout:Column DataField="Freight" HeaderText="FREIGHT" DataFormatString="{0:C2}"></obout:Column>
                    </Columns>
                    <MasterDetailSettings LoadingMode="OnCallback" />
                    <DetailGrids>
                        <obout:DetailGrid runat="server" ID="grid3" AutoGenerateColumns="false" 
                             AllowAddingRecords="false" ShowFooter="true" AllowPageSizeSelection="false" AllowPaging="false"
                             DataSourceID="ods3" FolderStyle="styles/premiere_blue" ForeignKeys="OrderID">
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
		    The detail grids can be populated from generic collections too.
		</span>
		
		<asp:ObjectDataSource runat="server" ID="ods1" SelectMethod="GetGenericCustomers" TypeName="OrdersGenericData">
		</asp:ObjectDataSource>
		
		<asp:ObjectDataSource runat="server" ID="ods2" SelectMethod="GetGenericOrdersByCustomer" TypeName="OrdersGenericData">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
		</asp:ObjectDataSource>
		
		<asp:ObjectDataSource runat="server" ID="ods3" SelectMethod="GetGenericOrderDetailsByOrder" TypeName="OrdersGenericData">
		    <SelectParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </SelectParameters>
		</asp:ObjectDataSource>
			
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>