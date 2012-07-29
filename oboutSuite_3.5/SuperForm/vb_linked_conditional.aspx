<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_linked_conditional.aspx.vb" Inherits="SuperForm_vb_linked_conditional" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Conditional Linked Fields</b></span>
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 

    <asp:Panel runat="server" ID="MessagePanel" Visible="false" CssClass="tdText">
        The information has been saved into the database.        
    </asp:Panel>

    <asp:SqlDataSource ID="CountriesDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:CountriesConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CountriesConnectionString.ProviderName %>"
        SelectCommand="SELECT CountryID, CountryName FROM Country ORDER BY CountryName ASC" />

    <asp:ObjectDataSource ID="StatesDataSource" runat="server" TypeName="State" SelectMethod="GetStates" />
    
    <br /><br />
    
    <span class="tdText">
        The Super Form supports the ability of linking fields. Using this feature you can set up some of the fields<br />
        to depend on other fields. Thus these dependent fields will be enabled / disabled based on the state of the field they depend on.<br />
        For example some fields can be enabled (editable) only when a check box is checked, otherwise they will be disabled (non-editable).<br /><br />

        This example showcases the use of a <b>DropDownListField</b> ("Country") that controls two other fields, based on a condition. <br />
        When "USA" is selected in the "Country" drop down list, the "State" drop down list is enabled and the "Province" text box is disabled. <br />
        When any other country other than USA is selected in the "Country" drop down list, the "State" drop down list is disabled and the "Province" text box is enabled. <br /><br />

        The <b>DropDownListField</b> exposes various properties that are used to configure the conditional linking:<br />

        <ul>
            <li><b>FieldsToEnable</b> - gets or sets a value indicating the fields that will be enabled when some specific items are selected.</li>
            <li><b>EnablingValues</b> - gets or sets a value indicating the comma separated item values that will be used by the <b>FieldsToEnable</b> property.</li>
            <li><b>FieldsToDisable</b> - gets or sets a value indicating the fields that will be disabled when some specific items are selected.</li>
            <li><b>DisablingValues</b> - gets or sets a value indicating the comma separated item values that will be used by the <b>FieldsToDisable</b> property.</li>
        </ul>
    </span>
</asp:Content>


