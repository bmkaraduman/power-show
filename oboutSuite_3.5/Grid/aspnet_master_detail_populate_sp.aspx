<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_master_detail_populate_sp.aspx.cs" Inherits="Grid_aspnet_master_detail_populate_sp" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">				
		<br />
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Populating from Stored Procedures</b></span>		
		
		<br /><br />
		
       <obout:Grid runat="server" ID="grid1" AutoGenerateColumns="false" PageSize="5"
		    DataSourceID="sds1" FolderStyle="styles/black_glass" AllowAddingRecords="false">
            <Columns>
                <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID"></obout:Column>
                <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="285"></obout:Column>
                <obout:Column DataField="ContactName" HeaderText="CONTACT NAME"></obout:Column>
                <obout:Column DataField="Country" HeaderText="COUNTRY"></obout:Column>                
            </Columns>
            <MasterDetailSettings LoadingMode="OnCallback" />
            <DetailGrids>
                <obout:DetailGrid runat="server" ID="grid2" AutoGenerateColumns="false" 
                     AllowAddingRecords="false" ShowFooter="true" PageSize="5"
                     DataSourceID="sds2" FolderStyle="styles/black_glass" ForeignKeys="CustomerID">
                    <Columns>
                        <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ReadOnly="false" Visible="false"></obout:Column>
                        <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="ShipName" HeaderText="SHIP NAME" Width="250">
                        </obout:Column>
                        <obout:Column DataField="ShipCity" HeaderText="SHIP CITY" Width="200">                            
                        </obout:Column>
                        <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" DataFormatString="{0:C2}" Width="200"></obout:Column>
                    </Columns>
                    <MasterDetailSettings LoadingMode="OnCallback" />
                </obout:DetailGrid>
            </DetailGrids>
        </obout:Grid>
		
		<br /><br />				
		
		<span class="tdText">
		    This example showcases the ability to populate both master and detail grids using stored procedures.<br />
            The stored procedure that populates the detail grid will receive the value of the foreign key as a parameter.<br />
            Thus, the stored procedure will retrieve only the data for the master row that was expanded.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" ProviderName="System.Data.OleDb"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
		    SelectCommand="spGetCustomers" SelectCommandType="StoredProcedure">            
		 </asp:SqlDataSource>

		 
		<asp:SqlDataSource runat="server" ID="sds2" ProviderName="System.Data.OleDb"
            ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
            SelectCommand="spGetCustomerOrders" SelectCommandType="StoredProcedure">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>            
		</asp:SqlDataSource>

</asp:Content>
