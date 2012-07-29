<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="cs_master_detail_keep_state.aspx.cs" Inherits="Grid_cs_master_detail_keep_state" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Master / Detail - Keep Expanded Details on PostBack</b></span>		
	
    <br /><br />
	
    <asp:HiddenField runat="server" ID="ExpandedDetails" Value="" />

    <obout:OboutButton ID="OboutButton1" runat="server" Text="Do PostBack" /> <br /><br />

    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
    
    <br /><br />
    
    <span class="tdText">
        The Grid can be customized to allow only a single master row to be expanded at a time.<br />
        When you expand a new master row, the previously expanded one will be collapsed.<br /><br />

        Aditionally the Grid can keep the state of the expanded detail grids after a post back.<br />
        Expand some of the details, down to the last level, and click the "Do PostBack" button.<br />
        You'll see that when the page is reloaded, the previously expanded details will keep their expanded state.
    </span>
        
    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 3 * FROM [Customers]"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM [Orders] WHERE CustomerID = ?"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb">
        <SelectParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="sds3" SelectCommand="SELECT * FROM [Order Details] WHERE OrderID = ?"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb">
        <SelectParameters>
            <asp:Parameter Name="OrderID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    

    <script type="text/javascript" language="javascript">
        function addLoadEvent(func) {
            var oldonload = window.onload;
            if (typeof window.onload != 'function') {
                window.onload = func;
            } else {
                window.onload = function () {
                    if (oldonload) {
                        oldonload();
                    }
                    func();
                }
            }
        }

        function AttachEvents() {
            oboutGrid.prototype.manageDetailGridsExpandedState_old = oboutGrid.prototype.manageDetailGridsExpandedState;
            oboutGrid.prototype.manageDetailGridsExpandedState = function (obj) {
                var currentRow = obj.parentNode.parentNode.parentNode.parentNode;

                var rows = this.GridBodyContainer.firstChild.firstChild.childNodes[1].childNodes;

                for (i = 0; i < rows.length; i++) {
                    if (rows[i].className == 'ob_gDGC' && rows[i].previousSibling != currentRow && rows[i].style.display != 'none') {
                        rows[i].style.display = "none";
                        var img = rows[i].previousSibling.childNodes[1].firstChild.childNodes[1].firstChild;
                        img.src = img.src.toString().replace('details_btn_close.gif', 'details_btn_open.gif');

                        if (this.ID == 'Grid1') {
                            document.getElementById('ctl00_ContentPlaceHolder1_ExpandedDetails').value = '';
                        }
                    }
                }

                this.manageDetailGridsExpandedState_old(obj);

                if (trackExpandedDetails) {
                    storeExpandedDetails(this.ID, this.getElementIndex(currentRow));
                }
            }
        }

        var trackExpandedDetails = true;

        function storeExpandedDetails(gridId, rowIndex) {
            var expandedDetails = document.getElementById('ctl00_ContentPlaceHolder1_ExpandedDetails').value;

            var existingElement = false;
            if (expandedDetails != '') {
                var arrExpandedDetails = expandedDetails.split(',');

                var gridBaseId = gridId;

                if (gridBaseId.indexOf('_') != -1) {
                    gridBaseId = gridId.substr(0, gridId.indexOf('_'));
                }
                for (var i = 0; i < arrExpandedDetails.length; i += 2) {
                    if (arrExpandedDetails[i].indexOf(gridBaseId) == 0) {
                        arrExpandedDetails[i] = gridId;
                        arrExpandedDetails[i + 1] = rowIndex;

                        existingElement = true;
                    }
                }
            } else {
                var arrExpandedDetails = new Array();
            }

            if (!existingElement) {
                arrExpandedDetails.push(gridId);
                arrExpandedDetails.push(rowIndex);
            }

            document.getElementById('ctl00_ContentPlaceHolder1_ExpandedDetails').value = arrExpandedDetails.join(',');
        }

        var tempExpandedDetails = null;

        function restoreExpandedDetails() {
            trackExpandedDetails = false;

            if (tempExpandedDetails == null) {
                tempExpandedDetails = document.getElementById('ctl00_ContentPlaceHolder1_ExpandedDetails').value;
            }

            if (tempExpandedDetails != '') {
                var arrExpandedDetails = tempExpandedDetails.split(',');

                var gridId = arrExpandedDetails.shift();
                var rowIndex = arrExpandedDetails.shift();

                try {
                    var grid = eval(gridId);
                    grid.getExpandCollapseDetailsButtonForRow(grid.GridBodyContainer.firstChild.firstChild.childNodes[1].childNodes[rowIndex]).onclick();
                    tempExpandedDetails = arrExpandedDetails.join(',');
                } catch (ex) {
                }

                window.setTimeout(restoreExpandedDetails, 500);
            } else {
                trackExpandedDetails = true;
            }
        }

        addLoadEvent(function () {
            AttachEvents();
            restoreExpandedDetails();
        });
    </script>

</asp:Content>

	

   