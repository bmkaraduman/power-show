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
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Multiple Detail Grids on the same Level</b></span>		
		
		<br /><br />
		
		<obout:Grid runat="server" ID="grid1" AutoGenerateColumns="false" Serialize="false"
		    DataSourceID="sds1" FolderStyle="styles/premiere_blue" AllowAddingRecords="false">
             <Columns>
                <obout:Column DataField="CustomerID" ReadOnly="true" Visible="false"></obout:Column>
                <obout:Column DataField="EmployeeID" ReadOnly="true" Visible="false"></obout:Column>
                <obout:Column DataField="OrderID" ReadOnly="true" Visible="false"></obout:Column>
                <obout:Column DataField="OrderDate" HeaderText="ORDER DATE" DataFormatString="{0:MM/dd/yyyy}" Width="190"></obout:Column>
                <obout:Column DataField="ShippedDate" HeaderText="SHIPPED DATE" DataFormatString="{0:MM/dd/yyyy}"></obout:Column>
                <obout:Column DataField="Freight" HeaderText="FREIGHT"></obout:Column>
            </Columns>            
            <MasterDetailSettings LoadingMode="OnLoad" />            
            <DetailGrids>
                <obout:DetailGrid runat="server" ID="grid3" AutoGenerateColumns="false"  Serialize="false"
                 AllowAddingRecords="false" ShowFooter="true" AllowPageSizeSelection="false" AllowPaging="false"
                 DataSourceID="sds2" FolderStyle="styles/premiere_blue" ForeignKeys="EmployeeID">
                    <Columns>
                        <obout:Column DataField="EmployeeID" Visible="false"></obout:Column>
                        <obout:Column DataField="LastName" HeaderText="EMPLOYEE LAST NAME"></obout:Column>
                        <obout:Column DataField="FirstName" HeaderText="EMPLOYEE FIRST NAME"></obout:Column>
                        <obout:Column DataField="Country" HeaderText="COUNTRY"></obout:Column>                
                    </Columns>
                </obout:DetailGrid>
                <obout:DetailGrid runat="server" ID="grid2" AutoGenerateColumns="false"  Serialize="false"
                 AllowAddingRecords="false" ShowFooter="true" AllowPageSizeSelection="false" AllowPaging="false"
                 DataSourceID="sds3" FolderStyle="styles/premiere_blue" ForeignKeys="CustomerID">
                    <Columns>
                        <obout:Column DataField="CustomerID" Visible="false"></obout:Column>
                        <obout:Column DataField="CompanyName" HeaderText="CUSTOMER"></obout:Column>
                        <obout:Column DataField="ContactName" HeaderText="CUSTOMER CONTACT"></obout:Column>
                        <obout:Column DataField="Country" HeaderText="COUNTRY"></obout:Column>                
                    </Columns>
                </obout:DetailGrid>                
            </DetailGrids>
        </obout:Grid>
		
		<br /><br />				
		
		<span class="tdText">
		    You can have multiple detail grids on the same level.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 3 * FROM [Orders]"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		</asp:SqlDataSource>
		
		<asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM [Employees] WHERE EmployeeID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </SelectParameters>
		</asp:SqlDataSource>
				
		<asp:SqlDataSource runat="server" ID="sds3" SelectCommand="SELECT * FROM [Customers] WHERE CustomerID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters> 
		</asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>