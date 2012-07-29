<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_linked_enable_buttons.aspx.vb" Inherits="SuperForm_vb_linked_enable_buttons" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET SuperForm - Enable / Disable Command Buttons</b></span>
    
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
        By default, all the command buttons (Edit, Update, Insert etc.) of the SuperForm are enabled.<br />
        By setting the <b>EnableButtonsOnChange</b> property to <span class="option2">true</span> the "Update" and "Insert" buttons <br />
        will initially be disabled. They will automatically be enabled after the users make any change to the form fields.<br />
        This feature prevents the end users from submitting the form if they didn't make any change.
    </span>
</asp:Content>

