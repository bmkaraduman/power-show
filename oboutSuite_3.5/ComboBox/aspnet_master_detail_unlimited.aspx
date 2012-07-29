<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="aspnet_master_detail_unlimited.aspx.cs" Inherits="ComboBox_aspnet_master_detail" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Master / Detail with Unlimited Detail Levels</b></span>	
    
    <br /><br />
        
    <obout:ComboBox runat="server" ID="CustomersCombo" AutoClose="false" Width="275" Height="150"
        DataSourceID="sds1" DataValueField="CustomerID" DataTextField="CompanyName"
        EmptyText="Select a product ..."
        >
        <Details>
            <obout:ComboBox runat="server" ID="OrdersCombo" 
                EnableLoadOnDemand="true" OnLoadingItems="OrdersCombo_LoadingItems" Width="200" Height="150"
                DataSourceID="sds2" DataValueField="OrderID" DataTextField="OrderID" AutoClose="false"
                EmptyText="Select a product ...">
                <HeaderTemplate>
                    ORDERS
                </HeaderTemplate>
                <ItemTemplate>
                    #<%# Eval("OrderID") %>
                </ItemTemplate>
                <Details>
                    <obout:ComboBox runat="server" ID="ProductsCombo" 
                        EnableLoadOnDemand="true" OnLoadingItems="ProductsCombo_LoadingItems" Width="200" Height="150"
                        DataSourceID="sds3" DataValueField="ProductID" DataTextField="ProductName"
                        EmptyText="Select a product ...">
                        <HeaderTemplate>
                            PRODUCTS
                        </HeaderTemplate>
                    </obout:ComboBox>
                </Details>
            </obout:ComboBox>
        </Details>
        <HeaderTemplate>
            CUSTOMERS
        </HeaderTemplate>
    </obout:ComboBox>
    
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

