<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_export_multiple.aspx.cs" Inherits="Grid_aspnet_export_multiple" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

		<span class="tdText"><b>ASP.NET Grid - Export Multiple Grids as a Single File</b></span>		
		
		<br /><br />

        <obout:OboutButton ID="OboutButton1" runat="server" Text="Export to Excel" OnClientClick="exportToExcel();return false;" />
        <obout:OboutButton ID="OboutButton2" runat="server" Text="Export to Word" OnClientClick="exportToWord();return false;" />

        <br /><br />				

        <obout:Grid id="Grid1" runat="server" AutoGenerateColumns="false" AllowAddingRecords="false" DataSourceID="SqlDataSource3" PageSize="5"
            OnExporting="Grid1_Exporting" OnExported="Grid1_Exported">
			<Columns>
			    <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" Visible="false" ReadOnly="true" Width="150" />
			    <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" />
				<obout:Column DataField="Address" HeaderText="ADDRESS" />				
				<obout:Column DataField="City" HeaderText="CITY" />
                <obout:Column DataField="Country" HeaderText="COUNTRY" />
			</Columns>
            <Templates>
                <obout:GridTemplate runat="server" ID="Template1">CUSTOMERS</obout:GridTemplate>
            </Templates>
            <TemplateSettings HeadingTemplateId="Template1" />
            <ExportingSettings ExportHiddenColumns="false" />
		</obout:Grid>

        <br /><br />

        <obout:Grid id="Grid2" runat="server" AutoGenerateColumns="false" AllowAddingRecords="false" DataSourceID="SqlDataSource2" PageSize="5">
			<Columns>
			    <obout:Column DataField="OrderID" HeaderText="ORDER ID" Visible="false" ReadOnly="true" Width="150" />
			    <obout:Column DataField="ShipName" HeaderText="NAME" />
				<obout:Column DataField="ShipCity" HeaderText="CITY" />
                <obout:Column DataField="ShipRegion" HeaderText="REGION" />
                <obout:Column DataField="ShipCountry" HeaderText="COUNTRY" />
			</Columns>
            <Templates>
                <obout:GridTemplate runat="server" ID="Template2">ORDERS</obout:GridTemplate>
            </Templates>
            <TemplateSettings HeadingTemplateId="Template2" />
            <ExportingSettings ExportHiddenColumns="false" />
		</obout:Grid>        
		
        <br /><br />

        <obout:Grid id="Grid3" runat="server" AutoGenerateColumns="false" AllowAddingRecords="false" DataSourceID="SqlDataSource1" PageSize="5">
			<Columns>
			    <obout:Column DataField="ProductID" HeaderText="PRODUCT ID" Visible="false" ReadOnly="true" Width="150" />
			    <obout:Column DataField="CategoryID" HeaderText="CATEGORY ID" Visible="false" ReadOnly="true" Width="150" />
				<obout:Column DataField="ProductName" HeaderText="PRODUCT NAME" />				
				<obout:Column DataField="UnitPrice" HeaderText="PRICE" />
				<obout:Column DataField="UnitsInStock" HeaderText="UNITS IN STOCK" />
				<obout:Column DataField="UnitsOnOrder" HeaderText="UNITS ON ORDER" />
			</Columns>
            <Templates>
                <obout:GridTemplate runat="server" ID="Template3">PRODUCTS</obout:GridTemplate>
            </Templates>
            <TemplateSettings HeadingTemplateId="Template3" />
            <ExportingSettings ExportHiddenColumns="false" />
		</obout:Grid>

		<br />
		
        <span class="tdText">
		    When exporting a Grid to Excel / Word you can add extra rows to the exported file. <br />
            Thus, developers can extract data from other Grids from the page and add them to the file that is currently exported.
            
            <br /><br />

            The Grid exposes two server-side events that assist you in adding extra rows to the exported files:
            <ul>
                <li><b>Exporting</b> - raised before any other row is added to the exported table. This should be used to add rows at the top of the file.</li>
                <li><b>Exported</b> - raised after all rows have been added to the exported table. This should be used to add rows at the bottom of the file.</li>
            </ul>
		</span>
				
		<asp:SqlDataSource runat="server" ID="SqlDataSource1" SelectCommand="SELECT TOP 25 * FROM Products"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
        <asp:SqlDataSource runat="server" ID="SqlDataSource2" SelectCommand="SELECT TOP 25 * FROM Orders"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
        <asp:SqlDataSource runat="server" ID="SqlDataSource3" SelectCommand="SELECT TOP 25 * FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>		

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
         <script type="text/javascript">
             function exportToExcel() {
                 Grid1.exportToExcel();
             }

             function exportToWord() {
                 Grid1.exportToWord();
             }
		</script>
</asp:Content>

