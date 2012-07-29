<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="cs_validation_required.aspx.cs" Inherits="SuperForm_cs_validation_required" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Required Fields</b></span>
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, ShipName, ShipCity, ShipCountry, OrderDate FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipCountry=@ShipCountry, OrderDate=@OrderDate WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, ShipCity, ShipCountry, OrderDate) VALUES (@ShipName, @ShipCity, @ShipCountry, @OrderDate)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID" />
    
    <br /><br />
    
    <span class="tdText">
        The Super Form allows developers to validate the data typed by the end users into the fields using various approaches.<br /><br />
        One of the most common forms of validation is the "required" validation which verifies whether a value has been typed into a mandatory field. <br />
        To designate a field as required / mandatory simply set its <b>Required</b> property to <span class="option2">true</span>.<br />
        By default, if a field fails the required validation, an asterisk will be displayed near the field.<br />
        You can change this validation message by using the <b>RequiredErrorMessage</b> property, <br />
        which allows you to set up the error message for the required validation for every field for the form.
    </span>
</asp:Content>

