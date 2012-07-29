<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_fields_datefield_time.aspx.vb" Inherits="SuperForm_vb_fields_datefield_time" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - DateField with Time Selector</b></span>
    
    <br /><br />
    
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, ShipName, OrderDate, ShippedDate, RequiredDate
                        FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, OrderDate=@OrderDate, ShippedDate=@ShippedDate, RequiredDate=@RequiredDate
                       WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, OrderDate, ShippedDate, RequiredDate)
                        VALUES(@ShipName, @OrderDate, @ShippedDate, @RequiredDate)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID" />
    
    <br /><br />
    
    <span class="tdText">
        Add <b>DateField</b> objects to the <b>Fields</b> collection to manually specify the Date / DateTime fields of a Super Form.<br />
        This type of field will render an OboutTextBox control and an Obout Calendar control in add / edit mode, which will allow end users to modify the underlying data.<br />
        The Calendar control is configured to work in date picker mode and it is linked to the OboutTextBox control.<br /><br />

        The <b>DateField</b> class exposes some important properties:<br />
        <ul>
            <li><b>DataField</b> - gets or sets the name of the data field to bind to the CheckBoxField object.</li>
            <li><b>HeaderText</b> - gets or sets the text that is displayed as the label of the field.</li>
            <li><b>ReadOnly</b> - gets or sets a value indicating whether the field is editable in add/edit mode.</li>
            <li><b>DataFormatString</b> - gets or sets the string that specifies the display format for the value of the field.</li>
            <li><b>ApplyFormatInEditMode</b> - gets or sets a value indicating whether the formatting string specified by the <b>DataFormatString</b> property <br /> is applied to field values in edit mode.</li>
        </ul>
        
        The <b>AutoGenerateRows</b> property of the Super Form needs to be set to <span class="option2">false</span> when manually defining the fields.<br /><br />

        In this sample we used an event handler for the <b>DataBound</b> event to access the underlying Obout Calendar controls for the three DateField fields.<br />        
        Thus, the Obout calendar controls were customized to allow time selection, by configuring their <b>ShowTimeSelector</b> and <b>DateFormat</b> properties.
    </span>
</asp:Content>


    

 

