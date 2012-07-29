<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_validation_dropdownlistfield.aspx.vb" Inherits="SuperForm_vb_validation_required" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Validate Custom DropDownListField</b></span>
    
    <br /><br />
    
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, O.CustomerID, ShipCountry, C.CompanyName FROM [Orders] O 
                        INNER JOIN Customers C ON C.CustomerID = O.CustomerID ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET CustomerID = @CustomerID, ShipCountry=@ShipCountry
                         WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (CustomerID, ShipCountry)
                        VALUES(@CustomerID, @ShipCountry)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT DISTINCT ShipCountry FROM [Orders] ORDER BY ShipCountry ASC" />

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT CustomerID, CompanyName FROM Customers ORDER BY CompanyName ASC" />
    
    <br /><br />
    
    <span class="tdText">
        This example showcases the use of custom DropDownListField fields, for which we added extra items at runtime <br />
        ("Select a customer ..." and "Select a country ..."). The <b>Validators</b> collection is used to set up a <b>RequiredFieldValidator</b><br />
        for both fields in such a way to detect when the users select one of the "Select ..." items and prevent them from saving the changes<br />
        unless they select a correct item.
    </span>
</asp:Content>


   