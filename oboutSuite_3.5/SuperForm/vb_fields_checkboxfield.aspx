<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_fields_checkboxfield.aspx.vb" Inherits="SuperForm_vb_fields_checkboxfield" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - CheckBoxField</b></span>
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, ShipName, ShipCity, ShipCountry, Sent
                        FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipCountry=@ShipCountry, Sent=@Sent
                       WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, ShipCity, ShipCountry, Sent)
                        VALUES(@ShipName, @ShipCity, @ShipCountry, @Sent)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
    </asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        Add <b>CheckBoxField</b> objects to the <b>Fields</b> collection to manually specify the boolean fields of a Super Form.<br />
        This type of field will render an OboutCheckBox control in view / add / edit mode, which will allow end users to modify the underlying data.<br />
        In view mode the OboutCheckBox will be disabled, to prevent end users from changing its checked state.<br /><br />

        The <b>CheckBoxField</b> class exposes some important properties:<br />
        <ul>
            <li><b>DataField</b> - gets or sets the name of the data field to bind to the CheckBoxField object.</li>
            <li><b>HeaderText</b> - gets or sets the text that is displayed as the label of the field.</li>
            <li><b>ReadOnly</b> - gets or sets a value indicating whether the field is editable in add/edit mode.</li>
        </ul>
        
        The <b>AutoGenerateRows</b> property of the Super Form needs to be set to <span class="option2">false</span> when manually defining the fields.
    </span>
</asp:Content>

