<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_sorting_allow_columns.aspx.vb" Inherits="Grid_vb_sorting_allow_columns" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Enable/Disable Sorting for Columns</b></span>		
	
    <br /><br />
    
   <fieldset class="tdText" style="width: 200px; padding: 3px;">  
		<legend>Enable Sorting</legend>
		<table>
		    <tr> 
		            <td><obout:OboutCheckBox runat="server" ID="chkAllowSortingShipCountry" AutoPostBack="true" Width="100"
		            FolderStyle="../interface/styles/grand_gray/OboutCheckBox" Text="COUNTRY" Checked="true" /></td>	    
		    </tr>
		    <tr>
                    <td><obout:OboutCheckBox runat="server" ID="chkAllowSortingShipCity" AutoPostBack="true" Width="100"
		            FolderStyle="../interface/styles/grand_gray/OboutCheckBox" Text="CITY" Checked="true" /><br /></td>		    
		    </tr>
		    <tr>
                    <td>        
		            <obout:OboutCheckBox runat="server" ID="chkAllowSortingShipName" AutoPostBack="true" Width="100"
		            FolderStyle="../interface/styles/grand_gray/OboutCheckBox" Text="NAME" Checked="true" /><br /></td>		    
		    </tr>
		    <tr>
                    <td>         
		            <obout:OboutCheckBox runat="server" ID="cbkAllowSortingOrderID" AutoPostBack="true" Width="100"
		            FolderStyle="../interface/styles/grand_gray/OboutCheckBox" Text="ORDER ID" Checked="true" /></td>		    
		    </tr>
		</table>
	</fieldset>

	<br /><br />

	<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 25 [OrderID], [ShipName], [ShipCity], [ShipPostalCode], [ShipCountry] FROM [Orders]" />

    <br />

    <span class="tdText">
        Use the <b>AllowSorting</b> property of the <b>Column</b> class to enable/disable the sorting feature for the columns.
    </span>
</asp:Content>


