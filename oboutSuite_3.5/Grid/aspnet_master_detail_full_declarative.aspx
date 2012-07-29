<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_master_detail_full_declarative.aspx.cs" Inherits="Grid_aspnet_master_detail_full_declarative" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">				
		<br />
		<span class="tdText"><b>ASP.NET Grid - Declarative add / edit / delete</b></span>		
		
		<br /><br />
		
       <obout:Grid runat="server" ID="grid1" AutoGenerateColumns="false" PageSize="5"
		    DataSourceID="sds1" FolderStyle="styles/black_glass" AllowAddingRecords="true">
            <Columns>
                <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ></obout:Column>
                <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="285"></obout:Column>
                <obout:Column DataField="ContactName" HeaderText="CONTACT NAME"></obout:Column>
                <obout:Column DataField="Country" HeaderText="COUNTRY"></obout:Column>
                <obout:Column DataField="" HeaderText="" AllowEdit="true" AllowDelete="true" Width="140"></obout:Column>
            </Columns>
            <MasterDetailSettings LoadingMode="OnCallback" />
            <DetailGrids>
                <obout:DetailGrid runat="server" ID="grid2" AutoGenerateColumns="false" 
                     AllowAddingRecords="true" ShowFooter="true" PageSize="5"
                     DataSourceID="sds2" FolderStyle="styles/black_glass" ForeignKeys="CustomerID">
                    <ClientSideEvents  ExposeSender="true" OnClientPopulateControls="onPopulateControls" />
                    <Columns>
                        <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ReadOnly="false" Visible="false"></obout:Column>
                        <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="ShipName" HeaderText="SHIP NAME" Width="250">
                        </obout:Column>
                        <obout:Column DataField="ShipCity" HeaderText="SHIP CITY" Width="200">                            
                        </obout:Column>
                        <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" DataFormatString="{0:C2}" Width="200"></obout:Column>
                        <obout:Column DataField="" HeaderText="" AllowEdit="true" AllowDelete="true" Width="210" Align="center"></obout:Column>
                    </Columns>
                    <MasterDetailSettings LoadingMode="OnCallback" />
                </obout:DetailGrid>
            </DetailGrids>
        </obout:Grid>
		
		<br /><br />				
		
		<span class="tdText">
		    The DetailGrids can use all the features that are available for regular grids (e.g. adding, editing, deleting, sorting, paging, etc.)
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" ProviderName="System.Data.OleDb"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
		    SelectCommand="SELECT * FROM [Customers]"
            InsertCommand="INSERT INTO Customers (CustomerID, CompanyName, ContactName, Country) VALUES(@CustomerID, @CompanyName, @ContactName, @Country)"
            UpdateCommand="UPDATE Customers SET CompanyName = @CompanyName, ContactName = @ContactName, Country=@Country WHERE CustomerID = @CustomerID"
            DeleteCommand="DELETE FROM Customers WHERE CustomerID = @CustomerID">
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="ContactName" Type="String" />
                <asp:Parameter Name="Country" Type="String" />                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="ContactName" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="CustomerID" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </DeleteParameters>
		 </asp:SqlDataSource>

		 
		<asp:SqlDataSource runat="server" ID="sds2" ProviderName="System.Data.OleDb"
            ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
            SelectCommand="SELECT * FROM [Orders] WHERE CustomerID = @CustomerID"
            InsertCommand="INSERT INTO Orders (CustomerID, ShipName, ShipCity, ShipCountry) VALUES(@CustomerID, @ShipName, @ShipCity, @ShipCountry)"
            UpdateCommand="UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipCountry=@ShipCountry WHERE OrderID = @OrderID"
            DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />
                <asp:Parameter Name="OrderID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </DeleteParameters>
		</asp:SqlDataSource>

</asp:Content>
    	
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">	
   <script type="text/javascript">


       function onPopulateControls(sender, record) {
           record.CustomerID = sender.ForeignKeys.CustomerID.Value;

           return record;
       }
		</script>
</asp:Content>

