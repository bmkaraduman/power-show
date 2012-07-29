<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="cs_scroll_horizontal_dynamic.aspx.cs" Inherits="Grid_cs_scroll_horizontal_dynamic" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Dynamic horizontal scrolling</b></span>		
	
    <br /><br />

    <obout:OboutButton ID="OboutButton1" runat="server" Text="Load Suppliers" OnClick="LoadSuppliers" />
    <obout:OboutButton ID="OboutButton2" runat="server" Text="Load Products" OnClick="LoadProducts" />
    <obout:OboutButton ID="OboutButton3" runat="server" Text="Load Orders" OnClick="LoadOrders" />
    <obout:OboutButton ID="OboutButton4" runat="server" Text="Load Customers" OnClick="LoadCustomers" />    
	
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	

    <script type="text/javascript">
        oboutGrid.prototype._initializeScrollingSettings = oboutGrid.prototype.initializeScrollingSettings;
        oboutGrid.prototype.initializeScrollingSettings = function () {
            this._initializeScrollingSettings();

            var width = this._getColumnWidth();
            if (width > 0) {
                var scrollWidth = parseInt(this.ScrollWidth);
                if (width < scrollWidth) {
                    this.GridMainContainer.style.width = width + 'px';
                }
            }
        }

        oboutGrid.prototype._getColumnWidth = function () {
            var totalWidth = 0;
            for (var i = 0; i < this.ColumnsCollection.length; i++) {
                if (this.ColumnsCollection[i].Visible) {
                    totalWidth += this.ColumnsCollection[i].Width;
                }
            }

            return totalWidth;
        }
    </script>

    <asp:SqlDataSource runat="server" ID="SqlDataSource1" SelectCommand="SELECT TOP 25 CompanyName, City, Country FROM Suppliers"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="SqlDataSource2" SelectCommand="SELECT TOP 25 ProductName, UnitPrice FROM Products"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="SqlDataSource3" SelectCommand="SELECT TOP 25 OrderID, ShipName, ShipCity, ShipPostalCode, ShipCountry FROM Orders"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="SqlDataSource4" SelectCommand="SELECT TOP 25 * FROM Customers"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

    <br />

    <div class="tdText" style="width: 600px;">
        This sample shows how the horizontal scrolling feature of the Grid can be made dynamic based on the number of columns it contains.
        As you can see, if the sum of the column widths is less than the pixel amount specified with the <b>ScrollWidth</b> property
        the Grid will reduce its size accordingly. If there are many columns the Grid will have the width specified using <b>ScrollWidth</b>.
        <br /><br />
        Click on "Load Suppliers" or "Load Products" to see the Grid without horizontal scrolling (only a few columns are loaded).
        Click on "Load Orders" or "Load Customers" to see the Grid with horizontal scrolling (many columns are loaded).

    </div>
</asp:Content>

