<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_integration_grid.aspx.vb" Inherits="ComboBox_vb_integration_grid" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
    function Grid1_BeforeDelete(sender, record) 
    {
        return confirm("Are you sure you want to delete this record?");
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    
    <span class="tdText"><b>ASP.NET ComboBox - ComboBox Inside Grid</b></span>	
    
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
        The ComboBox control can easily be used inside GridTemplates as a input field.<br />
        Even in this scenario, all the features of the ComboBox control are available (e.g. on-demand loading, multi-columns, etc).
        
        <br /><br />
        
        To make the Grid automatically select the correct items from the ComboBox when editing records, <br />
        simply set the <b>ControlID</b> property of the GridTemplate to the ID of the ComboBox control.
    </span>
</asp:Content>

