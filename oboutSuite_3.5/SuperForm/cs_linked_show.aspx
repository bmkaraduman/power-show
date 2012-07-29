<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="cs_linked_show.aspx.cs" Inherits="SuperForm_cs_linked_show" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Show / Hide Linked Fields</b></span>
    
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
        to depend on other fields. Thus these dependent fields will be shown / hidden based on the state of the field they depend on.<br />
        For example some fields can be shown only when a check box is checked, otherwise they will be hidden.<br /><br />

        This example showcases the use of a <b>CheckBoxField</b> ("Discontinued") that controls three other fields. <br />
        When "Discontinued" is checked, "UnitPrice", "UnitsInStock" and "UnitsOnOrder" are hidden. <br />
        These fields will become visible when "Discontinued" is unchecked. <br /><br />        

        Use the <b>FieldsToEnable</b> property of all the field classes to specify the collapsed fields that will be shown when the state of the field is changed.<br /><br />

        Use the <b>FieldsToEnable</b> property of the <b>CheckBoxField</b> class to specify the collapsed fields that will be shown when the CheckBox is checked.<br />
        Use the <b>FieldsToDisable</b> property of the <b>CheckBoxField</b> class to specify the collapsed fields that will be hidden when the CheckBox will be checked.<br /><br />

        Setting only these properties for the controlling fields will only make the controlled (dependent) fields be enabled / disabled.<br />
        In order to make the dependent fields be shown / hidden as well, you need to designate them as collapsable by setting their <b>Collapsed</b> property to <span class="option2">true</span>.
    </span>
</asp:Content>


