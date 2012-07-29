<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_export_checkboxcolumn.aspx.cs" Inherits="Grid_aspnet_export_checkboxcolumn" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
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

    <obout:Grid id="Grid1" runat="server" DataSourceID="SqlDataSource1" Serialize="false"
        AutoGenerateColumns="false" AllowAddingRecords="false" AllowColumnReordering="true" OnRowExported="Grid1_RowExported">
        <Columns>
            <obout:Column DataField="OrderID" Visible="false" HeaderText="ORDER ID" />            
            <obout:Column DataField="ShipName" HeaderText="SHIP NAME" />            
            <obout:Column DataField="ShipCity" HeaderText="SHIP CITY" Width="125" />
            <obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="125" />
            <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" Width="125" />
            <obout:CheckBoxColumn DataField="Sent" HeaderText="SENT" Width="75" ShowHeader="true" />            
        </Columns>
        <ExportingSettings ExportHiddenColumns="true" />
	</obout:Grid>

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

