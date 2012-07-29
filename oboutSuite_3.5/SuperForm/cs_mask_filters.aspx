<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="cs_mask_filters.aspx.cs" Inherits="SuperForm_cs_mask_filters" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Filters</b></span>
    
    <br /><br />

    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
    
   <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT ProductID, ProductName, UnitsInStock, UnitsOnOrder FROM [Products] ORDER BY ProductID DESC"
        UpdateCommand="UPDATE Products SET ProductName=@ProductName, 
                        UnitsInStock=@UnitsInStock, UnitsOnOrder=@UnitsOnOrder WHERE ProductID=@ProductID"
        InsertCommand="INSERT INTO Products (ProductName, UnitsInStock, UnitsOnOrder) 
                        VALUES (@ProductName, @UnitsInStock, @UnitsOnOrder)"
        DeleteCommand="DELETE FROM Products WHERE ProductID=@ProductID"
        />
    
    <br /><br />
    
    <span class="tdText">
        The Super Form provides built-in support for attaching ASP.NET AJAX ControlToolkit FilteredTextBoxExtender controls to the fields of the form.<br />
        Using this feature, you can enhance the experience of your end users and increase the usability of the form.<br /><br />
        
        Use the <b>Filters</b> collection to add extenders to the fields of the form.<br /><br />

        This example showcases the use of various types of filters:<br />
        <ul>
            <li><b>Numbers</b> - for the "Units In Stock" and "Units On Order" fields - only numbers are allowed.</li>
            <li><b>LowercaseLetters,UppercaseLetters,Custom</b> - for the "Product Name" field - only letters and spaces are allowed.</li>
        </ul>
        <br />
        To see the filters in action, click in any of these fields and start typing something.
    </span>
</asp:Content>

