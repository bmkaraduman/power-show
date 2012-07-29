<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_templates_radiobuttonlist.aspx.vb" Inherits="SuperForm_vb_templates_radiobuttonlist" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - RadioButtonList Field</b></span>
    
    <br /><br />
    
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT CustomerID, CompanyName, ContactName, Country
                       FROM [Customers] ORDER BY CustomerID DESC"
        UpdateCommand="UPDATE Customers SET CompanyName=@CompanyName, ContactName=@ContactName, Country=@Country
                       WHERE CustomerID=@CustomerID"
        InsertCommand="INSERT INTO Customers (CustomerID, CompanyName, ContactName, Country)
                        VALUES(@CustomerID, @CompanyName, @ContactName, @Country)"
        DeleteCommand="DELETE FROM Customers WHERE CustomerID = @CustomerID">
        <UpdateParameters>
            <asp:Parameter Name="CompanyName" DbType="String" />
            <asp:Parameter Name="ContactName" DbType="String" />
            <asp:Parameter Name="Country" DbType="String" />
            <asp:Parameter Name="CustomerID" DbType="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="CustomerID" DbType="String" />
            <asp:Parameter Name="CompanyName" DbType="String" />
            <asp:Parameter Name="ContactName" DbType="String" />
            <asp:Parameter Name="Country" DbType="String" />            
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>"
        SelectCommand="SELECT * FROM Countries ORDER BY CountryName ASC" />
    
    <br /><br />
    
    <span class="tdText">
        Use the <b>TemplateField</b> class to gain full control over the layout of the field.<br /> 
        A TemplateField allows developers to specify different templates for view / add / edit modes.<br /><br />

        This example showcases the use of a TemplateField object for the "Country" field.<br />
        Using the TemplateField class we can use a RadioButtonList control to edit the data from the field.
    </span>
</asp:Content>

