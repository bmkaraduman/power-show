<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="cs_print_all_records.aspx.cs" Inherits="Grid_cs_print_all_records" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Printing All Records without Scrollbars</b></span>		
	
    <br /><br />

    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
   
	<br />
		
	<obout:OboutButton ID="OboutButton2" runat="server" Text="Print All Records" OnClientClick="return printGrid();" FolderStyle="../Interface/styles/premiere_blue/OboutButton" />
		
    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		

	<br /><br />
		
	<span class="tdText">
		Use the <b>print</b> client-side method to print the pages of the grid.<br />
		In this sample we use a small JavaScript trick to print all the records, <br />
        including those that are not visible due to the vertical scrollbar.
	</span>
				
	
    <script type="text/javascript">
        var gridBodyStyle = null;

        function printGrid() {
            gridBodyStyle = grid1.GridBodyContainer.getAttribute('style');
            grid1.GridBodyContainer.style.maxHeight = '';

            grid1.print();

            window.setTimeout("grid1.GridBodyContainer.setAttribute('style', gridBodyStyle);", 250);

            return false;
        }
		</script>
		<style type="text/css" media="print">
		    .ob_gPSTT
			{
			    display: none !important;
			}
		</style>
</asp:Content>


    
    	

