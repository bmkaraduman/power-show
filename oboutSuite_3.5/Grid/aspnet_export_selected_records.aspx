<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_export_selected_records.aspx.cs" Inherits="Grid_aspnet_export_selected_records" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Export Selected Records</b></span>		
	
    <br /><br />
	
    <obout:OboutButton ID="OboutButton1" runat="server" Text="Export Selected Records" OnClientClick="exportToExcel();return false;" />
		
		<br /><br />
		
		<obout:Grid id="Grid1" runat="server" AutoGenerateColumns="false" DataSourceID="sds1" AllowAddingRecords="false" OnRowExported="Grid1_RowExported">
			<Columns>
				<obout:CheckBoxSelectColumn />
                <obout:Column ID="Column1" DataField="OrderID" Visible="false" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="250" runat="server"/>				
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column ID="Column5" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
			</Columns>
            <ExportingSettings ExportAllPages="true" ColumnsToExport="OrderID,ShipName,ShipCity,ShipPostalCode,ShipCountry" />
		</obout:Grid>

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

