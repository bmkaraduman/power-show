<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="cs_export_selected_records.aspx.cs" Inherits="Grid_cs_export_selected_records" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Export Selected Records</b></span>		
	
    <br /><br />
	
    <obout:OboutButton ID="OboutButton1" runat="server" Text="Export Selected Records" OnClientClick="exportToExcel();return false;" />
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

        <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br />
		
		<div class="tdText" style="width: 650px;">
            This sample showcases the ability to export only the selected records from the Grid.
            You can select records either by clicking on them or by using the check boxes in the first column.<br /><br />

            To achieve this functionality, the <b>RowExported</b> event was employed. 
            In the event handler of this event the current row is searched in the <b>SelectedRecords</b> collection and,
            if it is not found (the record is not selected), it is removed from the resulting table which will be written to the Excel file.
		</div>
		
    <script type="text/javascript">
        function exportToExcel() {
            if (Grid1.SelectedRecords.length == 0) {
                alert('Please select at least one record to export.');
                return;
            }

            Grid1.exportToExcel();
        }    		
		</script>
</asp:Content>
