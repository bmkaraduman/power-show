<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="aspnet_clientapi_external_buttons.aspx.cs" Inherits="SuperForm_aspnet_api_client_external_buttons" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .hidden-buttons
        {
            display: none;
        }        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - External Buttons</b></span>
    
    <br /><br />
    
    <obout:SuperForm ID="SuperForm1" 
        Title="Order Details"
        DataSourceID="SqlDataSource1"
        AutoGenerateRows="False"
        DataKeyNames="OrderID"
        RunAt="server"
        AllowPaging="True" AllowDataKeysInsert="False" 
        EnableModelValidation="True"
        DefaultMode="Edit"
        OnModeChanged="SuperForm1_ModeChanged">
        <Fields>
            <obout:BoundField DataField="OrderID" HeaderText="Order ID" ReadOnly="true" InsertVisible="false" FieldSetID="FieldSet1" />
            <obout:BoundField DataField="ShipName" HeaderText="Ship Name" FieldSetID="FieldSet1" />
            <obout:BoundField DataField="ShipCity" HeaderText="Ship City" FieldSetID="FieldSet1" />
            <obout:BoundField DataField="ShipCountry" HeaderText="Ship Country" FieldSetID="FieldSet1" />
            <obout:CommandField ButtonType="Button" ShowEditButton="true" ShowDeleteButton="true" ShowInsertButton="true" FieldSetID="FieldSet2" />
        </Fields>
        <FieldSets>
            <obout:FieldSetRow>
                <obout:FieldSet ID="FieldSet1" />
            </obout:FieldSetRow>
            <obout:FieldSetRow>
                <obout:FieldSet HorizontalAlign="NotSet" ID="FieldSet2" CssClass="hidden-buttons" />                
            </obout:FieldSetRow>
        </FieldSets>
    </obout:SuperForm>

    <br />

    <div style="width: 325px; text-align: center;">
        <obout:OboutButton runat="server" ID="ExternalEdit" Text="Edit" OnClientClick="SuperForm1_Button_Edit.click(); return false;" />
        <obout:OboutButton runat="server" ID="ExternalDelete" Text="Delete" OnClientClick="SuperForm1_Button_Delete.click(); return false;" />
        <obout:OboutButton runat="server" ID="ExternalNew" Text="New" OnClientClick="SuperForm1_Button_New.click(); return false;" />
        <obout:OboutButton runat="server" ID="ExternalInsert" Text="Insert" OnClientClick="SuperForm1_Button_Insert.click(); return false;" />
        <obout:OboutButton runat="server" ID="ExternalUpdate" Text="Update" OnClientClick="SuperForm1_Button_Update.click(); return false;" />
        <obout:OboutButton runat="server" ID="ExternalCancel" Text="Cancel" OnClientClick="SuperForm1_Button_Cancel.click(); return false;" />
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, ShipName, ShipCity, ShipCountry
                       FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipCountry=@ShipCountry
                       WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, ShipCity, ShipCountry)
                        VALUES(@ShipName, @ShipCity, @ShipCountry)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
    </asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        This example shows how to use external command buttons to perform actions against the form from outside it.<br />
        The standard buttons of the form are hidden from CSS, and thus they don't appear in the form anymore.<br />
        When the external buttons are pressed, a click action is simulated for the hidden buttons of the form,<br />
        and thus the form behaves in the exact same manner as when its standard buttons are pressed.<br />
        To simulate a click on the command buttons of the form, we can access them on the client-side using these IDs:<br />

        <ul>
            <li>[form ID]<b>_Button_Cancel</b> - the "Cancel" button. For example: <span class="option2">SuperForm1_Button_Cancel.click();</span></li>
            <li>[form ID]<b>_Button_Delete</b> - the "Delete" button. For example: <span class="option2">SuperForm1_Button_Delete.click();</span></li>
            <li>[form ID]<b>_Button_Edit</b> - the "Edit" button. For example: <span class="option2">SuperForm1_Button_Edit.click();</span></li>
            <li>[form ID]<b>_Button_Insert</b> - the "Insert" button. For example: <span class="option2">SuperForm1_Button_Insert.click();</span></li>
            <li>[form ID]<b>_Button_New</b> - the "New" button. For example: <span class="option2">SuperForm1_Button_New.click();</span></li>
            <li>[form ID]<b>_Button_Update</b> - the "Update" button. For example: <span class="option2">SuperForm1_Button_Update.click();</span></li>
        </ul>
    </span>
</asp:Content>

