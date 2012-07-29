<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_commands_default.aspx.vb" Inherits="SuperForm_vb_commands_default" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET SuperForm - Default Values for Add</b></span>
    
    <br /><br />
    
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID AS [Order ID], ShipName AS [Ship Name], ShipCity AS [Ship City], ShipCountry AS [Ship Country], 
                        OrderDate AS [Order Date], Sent FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipCountry=@ShipCountry, 
                       OrderDate=@OrderDate, Sent=@Sent
                       WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, ShipCity, ShipCountry, OrderDate, Sent)
                        VALUES(@ShipName, @ShipCity, @ShipCountry, @OrderDate, @Sent)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
    </asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The Super Form allows developers to access its fields at run time. <br />
        Using this ability you can set up default values for the insert mode.<br /><br />
        In this sample we handled the <b>DataBound</b> event to access the fields <br />
        of the form and to set default values for them when the form is in insert mode.
    </span>
</asp:Content>

