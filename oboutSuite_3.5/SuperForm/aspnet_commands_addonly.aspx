<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="aspnet_commands_addonly.aspx.cs" Inherits="SuperForm_aspnet_commands_addonly" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Add-Only Form</b></span>
    
    <br /><br />
    
    <obout:SuperForm ID="SuperForm1" 
        Title="Add a new order"
        AutoGenerateRows="False"
        RunAt="server"
        DefaultMode="Insert"
        OnItemInserting="SuperForm1_Inserting" AllowDataKeysInsert="False" 
        EnableModelValidation="True">
        <Fields>
            <obout:BoundField DataField="ShipName" HeaderText="Ship Name" Required="true" />
            <obout:BoundField DataField="ShipCity" HeaderText="Ship City" Required="true" />
            <obout:BoundField DataField="ShipRegion" HeaderText="Ship Region" />
            <obout:BoundField DataField="ShipCountry" HeaderText="Ship Country" Required="true" />
            <obout:BoundField DataField="ShipPostalCode" HeaderText="Ship Postal Code" />
            <obout:DateField DataField="OrderDate" HeaderText="Order Date" Required="true" />
            <obout:CheckBoxField DataField="Sent" HeaderText="Sent" />
            <obout:CommandField ShowInsertButton="true" ShowCancelButton="false" 
                ButtonType="Button" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </obout:CommandField>
        </Fields>
    </obout:SuperForm>

    <asp:Panel runat="server" ID="MessagePanel" Visible="false" CssClass="tdText">
        The new order has been saved to the database. <br /><br />
        Thank You!
    </asp:Panel>

    <br /><br />
    
    <span class="tdText">
        The Super Form can be used as an add-only form. In such scenario it doesn't need to be bound to a DataSourceControl.<br />
        You can handle the data provided by the end users in the <b>ItemInserting</b> server-side event.<br />
    </span>
</asp:Content>

