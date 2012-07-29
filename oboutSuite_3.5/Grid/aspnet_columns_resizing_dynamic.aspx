<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_columns_resizing_dynamic.aspx.cs" Inherits="Grid_aspnet_columns_resizing_dynamic" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Dynamic Column Resizing</b></span>		
	
    <br /><br />

    <obout:Grid ID="Grid1" runat="server" AutoGenerateColumns="false" AllowAddingRecords="false" DataSourceID="SqlDataSource1" AllowPageSizeSelection="false">
        <Columns>
            <obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" Visible="false" runat="server" />
            <obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" runat="server" />
            <obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="125" runat="server" />
            <obout:Column ID="Column6" DataField="ShipCountry" HeaderText="COUNTRY" Width="125" runat="server" />
            <obout:Column ID="Column4" DataField="OrderDate" HeaderText="ORDER DATE" Width="135" runat="server" DataFormatString="{0:MM/dd/yyyy}" />
        </Columns>
    </obout:Grid>

    <obout:Grid ID="Grid2" runat="server" AutoGenerateColumns="false" AllowAddingRecords="false" DataSourceID="SqlDataSource1" AllowPageSizeSelection="false">
        <Columns>
            <obout:Column ID="Column7" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" Visible="false" runat="server" />
            <obout:Column ID="Column8" DataField="ShipName" HeaderText="NAME" runat="server" />
            <obout:Column ID="Column9" DataField="ShipCity" HeaderText="CITY" Width="125" runat="server" />
            <obout:Column ID="Column10" DataField="ShipCountry" HeaderText="COUNTRY" Width="125" runat="server" />
            <obout:Column ID="Column11" DataField="OrderDate" HeaderText="ORDER DATE" Width="135" runat="server" DataFormatString="{0:MM/dd/yyyy}" />
            <obout:Column ID="Column12" DataField="ShippedDate" HeaderText="SHIPPED DATE" Width="135" runat="server" DataFormatString="{0:MM/dd/yyyy}" />
        </Columns>
        <ScrollingSettings ScrollWidth="560" />
    </obout:Grid>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 50 * FROM [Orders] ORDER BY OrderID DESC">
    </asp:SqlDataSource>

    <script type="text/javascript">
        oboutGrid.prototype._resizeColumn = oboutGrid.prototype.resizeColumn;
        oboutGrid.prototype.resizeColumn = function (columnIndex, amountToResize, keepGridWidth) {
            this._resizeColumn(columnIndex, amountToResize, false);

            var width = this._getColumnWidth();

            if (width > 0) {
                if (this.ScrollWidth == '0px') {
                    this.GridMainContainer.style.width = width + 'px';
                } else {
                    var scrollWidth = parseInt(this.ScrollWidth);
                    if (width < scrollWidth) {
                        this.GridMainContainer.style.width = width + 'px';
                        this.HorizontalScroller.style.display = 'none';
                    } else {
                        this.HorizontalScroller.firstChild.firstChild.style.width = width + 'px';
                        this.HorizontalScroller.style.display = '';
                    }
                }
            }
        }

        oboutGrid.prototype._getColumnWidth = function () {
            var totalWidth = 0;
            for (var i = 0; i < this.ColumnsCollection.length; i++) {
                if (this.ColumnsCollection[i].Visible) {
                    totalWidth += this.ColumnsCollection[i].Width;
                }
            }

            return totalWidth;
        }
    </script>

    <br />

    <div class="tdText" style="width: 600px;">
        This sample shows how the column resizing feature of the Grid can be customized to update the total width of the Grid based on the widths of the columns.
        The dynamic column resizing feature can be used for regular Grids and also for Grids that employ the horizontal scrolling feature.
    </div>
</asp:Content>
