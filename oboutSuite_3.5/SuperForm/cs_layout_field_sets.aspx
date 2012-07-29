<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="cs_layout_field_sets.aspx.cs" Inherits="SuperForm_cs_layout_field_sets" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Fields Grouped in Field Sets</b></span>
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, ShipName, ShipCity, OrderDate, ShippedDate, RequiredDate FROM [Orders]"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, OrderDate=@OrderDate, ShippedDate=@ShippedDate, RequiredDate=@RequiredDate
                         WHERE OrderID=@OrderID"
        DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID">
        <UpdateParameters>
            <asp:Parameter Name="ShipName" DbType="String" />
            <asp:Parameter Name="ShipCity" DbType="String" />
            <asp:Parameter Name="OrderDate" DbType="DateTime" />            
            <asp:Parameter Name="ShippedDate" DbType="DateTime" />
            <asp:Parameter Name="RequiredDate" DbType="DateTime" />
            <asp:Parameter Name="OrderID" DbType="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The fields of the Super Form can be grouped in field sets. Use the <b>FieldSets</b> collection to define field sets for the form.<br />
        The field sets are grouped in field set rows, which allow developers to organize the field sets in a tabular structure.<br />
        To designate a field as member of a field set, use the <b>FieldSetID</b> property of the field.
    </span>
    <style type="text/css">
        .field-set
        {
            padding: 10px;
        }        
     </style>
</asp:Content>

