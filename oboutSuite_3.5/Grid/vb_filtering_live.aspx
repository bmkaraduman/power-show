<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_filtering_live.aspx.vb" Inherits="Grid_vb_filtering_live" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Live Search</b></span>		
	
    <br /><br />
	
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		

           
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Orders ORDER BY ShipName ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
        <br /><br />
		
		<span class="tdText">
    		This example demonstrates the ability to automatically filter the Grid when typing into the filter text boxes,<br />
            without being needed to hit the "Apply Filter" link. Simply type a search term into the filter text boxes and<br />
            the Grid will load a fresh set of data from the server.    		
		</span>

    <script type="text/javascript">
        var applyFilterTimeout = null;

        function applyFilter() {
            if (applyFilterTimeout) {
                window.clearTimeout(applyFilterTimeout);
            }

            applyFilterTimeout = window.setTimeout(doFiltering, 1000);
        }

        function doFiltering() {
            Grid1.filter();
        }
	</script>

    <style type="text/css">
            .ob_gFALC
			{
			    display: none !important;
			}
    </style>
</asp:Content>


	


  