<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_columns_auto_resize.aspx.cs" Inherits="Grid_aspnet_columns_auto_resize" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Auto Resize Columns based on Content</b></span>		
	
    <br /><br />

    <obout:Grid id="Grid1" runat="server" AutoGenerateColumns="true" AllowAddingRecords="false" AllowColumnResizing="false"
        DataSourceID="SqlDataSource1" AllowPageSizeSelection="false" OnColumnsCreated="Grid1_ColumnsCreated">
        <Templates>
            <obout:GridTemplate runat="server" ID="Template1">
                <Template><span><%# Container.Value %></span></Template>
            </obout:GridTemplate>
        </Templates>
	</obout:Grid>

    <script type="text/javascript">
        // Copy this JavaScript code to the bottom of your page (right before the closing </form> tag):

        oboutGrid.prototype._assignBodyEvents = oboutGrid.prototype.assignBodyEvents;
        oboutGrid.prototype.assignBodyEvents = function () {
            this._assignBodyEvents();

            this._autoResizeColumns();
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

        oboutGrid.prototype._autoResizeColumns = function () {
            var columnWidths = new Array();
            var body = this.getBodyTableBody();

            for (var i = 0; i < this.ColumnsCollection.length; i++) {
                var headerCell = this.getHeaderCell(i);
                var extraWidth = headerCell.firstChild.offsetWidth - headerCell.firstChild.firstChild.offsetWidth;
                var maxWidth = headerCell.firstChild.firstChild.firstChild.offsetWidth + extraWidth;

                for (j = 0; j < body.childNodes.length; j++) {
                    var bodyCell = body.childNodes[j].childNodes[i];
                    var extraWidth = bodyCell.firstChild.offsetWidth - bodyCell.firstChild.firstChild.offsetWidth;
                    var cellWidth = bodyCell.firstChild.firstChild.firstChild.offsetWidth + extraWidth;

                    if (cellWidth > maxWidth) {
                        maxWidth = cellWidth;
                    }
                }

                columnWidths.push(maxWidth - this.ColumnsCollection[i].Width);
            }

            for (var i = 0; i < columnWidths.length; i++) {
                this.resizeColumn(i, columnWidths[i] + 20, false);
            }

            var width = this._getColumnWidth();
            this.GridMainContainer.style.width = width + 'px';
        }
    </script>

    <asp:SqlDataSource runat="server" ID="SqlDataSource1" 
        SelectCommand="SELECT TOP 100 OrderID AS ID, ShipName AS NAME, ShipCity AS CITY, ShipPostalCode AS ZIP, ShipCountry AS COUNTRY FROM Orders"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

    <br />

    <div class="tdText" style="width: 500px;">
        This sample shows how the columns of the Grid can be auto resized based on their content. 
        When the page is loaded or when you sort the Grid or navigate through pages each column will have the width of its longest cell.
    </div>
</asp:Content>
