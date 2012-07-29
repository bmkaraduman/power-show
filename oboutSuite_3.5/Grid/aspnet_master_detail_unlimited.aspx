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
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Loading unlimited levels of details</b></span>		
		
		<br /><br />
		
		<obout:Grid runat="server" ID="grid1" AutoGenerateColumns="false"
		    DataSourceID="sds1" FolderStyle="styles/black_glass" AllowAddingRecords="false">
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
                 DataSourceID="sds2" FolderStyle="styles/black_glass" ForeignKeys="CustomerID">
                    <Columns>
                        <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="OrderDate" HeaderText="ORDER DATE" DataFormatString="{0:MM/dd/yyyy}" Width="220"></obout:Column>
                        <obout:Column DataField="ShippedDate" HeaderText="SHIPPED DATE" DataFormatString="{0:MM/dd/yyyy}"></obout:Column>
                        <obout:Column DataField="Freight" HeaderText="FREIGHT" DataFormatString="{0:C2}"></obout:Column>
                    </Columns>
                    <MasterDetailSettings LoadingMode="OnCallback" />
                    <DetailGrids>
                        <obout:DetailGrid runat="server" ID="grid3" AutoGenerateColumns="false" 
                             AllowAddingRecords="false" ShowFooter="true" AllowPageSizeSelection="false" AllowPaging="false"
                             DataSourceID="sds3" FolderStyle="styles/black_glass" ForeignKeys="OrderID">
                                <Columns>
                                    <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false"></obout:Column>                                
                                    <obout:Column DataField="UnitPrice" HeaderText="UNIT PRICE" DataFormatString="{0:C2}" Width="180"></obout:Column>
                                    <obout:Column DataField="Quantity" HeaderText="QUANTITY" Width="185"></obout:Column>
                                    <obout:Column DataField="Discount" HeaderText="DISCOUNT" DataFormatString="{0:F2}%" Width="175"></obout:Column>
                                </Columns>
                                <DetailGrids>
                                    <obout:DetailGrid runat="server" ID="grid4" DataSourceID="sds4" ShowFooter="true" AutoGenerateColumns="false" AllowAddingRecords="false"
                                     ForeignKeys="ProductID" FolderStyle="styles/black_glass" AllowPageSizeSelection="false" AllowPaging="false">
                                        <Columns>
                                            <obout:Column DataField="ProductID" HeaderText="PRODUCT ID" Visible="true" Width="140"></obout:Column>
                                            <obout:Column DataField="SupplierID" HeaderText="SUPPLIER ID" Visible="false"></obout:Column>
                                            <obout:Column DataField="UnitPrice" HeaderText="UNIT PRICE" DataFormatString="{0:C2}" Width="150"></obout:Column>
                                            <obout:Column DataField="ProductName" HeaderText="PRODUCT NAME" Width="220"></obout:Column>
                                        </Columns>                                        
                                        <MasterDetailSettings LoadingMode="OnCallback" />
                                        <DetailGrids>
                                            <obout:DetailGrid runat="server" AutoGenerateColumns="false" ID="grid5" ShowFooter="true" AllowAddingRecords="false"
                                            FolderStyle="styles/black_glass" DataSourceID="sds5" ForeignKeys="SupplierID" AllowPageSizeSelection="false" AllowPaging="false">
                                                <Columns>
                                                    <obout:Column DataField="SupplierID" HeaderText="SUPPLIER ID" Visible="true" Width="125"></obout:Column>
                                                    <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="185"></obout:Column>
                                                    <obout:Column DataField="Country" HeaderText="COUNTRY" Width="170"></obout:Column>
                                                </Columns>
                                            </obout:DetailGrid>
                                        </DetailGrids>
                                    </obout:DetailGrid>
                                </DetailGrids>
                        </obout:DetailGrid>
                    </DetailGrids>
                </obout:DetailGrid>
            </DetailGrids>
        </obout:Grid>
		
		<br /><br />				
		
		<span class="tdText">
		    By loading the detail grids "on-demand" (using the <span class="option2">OnCallback</span>) pattern, <br />
		    the number of details levels that the grid can load is unlimited.
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
		
		<asp:SqlDataSource ID="sds4" runat="server" SelectCommand="SELECT ProductID, ProductName, UnitPrice, SupplierID FROM [Products] WHERE ProductID = ?"
            ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
            <SelectParameters>
                <asp:Parameter Name="ProductID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="sds5" runat="server" SelectCommand="SELECT SupplierID, CompanyName, Country  FROM [Suppliers] WHERE SupplierID = ?"
            ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
            <SelectParameters>
                <asp:Parameter Name="SupplierID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>