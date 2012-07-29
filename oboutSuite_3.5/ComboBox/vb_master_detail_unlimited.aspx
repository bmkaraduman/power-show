<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_master_detail_unlimited.aspx.vb" Inherits="ComboBox_vb_master_detail_unlimited" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Master / Detail with Unlimited Detail Levels</b></span>	
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" />     
    
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT CustomerID, CompanyName FROM Customers ORDER BY CompanyName"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		    
    <asp:SqlDataSource ID="sds2" runat="server" SelectCommand="SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID ORDER BY OrderID ASC"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
	    <SelectParameters>
	        <asp:Parameter Name="CustomerID" Type="String" />
	    </SelectParameters>	    
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="sds3" runat="server" 
        SelectCommand="SELECT P.ProductID, P.ProductName FROM Products P INNER JOIN [Order Details] OD ON P.ProductID = OD.ProductID WHERE OD.OrderID = @OrderID"
	    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
	    <SelectParameters>
	        <asp:Parameter Name="OrderID" Type="Int32" />
	    </SelectParameters>	    
    </asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ComboBox provides a built-in master / detail feature, which allows you to organize data <br />
        from multiple data sources in the same ComboBox. To set up a detail ComboBox, add a new ComboBox <br />
        control inside the <b>Details</b> section of the master ComboBox. <br /><br />
        
        The detail ComboBox supports all the features available in a regular ComboBox. <br /><br />
        
        Using the <b>Details</b> property you can set up any number of detail levels. <br />
        This example showcases a ComboBox with three levels, for customers, orders and products.
    </span>
</asp:Content>

