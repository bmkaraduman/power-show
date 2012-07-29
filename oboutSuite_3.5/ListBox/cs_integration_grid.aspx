<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" CodeFile="cs_integration_grid.aspx.cs" Inherits="ListBox_cs_integration_grid"%>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function Grid1_BeforeDelete(sender, record) {
            return confirm("Are you sure you want to delete this record?");
        }
    </script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - ListBox Inside Grid</b></span>	
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="Grid1Container" /> 
    

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        SelectCommand="SELECT TOP 100 OrderID, ShipName, ShipPostalCode, ShipCity, ShipCountry FROM Orders ORDER BY OrderID DESC"
        InsertCommand="INSERT INTO Orders (ShipName, ShipPostalCode, ShipCity, ShipCountry) VALUES (@ShipName, @ShipPostalCode, @ShipCity, @ShipCountry)"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipPostalCode=@ShipPostalCode, ShipCity=@ShipCity, ShipCountry=@ShipCountry WHERE OrderID = @OrderID"
        DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" 
		ProviderName="System.Data.OleDb">
		<InsertParameters>
		    <asp:Parameter Name="ShipName" Type="String" />
		    <asp:Parameter Name="ShipPostalCode" Type="String" />
		    <asp:Parameter Name="ShipCity" Type="String" />
		    <asp:Parameter Name="ShipCountry" Type="String" />
		</InsertParameters>
		<UpdateParameters>
		    <asp:Parameter Name="ShipName" Type="String" />
		    <asp:Parameter Name="ShipPostalCode" Type="String" />
		    <asp:Parameter Name="ShipCity" Type="String" />
		    <asp:Parameter Name="ShipCountry" Type="String" />
		    <asp:Parameter Name="OrderID" Type="Int32" />
		</UpdateParameters>
		<DeleteParameters>
		    <asp:Parameter Name="OrderID" Type="Int32" />
		</DeleteParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT CountryID, CountryName FROM Country"
	    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Continent.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
	<br /><br />
    
    <span class="tdText">
        The ListBox control can easily be used inside GridTemplates as a input field.<br />
        Even in this scenario, all the features of the ListBox control are available (e.g. on-demand loading, multi-columns, etc).
        
        <br /><br />
        
        To make the Grid automatically select the correct items from the ListBox when editing records, <br />
        simply set the <b>ControlID</b> property of the GridTemplate to the ID of the ListBox control.
    </span>
	
</asp:Content>