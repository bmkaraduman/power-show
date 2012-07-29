<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="cs_layout_field_sets_span.aspx.cs" Inherits="SuperForm_cs_layout_field_sets_span" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.Popups" TagPrefix="obout" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Field Sets with Column Span</b></span>
    
    <br /><br />
    
     <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
     
     <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, ShipName, ShipCity, OrderDate, ShipCountry, AdditionalInformationHTML FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, OrderDate=@OrderDate, ShipCountry=@ShipCountry, AdditionalInformationHTML=@AdditionalInformationHTML
                         WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, ShipCity, OrderDate, ShipCountry, AdditionalInformationHTML) VALUES (@ShipName, @ShipCity, @OrderDate, @ShipCountry, @AdditionalInformationHTML)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID">
        <UpdateParameters>
            <asp:Parameter Name="ShipName" DbType="String" />
            <asp:Parameter Name="ShipCity" DbType="String" />
            <asp:Parameter Name="OrderDate" DbType="DateTime" />            
            <asp:Parameter Name="ShipCountry" DbType="String" />
            <asp:Parameter Name="AdditionalInformationHTML" DbType="String" />
            <asp:Parameter Name="OrderID" DbType="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ShipName" DbType="String" />
            <asp:Parameter Name="ShipCity" DbType="String" />
            <asp:Parameter Name="OrderDate" DbType="DateTime" />            
            <asp:Parameter Name="ShipCountry" DbType="String" />
            <asp:Parameter Name="AdditionalInformationHTML" DbType="String" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT DISTINCT ShipCountry FROM [Orders] ORDER BY ShipCountry ASC" />
    
    <br /><br />
    
    <span class="tdText">
        The fields of the Super Form can be grouped in field sets. Use the <b>FieldSets</b> collection to define field sets for the form.<br />
        The field sets are grouped in field set rows, which allow developers to organize the field sets in a tabular structure.<br />
        To designate a field as member of a field set, use the <b>FieldSetID</b> property of the field.<br /><br />
        A field set can span multiple columns. Use the <b>ColumnSpan</b> property of the <b>FieldSet</b> class to force a field set to span on more than one column.
    </span>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .ob_fRwF span
        {
            position: static !important;            
        }
        
        td.field-set
        {
            padding-left: 0px !important;
            padding-right:0px !important;
            padding-bottom: 0px !important;
            padding-top: 0px !important;
        }
        
        td.field-set .ob_fRwH, td.field-set .ob_fRwF
        {
            padding-bottom: 0px !important;
            padding-top: 0px !important;
        }
    </style>
</asp:Content>

