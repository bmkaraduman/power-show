<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="cs_master_detail_grid.aspx.cs" Inherits="SuperForm_cs_master_detail_grid" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Master / Detail - With Grid</b></span>
    
    <br /><br />

    <obout:Grid runat="server" ID="Grid1" Serialize="false" AutoGenerateColumns="false" DataSourceID="SqlDataSource1" AllowAddingRecords="false"
        AllowMultiRecordSelection="false" AutoPostBackOnSelect="true" OnSelect="Grid1_Select" AllowPageSizeSelection="false">
        <Columns>
            <obout:Column DataField="OrderID" Visible="false" />
            <obout:Column DataField="ShipName" HeaderText="SHIP NAME" />
            <obout:Column DataField="ShipCity" HeaderText="SHIP CITY" />
            <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" />
        </Columns>
    </obout:Grid>
   
    <br /><br />
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT TOP 25 OrderID, ShipName, ShipCity, ShipCountry FROM [Orders]" />

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [Orders] WHERE OrderID = @OrderID"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipRegion=@ShipRegion, ShipCountry=@ShipCountry,
                         OrderDate=@OrderDate, ShippedDate=@ShippedDate, RequiredDate=@RequiredDate WHERE OrderID=@OrderID">
        <SelectParameters>
            <asp:Parameter Name="OrderID" Type="Int32" DefaultValue="0" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT DISTINCT ShipCountry FROM [Orders] ORDER BY ShipCountry ASC" />
    
    <br /><br />
    
    <span class="tdText">
        The Super Form can be used as a detail view for various scenarios. <br /><br />
        This example showcases the use of a Grid as the master control. 
        When a record is selected in the grid, the form will be populated with all the details for the selected row.<br />
        The end users can modify all the fields and hit Update. The changes will be persisted into the database and the Grid will also be updated to reflect the changes.
    </span>
</asp:Content>

