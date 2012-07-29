<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_filtering_datepicker.aspx.vb" Inherits="Grid_vb_filtering_datepicker" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Filter with Date Picker</b></span>		
	
    <br /><br />

    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 25 [OrderID], [ShipName], [OrderDate], [ShippedDate], [RequiredDate], [ShipCountry] FROM [Orders] ORDER BY OrderID DESC"
        InsertCommand="INSERT INTO Orders(ShipName, OrderDate, ShippedDate, RequiredDate, ShipCountry) VALUES(@ShipName, @OrderDate, @ShippedDate, @RequiredDate, @ShipCountry)"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, OrderDate=@OrderDate, ShippedDate=@ShippedDate, RequiredDate=@RequiredDate, ShipCountry=@ShipCountry WHERE OrderID=@OrderID"
        DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID">
        <InsertParameters>
            <asp:Parameter Name="ShipName" Type="String" />
            <asp:Parameter Name="OrderDate" Type="DateTime" />
            <asp:Parameter Name="ShippedDate" Type="DateTime" />
             <asp:Parameter Name="RequiredDate" Type="DateTime" />
            <asp:Parameter Name="ShipCountry" Type="String" />                
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ShipName" Type="String" />
            <asp:Parameter Name="OrderDate" Type="DateTime" />
            <asp:Parameter Name="ShippedDate" Type="DateTime" />
            <asp:Parameter Name="RequiredDate" Type="DateTime" />
            <asp:Parameter Name="ShipCountry" Type="String" />
            <asp:Parameter Name="OrderID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="OrderID" Type="Int32" />                
        </DeleteParameters>
    </asp:SqlDataSource>

    <br />

    <span class="tdText">
        This example showcases the use of a <b>date picker</b> for filtering DateTime columns.<br />
        Use the <b>TemplateSettings.FilterTemplateId</b> property of the Column class to<br />
        specify a template for the filter cell of that column. 
    </span>
</asp:Content>