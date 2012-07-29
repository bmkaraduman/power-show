<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_rows_reorder.aspx.vb" Inherits="Grid_vb_rows_reorder" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Reorder Rows</b></span>		
	
    <br /><br />
 
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|MoveOrder.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 25 OrderID, ShipName, ShipCity, ShipPostalCode, ShipCountry, RowPosition FROM [Orders_2] ORDER BY RowPosition ASC" />

    <br />

    <span class="tdText">
        This example showcases the ability to reorder the rows of the Grid. Use the up/down arrows from each row to move<br />
        that row up/down. The changes are persisted automatically in the database using AJAX requests (no full page postback).
    </span>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
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

