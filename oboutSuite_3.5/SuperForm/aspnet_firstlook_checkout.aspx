<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="aspnet_firstlook_checkout.aspx.cs" Inherits="SuperForm_aspnet_firstlook_checkout" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

    <%--
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
    --%>
    
    <span class="tdText"><b>ASP.NET Super Form - Checkout</b></span>
    
    <br /><br />

    <obout:SuperForm ID="SuperForm1" 
        Width="630" Title="Payment Information"
        AutoGenerateRows="false"
        RunAt="server"
        DefaultMode="Insert"
        FolderStyle="styles/black_glass"
        OnItemInserting="SuperForm1_Inserting"
        OnDataBound="SuperForm1_DataBound">
        <Fields>
            <obout:BoundField DataField="CardNumber" HeaderText="Card Number" FieldSetID="FieldSet2" Required="true" ControlStyle-Width="150">
                <%--
                <Masks>
                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="9999-9999-9999-9999" MessageValidatorTip="true" MaskType="Number" />
                </Masks>
                --%>
            </obout:BoundField>            
            <obout:DropDownListField DataField="ExpirationYear" HeaderText="Expiration Year" FieldSetID="FieldSet2" ControlStyle-Width="93px" Required="true" />
            <obout:DropDownListField DataField="ExpirationMonth" HeaderText="Expiration Month" FieldSetID="FieldSet2" ControlStyle-Width="117px" Required="true" />
            <obout:BoundField DataField="CIN" HeaderText="Security Code" FieldSetID="FieldSet2" ControlStyle-Width="83px" Required="true" MaxLength="3">
               <%--
               <Filters>
                    <ajaxToolkit:FilteredTextBoxExtender runat="server" FilterType="Numbers" />
                </Filters>
               --%>
            </obout:BoundField>

            <obout:TemplateField FieldSetID="FieldSet3" ItemStyle-Width="150px">
                <ItemTemplate>&#160;</ItemTemplate>
            </obout:TemplateField>

            <obout:CheckBoxField DataField="SameAsBilling" FieldSetID="FieldSet4" Text="Same as the billing" ItemStyle-Width="150px"
                FieldsToDisable="UserCompanyName,UserFirstName,UserLastName,UserEmailAddress,UserAddress,UserCountryID,UserStateID,UserProvince,UserZip,UserVatID,UserPhone,UserFax" />

            <obout:BoundField DataField="BillingCompanyName" HeaderText="Company Name" FieldSetID="FieldSet3" />
            <obout:BoundField DataField="BillingFirstName" HeaderText="First Name" FieldSetID="FieldSet3" Required="true" />
            <obout:BoundField DataField="BillingLastName" HeaderText="Last Name" FieldSetID="FieldSet3" Required="true" />
            <obout:BoundField DataField="BillingEmailAddress" HeaderText="Email Address" FieldSetID="FieldSet3" Required="true" />
            <obout:MultiLineField DataField="BillingAddress" HeaderText="Address" FieldSetID="FieldSet3" Required="true" />
            <obout:DropDownListField DataField="BillingCountryID" HeaderText="Country" FieldSetID="FieldSet3" Required="true"
                DataSourceID="CountriesDataSource" DataValueField="CountryID" DataTextField="CountryName" Default="219"
                FieldsToEnable="BillingStateID" EnablingValues="219" FieldsToDisable="BillingProvince" DisablingValues="219"  />
            <obout:DropDownListField DataField="BillingStateID" HeaderText="State" FieldSetID="FieldSet3" Required="true"
                DataSourceID="StatesDataSource" DataValueField="State" DataTextField="State" />
            <obout:BoundField DataField="BillingProvince" FieldSetID="FieldSet3" />
            <obout:BoundField DataField="BillingZip" HeaderText="Zip Code" FieldSetID="FieldSet3" />
            <obout:BoundField DataField="BillingVatID" HeaderText="VAT Exemption ID" FieldSetID="FieldSet3" />
            <obout:BoundField DataField="BillingPhone" HeaderText="Phone" FieldSetID="FieldSet3">
                <%--
                <Masks>
                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender2" runat="server" Mask="(999)999-9999" MaskType="Number" />
                </Masks>
                --%>
            </obout:BoundField>
            <obout:BoundField DataField="BillingFax" HeaderText="Fax" FieldSetID="FieldSet3">
                <%--
                <Masks>
                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender3" runat="server" Mask="(999)999-9999" MaskType="Number" />
                </Masks>
                --%>
            </obout:BoundField>


            <obout:BoundField DataField="UserCompanyName" HeaderText="Company Name" FieldSetID="FieldSet4" />
            <obout:BoundField DataField="UserFirstName" HeaderText="First Name" FieldSetID="FieldSet4" Required="false" />
            <obout:BoundField DataField="UserLastName" HeaderText="Last Name" FieldSetID="FieldSet4" Required="false" />
            <obout:BoundField DataField="UserEmailAddress" HeaderText="Email Address" FieldSetID="FieldSet4" Required="false" />
            <obout:MultiLineField DataField="UserAddress" HeaderText="Address" FieldSetID="FieldSet4" Required="false" />
            <obout:DropDownListField DataField="UserCountryID" HeaderText="Country" FieldSetID="FieldSet4" Required="false"
                DataSourceID="CountriesDataSource" DataValueField="CountryID" DataTextField="CountryName" Default="219"
                FieldsToEnable="UserStateID" EnablingValues="219" FieldsToDisable="UserProvince" DisablingValues="219"  />
            <obout:DropDownListField DataField="UserStateID" HeaderText="State" FieldSetID="FieldSet4" Required="false"
                DataSourceID="StatesDataSource" DataValueField="State" DataTextField="State" />
            <obout:BoundField DataField="UserProvince" FieldSetID="FieldSet4" />
            <obout:BoundField DataField="UserZip" HeaderText="Zip Code" FieldSetID="FieldSet4" />
            <obout:BoundField DataField="UserVatID" HeaderText="VAT Exemption ID" FieldSetID="FieldSet4" />
            <obout:BoundField DataField="UserPhone" HeaderText="Phone" FieldSetID="FieldSet4">
                <%--
                <Masks>
                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender4" runat="server" Mask="(999)999-9999" MaskType="Number" />
                </Masks>
                --%>
            </obout:BoundField>
            <obout:BoundField DataField="UserFax" HeaderText="Fax" FieldSetID="FieldSet4">
                <%--
                <Masks>
                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender5" runat="server" Mask="(999)999-9999" MaskType="Number" />
                </Masks>
                --%>
            </obout:BoundField>


            <obout:CommandField ShowInsertButton="true" InsertText="Buy Now" ShowCancelButton="false" ButtonType="Button" 
                ItemStyle-HorizontalAlign="Center" FieldSetID="CommandFields" />
        </Fields>
        <FieldSets>
            <obout:FieldSetRow>
                <obout:FieldSet ID="FieldSet2" Direction="Horizontal" ColumnSpan="2" />                
            </obout:FieldSetRow>
            <obout:FieldSetRow>
                <obout:FieldSet ID="FieldSet3" Title="Billing Information" />
                <obout:FieldSet ID="FieldSet4" Title="End-User Information" />
            </obout:FieldSetRow>
            <obout:FieldSetRow>
                <obout:FieldSet ID="CommandFields" ColumnSpan="2" HorizontalAlign="Center" />
            </obout:FieldSetRow>
        </FieldSets>
    </obout:SuperForm>

    <asp:Panel runat="server" ID="MessagePanel" Visible="false" CssClass="tdText">
        Thank you for your order. <br /><br />
        You will receive an e-mail confirmation soon.
    </asp:Panel>

    <asp:SqlDataSource ID="CountriesDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:CountriesConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CountriesConnectionString.ProviderName %>"
        SelectCommand="SELECT CountryID, CountryName FROM Country ORDER BY CountryName ASC" />

    <asp:ObjectDataSource ID="StatesDataSource" runat="server" TypeName="State" SelectMethod="GetStates" />

    <br /><br />
    
    <span class="tdText">
        The Super Form exposes many built-in features that allow developers to quickly generate complex forms <br />
        without writing any line of code (everything can be done at design time).

        Some of the features showcased in this example are:<br />

        <ul>
            <li>Generation of Interface Controls instead of standard ASP.NET input fields;</li>
            <li>Built-in validation;</li>
            <li>Support for edit masks & filters;</li>
            <li>Ability to group fields into field sets;</li>
            <li>Horizontal or vertical direction for fields.</li>
        </ul>
    </span>
</asp:Content>

