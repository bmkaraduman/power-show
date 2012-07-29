<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_validation_type.aspx.vb" Inherits="SuperForm_vb_validation_type" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET SuperForm - Required Fields</b></span>
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" />
 
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, ShipName, ShipCity, ShipCountry, OrderDate, ShippedDate, RequiredDate, Freight FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCountry=@ShipCountry, 
                        OrderDate=@OrderDate, ShippedDate=@ShippedDate, RequiredDate=@RequiredDate, Freight=@Freight WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, ShipCountry, OrderDate, ShippedDate, RequiredDate, Freight) 
                        VALUES (@ShipName, @ShipCountry, @OrderDate, @ShippedDate, @RequiredDate, @Freight)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID"
        />    
    
    <br /><br />
    
    <span class="tdText">
        The SuperForm allows developers to validate the data typed by the end users into the fields using various approaches.<br />
        You can add any number of validators to a field, by means of the <b>Validators</b> collection.<br /><br />

        This sample showcases the use of the <b>RangeValidator</b> control for validating dates and numbers.
    </span>
</asp:Content>

