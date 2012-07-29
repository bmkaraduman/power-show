<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_rows_draganddrop.aspx.cs" Inherits="Grid_aspnet_rows_draganddrop" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

    <asp:ScriptManager runat="server" EnablePageMethods="true" />

	<span class="tdText"><b>ASP.NET Grid - Reorder Rows using Drag and Drop</b></span>		
	
    <br /><br />

    <obout:Grid id="Grid1" runat="server" DataSourceID="SqlDataSource1" ShowLoadingMessage="false" AllowSorting="false"
        AutoGenerateColumns="false" AllowAddingRecords="false" AllowPageSizeSelection="false">
        <Columns>
            <obout:Column runat="server" DataField="OrderID" Visible="false" />
            <obout:Column runat="server" DataField="RowPosition" Visible="false" />
            <obout:Column runat="server" DataField="ShipName" HeaderText="SHIP NAME" />
            <obout:Column runat="server" DataField="ShipCity" HeaderText="SHIP CITY" Width="125" />
            <obout:Column runat="server" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="125" />
            <obout:Column runat="server" DataField="ShipCountry" HeaderText="SHIP COUNTRY" Width="125" />
        </Columns>
    </obout:Grid>

    <script type="text/javascript" src="resources/custom_scripts/row-reorder/row-reorder.js"></script>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|MoveOrder.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 25 OrderID, ShipName, ShipCity, ShipPostalCode, ShipCountry, RowPosition FROM [Orders_2] ORDER BY RowPosition ASC" />

    <br />

    <div class="tdText" style="width: 550px;">
        This example showcases the ability to reorder the rows of the Grid using drag and drop.
        Select any number of records and drag them to a new position.
        The changes are persisted automatically in the database using AJAX requests (no full page postback).
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <link href="resources/custom_scripts/row-reorder/row-reorder.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        window.onload = function () {
            Grid1.OnClientRowsDropped = saveRowsPosition;
        }

        function saveRowsPosition() {
            var positions = new Array();
            for (var i = 0; i < Grid1.Rows.length; i++) {
                if (Grid1.Rows[i] && Grid1.Rows[i].Cells) {
                    positions.push(Grid1.Rows[i].Cells['RowPosition'].Value);
                }
            }

            positions.sort(function (a, b) { return a - b })

            var data = new Array();
            var j = 0;
            for (var i = 0; i < Grid1.Rows.length; i++) {
                if (Grid1.Rows[i] && Grid1.Rows[i].Cells) {
                    var item = Grid1.Rows[i].Cells['OrderID'].Value + '*' + positions[j];
                    Grid1.Rows[i].Cells['RowPosition'].Value = positions[j];
                    data.push(item);
                    j++;
                }
            }

            PageMethods.SaveRowsPosition(data.join(','), reloadGrid, null);
        }

        function reloadGrid() {
            // no need to refresh the Grid
            //Grid1.refresh();
        }
    </script>
</asp:Content>

