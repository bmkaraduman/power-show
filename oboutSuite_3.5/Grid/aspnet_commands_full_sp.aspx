<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_commands_full_sp.aspx.cs" Inherits="Grid_aspnet_commands_full_sp" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">				
		<br />
		<span class="tdText"><b>ASP.NET Grid - Add / Edit / Delete using Stored Procedures</b></span>		
		
		<br /><br />
		
       <obout:Grid runat="server" ID="grid1" AutoGenerateColumns="false" PageSize="5"
		    DataSourceID="sds1" FolderStyle="styles/black_glass" AllowAddingRecords="true">
            <Columns>
                <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID"></obout:Column>
                <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="285"></obout:Column>
                <obout:Column DataField="ContactName" HeaderText="CONTACT NAME"></obout:Column>
                <obout:Column DataField="Country" HeaderText="COUNTRY"></obout:Column>
                <obout:Column DataField="" HeaderText="" AllowEdit="true" AllowDelete="true" Width="140"></obout:Column>
            </Columns>
        </obout:Grid>
		
		<br /><br />				
		
		<span class="tdText">
            This example showcases the ability to insert/update/delete records in the grid using stored procedures.<br />
            The stored procedures used to insert/update/delete records need to have the same parameters as the ones specified using <br />
            the "InsertParameters", "UpdateParameters" and "DeleteParameters" collections of the DataSourceControl.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" ProviderName="System.Data.OleDb"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
		    SelectCommand="spGetCustomers" SelectCommandType="StoredProcedure"
            InsertCommand="spInsertCustomer" InsertCommandType="StoredProcedure"
            UpdateCommand="spUpdateCustomer" UpdateCommandType="StoredProcedure"
            DeleteCommand="spDeleteCustomer" DeleteCommandType="StoredProcedure">
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

</asp:Content>
    	
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">	
   
</asp:Content>

