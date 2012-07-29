<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_rows_draganddrop_between_grids.aspx.cs" Inherits="Grid_aspnet_rows_draganddrop_between_grids" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

    <asp:ScriptManager runat="server" EnablePageMethods="true" />

	<span class="tdText"><b>ASP.NET Grid - Drag and Drop Rows between Grids</b></span>		
	
    <br /><br />

    <table>
        <tr>
            <td valign="top">
                <obout:Grid id="Grid1" runat="server" ShowLoadingMessage="false" AllowPaging="false" PageSize="-1" AllowSorting="false"
                    AutoGenerateColumns="false" AllowAddingRecords="false" AllowPageSizeSelection="false" Serialize="false">
                    <Columns>
                        <obout:Column ID="Column6" runat="server" DataField="ProductID" Visible="false" />
                        <obout:Column ID="Column7" runat="server" DataField="RowPosition" Visible="false" />
                        <obout:Column ID="Column8" runat="server" DataField="ProductName" HeaderText="PRODUCT NAME" Width="175" />
                        <obout:Column ID="Column9" runat="server" DataField="SKU" HeaderText="SKU" Width="75" />
                        <obout:Column ID="Column10" runat="server" DataField="Price" HeaderText="PRICE" Width="90" />
                    </Columns>
                    <PagingSettings ShowRecordsCount="false" />
                    <TemplateSettings HeadingTemplateId="Template1" />
                    <LocalizationSettings NoRecordsText="There are no products available." />
                    <Templates>
                        <obout:GridTemplate runat="server" ID="Template1"><Template>PRODUCTS</Template></obout:GridTemplate>
                    </Templates>
                </obout:Grid>
            </td>
            <td width="25">&#160;</td>
            <td valign="top">
                <obout:Grid id="Grid2" runat="server" ShowLoadingMessage="false" AllowPaging="false" PageSize="-1" AllowSorting="false"
                    AutoGenerateColumns="false" AllowAddingRecords="false" AllowPageSizeSelection="false" Serialize="false">
                    <Columns>
                        <obout:Column ID="Column1" runat="server" DataField="ProductID" Visible="false" />
                        <obout:Column ID="Column2" runat="server" DataField="RowPosition" Visible="false" />
                        <obout:Column ID="Column3" runat="server" DataField="ProductName" HeaderText="PRODUCT NAME" Width="175" />
                        <obout:Column ID="Column4" runat="server" DataField="SKU" HeaderText="SKU" Width="75" />
                        <obout:Column ID="Column5" runat="server" DataField="Price" HeaderText="PRICE" Width="90" />
                    </Columns>
                    <PagingSettings ShowRecordsCount="false" />
                    <TemplateSettings HeadingTemplateId="Template2" />
                    <LocalizationSettings NoRecordsText="Drag products here to add them to the cart." />
                    <Templates>
                        <obout:GridTemplate runat="server" ID="Template2"><Template>SHOPPING CART</Template></obout:GridTemplate>
                    </Templates>
                </obout:Grid>
            </td>
        </tr>
    </table>

    <script type="text/javascript" src="resources/custom_scripts/row-reorder/row-reorder.js"></script>

    <br />

    <div class="tdText" style="width: 550px;">
        This example showcases the ability to move rows between grids using drag and drop.
        Select any number of records and drag them to a new position in the same Grid or in a different Grid.
        The changes are persisted automatically in the database using AJAX requests (no full page postbacks).
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <link href="resources/custom_scripts/row-reorder/row-reorder.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var rowPositionField = "RowPosition";
        var primaryKeyField = "ProductID";

        window.onload = function () {
            Grid1.OnClientRowsDropped = saveRowsPosition;
            Grid2.OnClientRowsDropped = saveRowsPosition;
        }

        function saveRowsPosition() {
            var dataGrid1 = getGridData(Grid1);
            var dataGrid2 = getGridData(Grid2);

            PageMethods.SaveRowsPosition(dataGrid1.join(',') + "|" + dataGrid2.join(','), null, null);
        }

        function getRowPositions(grid) {
            var positions = new Array();

            for (var i = 0; i < grid.Rows.length; i++) {
                if (grid.Rows[i] && grid.Rows[i].Cells) {
                    positions.push(grid.Rows[i].Cells[rowPositionField].Value);
                }
            }

            positions.sort(function (a, b) { return a - b })

            return positions;
        }

        function getGridData(grid) {
            var positions = getRowPositions(grid);

            var data = new Array();
            var j = 0;

            for (var i = 0; i < grid.Rows.length; i++) {
                if (grid.Rows[i] && grid.Rows[i].Cells) {
                    var item = grid.Rows[i].Cells[primaryKeyField].Value + '*' + positions[j];
                    grid.Rows[i].Cells[rowPositionField].Value = positions[j];
                    data.push(item);
                    j++;
                }
            }

            return data;
        }
    </script>
</asp:Content>

