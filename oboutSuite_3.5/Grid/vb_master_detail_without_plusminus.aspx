<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_master_detail_without_plusminus.aspx.vb" Inherits="Grid_vb_master_detail_without_plusminus" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        a.visible
        {
            display:;
        }
        a.hidden
        {
            display: none;
        }
        .ob_gDGEB
        {
            display: none;
        }
    </style>
    <script type="text/javascript">
        function showDetails(e, link) {
            link.className = 'hidden';
            link.nextSibling.className = 'visible';

            toggleDetail(link);

            return stopPropagation(e);
        }

        function hideDetails(e, link) {
            link.className = 'hidden';
            link.previousSibling.className = 'visible';

            toggleDetail(link);

            return stopPropagation(e);
        }

        function toggleDetail(link) {
            link.parentNode.nextSibling.firstChild.onclick();
        }

        function stopPropagation(e) {
            if (!e) { e = window.event; }
            if (!e) { return false; }
            e.cancelBubble = true;
            if (e.stopPropagation) { e.stopPropagation(); }

            return false;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">				
	<br />
	<span class="tdText"><b>ASP.NET Grid - Expand / Collapse using Hyper Links</b></span>
		
	<br /><br />
	
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
    
	<br /><br />				
		
	<span class="tdText">
		The <b>+/-</b> buttons used to expand / collapse detail grids may be replaced with other controls (buttons, hyperlinks) <br />
        using a template and a small piece of JavaScript code.
	</span>
				
	<asp:SqlDataSource runat="server" ID="sds1" ProviderName="System.Data.OleDb"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
		SelectCommand="SELECT * FROM [Customers]"
        InsertCommand="INSERT INTO Customers (CustomerID, CompanyName, ContactName, Country) VALUES(@CustomerID, @CompanyName, @ContactName, @Country)"
        UpdateCommand="UPDATE Customers SET CompanyName = @CompanyName, ContactName = @ContactName, Country=@Country WHERE CustomerID = @CustomerID"
        DeleteCommand="DELETE FROM Customers WHERE CustomerID = @CustomerID">      
		</asp:SqlDataSource>

		 
	<asp:SqlDataSource runat="server" ID="sds2" ProviderName="System.Data.OleDb"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        SelectCommand="SELECT * FROM [Orders] WHERE CustomerID = @CustomerID"
        InsertCommand="INSERT INTO Orders (CustomerID, ShipName, ShipCity, ShipCountry) VALUES(@CustomerID, @ShipName, @ShipCity, @ShipCountry)"
        UpdateCommand="UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipCountry=@ShipCountry WHERE OrderID = @OrderID"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
		<SelectParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
        </SelectParameters>
	</asp:SqlDataSource>
   
</asp:Content>


      
    
        