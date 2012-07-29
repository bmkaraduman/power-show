<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_print_selected_records.aspx.vb" Inherits="Grid_vb_print_selected_records" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        var printStyleSheetMoved = false;
        function printGrid() {
            if (!printStyleSheetMoved) {
                Grid1.GridMainContainer.appendChild(document.getElementById('PrintStyleSheetContainer'));
            }

            if (Grid1.PageSelectedRecords.length == 0) {
                alert('Please select at least one record.');
                return;
            }

            Grid1.hideColumn(1);

            Grid1.print();

            window.setTimeout(restoreGridColumn, 250);
        }

        function restoreGridColumn() {
            Grid1.showColumn(1);
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Printing Selected Records</b></span>		
	
    <br /><br />

    <obout:OboutButton ID="OboutButton1" runat="server" Text="Print" OnClientClick="printGrid(); return false;" />

    <br /><br />

    <div id="PrintStyleSheetContainer">
        <style type="text/css" media="print">
            .ob_gR, .ob_gRA, .ob_gHSI, .ob_gFCont
            {
                display: none;
            }
        </style>
    </div>

    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		
    		
	<asp:SqlDataSource runat="server" ID="SqlDataSource1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

    <br />

    <span class="tdText">
		Use the <b>print</b> client-side method to print the records of the grid.<br />
		In this sample we use CSS styles to hide the rows that are not selected when printing the Grid.<br />
        <span class="option2">
            &lt;style type="text/css" media="print"&gt;<br />
                &#160;&#160;&#160;&#160;.ob_gR, .ob_gRA, .ob_gHSI, .ob_gFCont<br />
                &#160;&#160;&#160;&#160;{<br />
                &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;display: none;<br />
                &#160;&#160;&#160;&#160;}<br />
            &lt;/style&gt;
        </span>
	</span>
</asp:Content>

