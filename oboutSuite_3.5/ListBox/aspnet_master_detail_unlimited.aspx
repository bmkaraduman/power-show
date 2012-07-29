<%@ Page Title="" Language="C#" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="aspnet_master_detail_unlimited.aspx.cs" Inherits="ListBox_aspnet_master_detail" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />

    <span class="tdText"><b>ASP.NET ListBox - Master / Detail with Unlimited Detail Levels</b></span>	
    
    <br /><br />
    
    <obout:ListBox runat="server" ID="CustomersCombo" Width="275" Height="150"
        DataSourceID="sds1" DataValueField="CustomerID" DataTextField="CompanyName"
        >
        <Details>
            <obout:ListBox runat="server" ID="OrdersListBox" 
                EnableLoadOnDemand="true" OnLoadingItems="OrdersListBox_LoadingItems" Width="200" Height="150"
                DataSourceID="sds2" DataValueField="OrderID" DataTextField="OrderID" 
                >
                <HeaderTemplate>
                    ORDERS
                </HeaderTemplate>
                <ItemTemplate>
                    #<%# Eval("OrderID") %>
                </ItemTemplate>
                <Details>
                    <obout:ListBox runat="server" ID="ProductsListBoxo" 
                        EnableLoadOnDemand="true" OnLoadingItems="ProductsListBox_LoadingItems" Width="200" Height="150"
                        DataSourceID="sds3" DataValueField="ProductID" DataTextField="ProductName"
                        >
                        <HeaderTemplate>
                            PRODUCTS
                        </HeaderTemplate>
                    </obout:ListBox>
                </Details>
            </obout:ListBox>
        </Details>
        <HeaderTemplate>
            CUSTOMERS
        </HeaderTemplate>
    </obout:ListBox>
    
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
        The ListBox provides a built-in master / detail feature, which allows you to organize data <br />
        from multiple data sources in the same ListBox. To set up a detail ListBox, add a new ListBox <br />
        control inside the <b>Details</b> section of the master ListBox. <br /><br />
        
        The detail ListBox supports all the features available in a regular ListBox. <br /><br />
        
        Using the <b>Details</b> property you can set up any number of detail levels. <br />
        This example showcases a ListBox with three levels, for customers, orders and products.
    </span>

</asp:Content>

