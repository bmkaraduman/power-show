<%@ Page Title="" Language="VB" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="vb_master_detail.aspx.vb" Inherits="ListBox_vb_master_detail" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    
    <span class="tdText"><b>ASP.NET ListBox - Master / Detail</b></span>	
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
   
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT ContinentID, ContinentName FROM Continent ORDER BY ContinentName"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|continent.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		    
    <asp:SqlDataSource ID="sds2" runat="server" SelectCommand="SELECT CountryID, CountryName FROM Country WHERE ContinentID = @ContinentID ORDER BY CountryName"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|continent.mdb;" ProviderName="System.Data.OleDb">
	    <SelectParameters>
	        <asp:Parameter Name="ContinentID" Type="Int32" />
	    </SelectParameters>	    
    </asp:SqlDataSource>		    
	
    <br /><br />
    
    <span class="tdText">
        The ListBox provides a built-in master / detail feature, which allows you to organize data <br />
        from multiple data sources in the same ListBox. To set up a detail ListBox, add a new ListBox <br />
        control inside the <b>Details</b> section of the master ListBox. <br /><br />
        
        The detail ListBox supports all the features available in a regular ListBox.
    </span>

</asp:Content>

