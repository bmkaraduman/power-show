<%@ Page Title="" Language="C#" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="aspnet_master_detail_cascading.aspx.cs" Inherits="ListBox_aspnet_master_detail" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Master / Detail - Cascading ListBoxes</b></span>	
    
    <br /><br />
    
    <%--
	<asp:UpdatePanel runat="server" ID="CascadingPanel">
	    <ContentTemplate>	
	--%>
	
    <obout:ListBox runat="server" ID="ListBox1" Width="275" Height="200"
        DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID"
        AutoPostBack="true"
        OnSelectedIndexChanged="ListBox1_OnSelectedIndexChanged">
        <HeaderTemplate>
            CUSTOMERS
        </HeaderTemplate>
    </obout:ListBox>
	
	&#160;&#160;&#160;
    
    <obout:ListBox runat="server" ID="ListBox2" Width="200" Height="200" Enabled="false"
        DataSourceID="sds2" DataTextField="OrderID" DataValueField="OrderID"
        AutoPostBack="true"
        OnSelectedIndexChanged="ListBox2_OnSelectedIndexChanged">
        <HeaderTemplate>
            ORDERS
        </HeaderTemplate>
    </obout:ListBox>
    
    &#160;&#160;&#160;
    
    <obout:ListBox runat="server" ID="ListBox3" Width="200" Height="200" Enabled="false"
        DataSourceID="sds3" DataTextField="CompanyName" DataValueField="SupplierID">
        <HeaderTemplate>
            SUPPLIERS
        </HeaderTemplate>
    </obout:ListBox>
	
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
        You can link multiple ListBox controls in cascade. When selecting an item in a master ListBox,<br />
        its linked detail ListBox will be refreshed with new data based on the selection from the parent.<br />
        This is achieved by using the <b>SelectedIndexChanged</b> event of the ListBox controls, to detect the selection changes.<br /><br />
        
        To make the feature more user friendly you can place the related ListBoxes inside an <b>ASP.NET AJAX UpdatePanel</b> control,<br />
        and thus the ListBoxes will be populated using AJAX requests (i.e. no full page postbacks to the server).
    </span>

</asp:Content>

