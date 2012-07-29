<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="cs_layout_direction.aspx.cs" Inherits="SuperForm_cs_layout_direction" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Vertical / Horizontal Direction</b></span>
    
    <br /><br />

    <obout:OboutRadioButton runat="server" ID="VerticalDirection" Text="Vertical Direction" 
        OnCheckedChanged="SetDirection" GroupName="Group1" AutoPostBack="true" />
    
    <br />
    
    <obout:OboutRadioButton runat="server" ID="HorizontalDirection" Text="Horizontal Direction" 
        OnCheckedChanged="SetDirection" GroupName="Group1" Checked="true" AutoPostBack="true" />

    <br /><br />
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, ShipName, ShipCountry, OrderDate FROM [Orders]"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCountry=@ShipCountry, OrderDate=@OrderDate
                         WHERE OrderID=@OrderID"
        DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID" />

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
                SelectCommand="SELECT DISTINCT ShipCountry FROM [Orders] ORDER BY ShipCountry ASC" />

    <br /><br />
    
    <span class="tdText">
        The fields of the Super Form can be arranged one underneath the other (vertical direction) or one near the other (horizontal direction).<br />
        Use the <b>Direction</b> property of the Super Form to change the way the fields are arranged.<br />
        Possible values: <b>Direction.Vertical</b> and <b>Direction.Horizontal</b>
    </span>
</asp:Content>

