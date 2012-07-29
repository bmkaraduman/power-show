<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_linked_enable.aspx.vb" Inherits="SuperForm_vb_linked_enable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Enable / Disable Linked Fields</b></span>
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT ProductID, ProductName, Discontinued, UnitPrice, UnitsInStock, UnitsOnOrder FROM [Products] ORDER BY ProductID DESC"
        UpdateCommand="UPDATE Products SET ProductName=@ProductName, Discontinued=@Discontinued, UnitPrice=@UnitPrice, 
                        UnitsInStock=@UnitsInStock, UnitsOnOrder=@UnitsOnOrder WHERE ProductID=@ProductID"
        InsertCommand="INSERT INTO Products (ProductName, Discontinued, UnitPrice, UnitsInStock, UnitsOnOrder) 
                        VALUES (@ProductName, @Discontinued, @UnitPrice, @UnitsInStock, @UnitsOnOrder)"
        DeleteCommand="DELETE FROM Products WHERE ProductID=@ProductID"
        />    
    
    <br /><br />
    
    <span class="tdText">
        The Super Form supports the ability of linking fields. Using this feature you can set up some of the fields<br />
        to depend on other fields. Thus these dependent fields will be enabled / disabled based on the state of the field they depend on.<br />
        For example some fields can be enabled (editable) only when a check box is checked, otherwise they will be disabled (non-editable).<br /><br />

        This example showcases the use of a <b>CheckBoxField</b> ("Discontinued") that controls three other fields. <br />
        When "Discontinued" is checked, "UnitPrice", "UnitsInStock" and "UnitsOnOrder" are disabled (non-editable). <br />
        These fields will become enabled (editable) when "Discontinued" is unchecked. <br /><br />

        Use the <b>FieldsToEnable</b> property of all the field classes to specify the fields that will be enabled when the state of the field is changed.<br /><br />

        Use the <b>FieldsToEnable</b> property of the <b>CheckBoxField</b> class to specify the fields that will be enabled when the CheckBox is checked.<br />
        Use the <b>FieldsToDisable</b> property of the <b>CheckBoxField</b> class to specify the fields that will be disabled when the CheckBox will be checked.<br />
    </span>
</asp:Content>

