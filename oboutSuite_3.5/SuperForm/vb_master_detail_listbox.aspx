<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_master_detail_listbox.aspx.vb" Inherits="SuperForm_vb_master_detail_listbox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Auto Generate Fields</b></span>
    
    <br /><br />

    <span class="tdText">
        Select an order:<br />
    </span>

    <obout:ListBox runat="server" ID="ListBox1" DataSourceID="SqlDataSource1" 
        DataValueField="OrderID" DataTextField="OrderID" EmptyText="Select an order ..." Width="200"
        AutoPostBack="true" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" />
    
    <br /><br />

    <asp:PlaceHolder runat="server" ID="SuperForm1Container" />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT TOP 10 * FROM [Orders]" />

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
        This example showcases the use of a ListBox as the master control. 
        When an item is selected in the ListBox, the form will be populated with all the details for the selected item.<br />
        The end users can modify all the fields and hit Update. The changes will be persisted into the database.
    </span>
</asp:Content>

