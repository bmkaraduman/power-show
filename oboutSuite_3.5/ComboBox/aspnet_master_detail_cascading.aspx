<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="aspnet_master_detail_cascading.aspx.cs" Inherits="ComboBox_aspnet_master_detail" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Master / Detail - Cascading ComboBoxes</b></span>	
    
    <br /><br />
    
    <%--
	<asp:UpdatePanel runat="server" ID="CascadingPanel">
	    <ContentTemplate>	
	--%>
	
    <obout:ComboBox runat="server" ID="ComboBox1" Width="275" Height="250"
        DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID"
        EmptyText="Select a customer ..." AutoPostBack="true"
        OnSelectedIndexChanged="ComboBox1_OnSelectedIndexChanged" />
	
    <br /><br />
	
    <obout:ComboBox runat="server" ID="ComboBox2" Width="275" Enabled="false"
        DataSourceID="sds2" DataTextField="OrderID" DataValueField="OrderID"
        EmptyText="Select an order ..." AutoPostBack="true"
        OnSelectedIndexChanged="ComboBox2_OnSelectedIndexChanged" />
    
    <br /><br />
	
    <obout:ComboBox runat="server" ID="ComboBox3" Width="275" Enabled="false"
        DataSourceID="sds3" DataTextField="CompanyName" DataValueField="SupplierID"
        EmptyText="Select a customer ..." />
	
	<%--
	    </ContentTemplate>
	</asp:UpdatePanel>
	--%>
    
    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT CustomerID, CompanyName FROM Customers ORDER BY CompanyName ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		 
	 <asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID ORDER BY OrderID ASC"
	 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
	    <SelectParameters>
	        <asp:Parameter Name="CustomerID" Type="String"  />
	    </SelectParameters>
	 </asp:SqlDataSource>
	 
	 <asp:SqlDataSource runat="server" ID="sds3" SelectCommand="SELECT S.SupplierID, S.CompanyName FROM  (((Suppliers S INNER JOIN Products P ON S.SupplierID = P.SupplierID) INNER JOIN [Order Details] ON P.ProductID = [Order Details].ProductID) INNER JOIN Orders O ON [Order Details].OrderID = O.OrderID) WHERE (O.OrderID = @OrderID) ORDER BY S.CompanyName"
	 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
	    <SelectParameters>
	        <asp:Parameter Name="OrderID" Type="Int32"  />
	    </SelectParameters>
	 </asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        You can link multiple ComboBox controls in cascade. When selecting an item in a master ComboBox,<br />
        its linked detail ComboBox will be refreshed with new data based on the selection from the parent.<br />
        This is achieved by using the <b>SelectedIndexChanged</b> event of the ComboBox controls, to detect the selection changes.<br /><br />
        
        To make the feature more user friendly you can place the related ComboBoxes inside an <b>ASP.NET AJAX UpdatePanel</b> control,<br />
        and thus the ComboBoxes will be populated using AJAX requests (i.e. no full page postbacks to the server).
    </span>

</asp:Content>

