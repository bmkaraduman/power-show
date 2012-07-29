<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_export_checkboxcolumn.aspx.vb" Inherits="Grid_vb_export_checkboxcolumn" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function exportToExcel() {
            Grid1.exportToExcel();
        }

        function exportToWord() {
            Grid1.exportToWord();
        }
		</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Export CheckBoxColumn</b></span>		
	
    <br /><br />

    <obout:OboutButton ID="OboutButton1" runat="server" Text="Export to Excel" OnClientClick="exportToExcel();return false;" />
    <obout:OboutButton ID="OboutButton2" runat="server" Text="Export to Word" OnClientClick="exportToWord();return false;" />

    <br /><br />

    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 500 [OrderID], [ShipName], [ShipCity], [ShipPostalCode], [ShipCountry], [Sent], Sent AS Sent2 FROM [Orders] ORDER BY OrderID DESC">
    </asp:SqlDataSource>

    <br />

    <span class="tdText">
        Using the exporting feature of the Grid you can export the data from CheckBoxColumns as well.<br /><br />
        By default, when exporting a grid, the data from CheckBoxColumns is not included in the generated excel / word file.<br />
        Using the <b>RowExported</b> event this data can be extracted from the original row (<span class="option2">e.SourceRow</span>) and added to the exported file.
    </span>
</asp:Content>

