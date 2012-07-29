<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_rows_reorder.aspx.cs" Inherits="Grid_aspnet_rows_reorder" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Reorder Rows</b></span>		
	
    <br /><br />

    <obout:Grid id="Grid1" runat="server" DataSourceID="SqlDataSource1" ShowLoadingMessage="false"
        AutoGenerateColumns="false" AllowAddingRecords="false" FolderStyle="styles/black_glass"
        OnUpdateCommand="Grid1_UpdateCommand" AllowMultiRecordSelection="false" AllowSorting = "false">
        <Columns>
            <obout:Column runat="server" DataField="OrderID" Visible="false" />
            <obout:Column runat="server" DataField="RowPosition" Visible="false" />
            <obout:Column runat="server" DataField="ShipName" HeaderText="SHIP NAME" />
            <obout:Column runat="server" DataField="ShipCity" HeaderText="SHIP CITY" />
            <obout:Column runat="server" DataField="ShipPostalCode" HeaderText="POSTAL CODE" />
            <obout:Column runat="server" DataField="ShipCountry" HeaderText="SHIP COUNTRY" />
            <obout:Column runat="server" Width="90">
                <TemplateSettings TemplateId="Template1" />
            </obout:Column>
        </Columns>
        <Templates>
            <obout:GridTemplate runat="server" ID="Template1">
                <Template>
                    <a href="javascript: //" onclick="moveUp(<%# Container.PageRecordIndex %>, <%# Container.RecordIndex %>)"><img src="styles/black_glass/asc.gif" alt="Move up" border="0" /></a>
                    <a href="javascript: //" onclick="moveDown(<%# Container.PageRecordIndex %>, <%# Container.RecordIndex %>)"><img src="styles/black_glass/desc.gif" alt="Move down" border="0" /></a>
                </Template>
            </obout:GridTemplate>
        </Templates>
    </obout:Grid>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|MoveOrder.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 25 OrderID, ShipName, ShipCity, ShipPostalCode, ShipCountry, RowPosition FROM [Orders_2] ORDER BY RowPosition ASC" />

    <br />

    <span class="tdText">
        This example showcases the ability to reorder the rows of the Grid. Use the up/down arrows from each row to move<br />
        that row up/down. The changes are persisted automatically in the database using AJAX requests (no full page postback).
    </span>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function moveUp(pageRowIndex, rowIndex) {
            if (rowIndex > 0) {
                updateRowPosition(pageRowIndex, -1);
            }
        }

        function moveDown(pageRowIndex, rowIndex) {
            if (rowIndex < Grid1.getTotalNumberOfRecords()) {
                updateRowPosition(pageRowIndex, 1);
            }
        }

        function updateRowPosition(pageRowIndex, direction) {
            Grid1.selectRecord(pageRowIndex, true);
            var obj = new Object();
            obj.OrderID = Grid1.Rows[pageRowIndex].Cells['OrderID'].Value;
            obj.RowPosition = Grid1.Rows[pageRowIndex].Cells['RowPosition'].Value + '_' + direction;
            obj.ShipName = Grid1.Rows[pageRowIndex].Cells['ShipName'].Value;
            obj.ShipCity = Grid1.Rows[pageRowIndex].Cells['ShipCity'].Value;
            obj.ShipPostalCode = Grid1.Rows[pageRowIndex].Cells['ShipPostalCode'].Value;
            obj.ShipCountry = Grid1.Rows[pageRowIndex].Cells['ShipCountry'].Value;

            Grid1.executeUpdate(obj);
        }
    </script>
</asp:Content>

