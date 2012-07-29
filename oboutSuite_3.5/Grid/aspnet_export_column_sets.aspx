<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_export_column_sets.aspx.cs" Inherits="Grid_aspnet_export_column_sets" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Export Column Sets</b></span>
    
    <br />
    <br />

    <obout:Grid ID="Grid1" runat="server" AutoGenerateColumns="false" AllowAddingRecords="false" DataSourceID="SqlDataSource1" OnExporting="Grid1_Exporting">
        <Columns>
            <obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" Visible="false" runat="server" />
            <obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" runat="server" />
            <obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="125" runat="server" />
            <obout:Column ID="Column6" DataField="ShipCountry" HeaderText="COUNTRY" Width="125" runat="server" />
            <obout:Column ID="Column4" DataField="OrderDate" HeaderText="ORDER DATE" Width="135" runat="server" DataFormatString="{0:MM/dd/yyyy}" />
            <obout:Column ID="Column5" DataField="ShippedDate" HeaderText="SHIPPED DATE" Width="135" runat="server" DataFormatString="{0:MM/dd/yyyy}" />
        </Columns>
    </obout:Grid>

    <obout:OboutButton runat="server" Text="Export to Excel" OnClientClick="return exportToExcel();" />

    <br /> <br />

    <div class="tdText" style="width: 600px;">
        The columns of the Grid can be grouped in column sets. The column sets will be automatically resized when the columns are resized. 
        The Grid allows developers to create multiple levels of column sets.<br /><br />

        Currently column sets may be added only from the client-side, as explained <a href="aspnet_column_sets.aspx">here</a>.<br /><br />

        In this example we used the <b>Exporting</b> event to add a new row at the top of the exported file, which will contain the column sets.<br />
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 50 * FROM [Orders] ORDER BY OrderID DESC">
    </asp:SqlDataSource>
    
    <script type="text/javascript" src="resources/custom_scripts/column-set/column-set.js"></script>

</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">    
    <link href="resources/custom_scripts/column-set/column-set.css" rel="Stylesheet" type="text/css" />

    <script type="text/javascript">
        window.onload = function () {
            //Grid1.addColumnSet(level, startColumnIndex, endColumnIndex, text);
            Grid1.addColumnSet(0, 0, 3, 'CONTACT INFORMATION');
            Grid1.addColumnSet(0, 4, 5, 'ORDER INFORMATION');
        }

        function exportToExcel() {
            Grid1.exportToExcel();

            return false;
        }
    </script>
</asp:Content>
