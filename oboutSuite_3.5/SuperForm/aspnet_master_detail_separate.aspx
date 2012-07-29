<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="aspnet_master_detail_separate.aspx.cs" Inherits="SuperForm_aspnet_master_detail_separate" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function Grid1_Select(sender, records) {
            var orderId = records[0].OrderID;

            location.href = 'aspnet_master_detail_separate_form.aspx?OrderID=' + orderId;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Master / Detail - Add / Edit in Separate Page</b></span>
    
    <br /><br />

    <obout:Grid runat="server" ID="Grid1" Serialize="false" AutoGenerateColumns="false" DataSourceID="SqlDataSource1" AllowAddingRecords="false"
        AllowMultiRecordSelection="false" AllowPageSizeSelection="false">
        <ClientSideEvents OnClientSelect="Grid1_Select" ExposeSender="true" />
        <Columns>
            <obout:Column DataField="OrderID" Visible="false" />
            <obout:Column DataField="ShipName" HeaderText="SHIP NAME" />
            <obout:Column DataField="ShipCity" HeaderText="SHIP CITY" />
            <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" />
        </Columns>
    </obout:Grid>
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT TOP 25 OrderID, ShipName, ShipCity, ShipCountry FROM [Orders]" />

    <br /><br />
    
    <span class="tdText">
        The Super Form can be used as a detail view for various scenarios. <br /><br />
        This example showcases the use of a Grid as the master control. The Super Form is placed on a different page.<br />
        When a record is selected in the Grid, the page containing the form will be opened. <br />
        The form will be populated with all the details for the selected row.<br />
        The end users can modify all the fields and hit Update. The page with the Grid will be reloaded and the changes <br />
        will be persisted into the database and the Grid will also be updated to reflect the changes.
    </span>
</asp:Content>

