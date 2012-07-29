<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="cs_columns_resizing_dynamic.aspx.cs" Inherits="Grid_cs_columns_resizing_dynamic" %>  		
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Dynamic Column Resizing</b></span>		
	
    <br /><br />

    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

    <asp:PlaceHolder ID="phGrid2" runat="server"></asp:PlaceHolder>

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
