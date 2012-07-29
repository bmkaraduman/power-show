<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="cs_export_multiple.aspx.cs" Inherits="Grid_cs_export_multiple" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Export Multiple Grids as a Single File</b></span>		
		
		<br /><br />

        <obout:OboutButton ID="OboutButton1" runat="server" Text="Export to Excel" OnClientClick="exportToExcel();return false;" />
        <obout:OboutButton ID="OboutButton2" runat="server" Text="Export to Word" OnClientClick="exportToWord();return false;" />

        <br /><br />				

        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	

        <br /><br />

        <asp:PlaceHolder ID="phGrid2" runat="server"></asp:PlaceHolder>	     
		
        <br /><br />

        <asp:PlaceHolder ID="phGrid3" runat="server"></asp:PlaceHolder>	

		<br />
		
        <span class="tdText">
		    When exporting a Grid to Excel / Word you can add extra rows to the exported file. <br />
            Thus, developers can extract data from other Grids from the page and add them to the file that is currently exported.
            
            <br /><br />

            The Grid exposes two server-side events that assist you in adding extra rows to the exported files:
            <ul>
                <li><b>Exporting</b> - raised before any other row is added to the exported table. This should be used to add rows at the top of the file.</li>
                <li><b>Exported</b> - raised after all rows have been added to the exported table. This should be used to add rows at the bottom of the file.</li>
            </ul>
		</span>
				
		<asp:SqlDataSource runat="server" ID="SqlDataSource1" SelectCommand="SELECT TOP 25 * FROM Products"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
        <asp:SqlDataSource runat="server" ID="SqlDataSource2" SelectCommand="SELECT TOP 25 * FROM Orders"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
        <asp:SqlDataSource runat="server" ID="SqlDataSource3" SelectCommand="SELECT TOP 25 * FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>		

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
         <script type="text/javascript">
             function exportToExcel() {
                 Grid1.exportToExcel();
             }

             function exportToWord() {
                 Grid1.exportToWord();
             }
		</script>
</asp:Content>
    	

 
