<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_commands_client_side_changes.aspx.cs" Inherits="Grid_aspnet_commands_client_side_changes" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

        <span class="tdText"><b>ASP.NET Grid - Save Changes on the Client Side</b></span>
    
        <br /><br />
    
        <asp:ScriptManager ID="ScriptManager" runat="server" EnablePageMethods="true" />
        
        <table class="tdText">
            <tr>
                <td>
                    <obout:Grid id="Grid1" runat="server" CallbackMode="true" Serialize="false"
                        PageSize="25" 
                        AllowPaging="false"
                        AllowPageSizeSelection="false"
                        AutoGenerateColumns="false"
                        AllowAddingRecords="false" 
                        AllowMultiRecordSelection="false"
                        AllowGrouping="true" GroupBy="CategoryID"
                        ShowGroupsInfo="false" ShowMultiPageGroupsInfo="false"
                        OnDataSourceNeeded="Grid1_DataSourceNeeded">
                        <ClientSideEvents ExposeSender="true" OnClientSelect="Grid1_ClientSelect" />
                        <Columns>
                            <obout:Column ID="Column1" DataField="ProductID" ReadOnly="true" Visible="false" runat="server" />
                            <obout:Column ID="Column4" DataField="CategoryID" ReadOnly="true" Visible="false" runat="server" />
                            <obout:Column ID="Column2" DataField="ProductName" HeaderText="PRODUCT NAME" Width="200" runat="server" />
                            <obout:Column ID="Column3" DataField="UnitPrice" HeaderText="PRICE" Width="200" runat="server" />
                        </Columns>
                        <ScrollingSettings ScrollHeight="250" EnableVirtualScrolling="true" />
                        <GroupingSettings AllowChanges="false" />
                    </obout:Grid>
                </td>
                <td width="25">&#160;</td>
                <td valign="top">
                    <br /><br />
                                       
                    <input type="hidden" id="ProductID" />
                    <input type="hidden" id="CategoryID" />
                    
                    <table>
                        <tr>
                            <td colspan="2" align="center">
                                 <obout:OboutButton ID="OboutButton3" runat="server" Text="Previous" OnClientClick="return browseRecords('back');" />
                                 <obout:OboutButton ID="OboutButton4" runat="server" Text="Next" OnClientClick="return browseRecords('next');" />
                            </td>
                        </tr>
                        <tr>
                            <td>Product Name:</td>
                            <td>
                                <obout:OboutTextBox runat="server" ID="ProductName" />
                            </td>
                        </tr>
                        <tr>
                            <td>Unit Price:</td>
                            <td>
                                <obout:OboutTextBox runat="server" ID="UnitPrice" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <obout:OboutButton ID="OboutButton1" runat="server" Text="Save" OnClientClick="return saveChanges();" />
                                <obout:OboutButton ID="OboutButton2" runat="server" Text="Delete" OnClientClick="return deleteProduct();" />
                                <obout:OboutButton ID="OboutButton5" runat="server" Text="Insert New Record" OnClientClick="return addProduct();" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>        
    </div>

    <br /><br />
		
	<span class="tdText">
	    This sample shows how to improve the performance of the page by performing the insert / update / delete operation<br />
        for the Grid on the client-side. We used ASP.NET AJAX PageMethods to send the changes to the server <br />
        (to insert / update / delete records from the database), but the Grid is not refreshed after each change. Instead, <br />
        the data of the Grid is modified on the client-side, which makes the operations very fast. Additionally, the virtual <br />
        scrolling feature is enabled, to make the initial loading of the Grid even faster.
    </span>
		
	<script type="text/javascript">
	    function Grid1_ClientSelect(sender, records) {
	        document.getElementById('ProductID').value = records[0].ProductID;
	        document.getElementById('CategoryID').value = records[0].CategoryID;
	        ProductName.value(records[0].ProductName);
	        UnitPrice.value(records[0].UnitPrice);
	    }

	    var lastSavedData = 0;

	    function saveChanges() {
	        lastSavedData = { 'ProductID': document.getElementById('ProductID').value, 'ProductName': ProductName.value(), 'UnitPrice': UnitPrice.value() };
	        PageMethods.SaveProduct(lastSavedData, onSucceededSaveProduct, onFailedSaveProduct);

	        return false;
	    }

	    function onSucceededSaveProduct() {
	        for (var i = 0; i < Grid1.Rows.length; i++) {
	            if (Grid1.Rows[i] && Grid1.Rows[i].Cells && Grid1.Rows[i].Cells['ProductID'].Value == lastSavedData.ProductID) {
	                Grid1.Rows[i].Cells[0].Value = lastSavedData.ProductID;
	                Grid1.Rows[i].Cells[2].Value = lastSavedData.ProductName;
	                Grid1.Rows[i].Cells[3].Value = lastSavedData.UnitPrice;

	                Grid1.Rows[i].Cells['ProductID'].Value = lastSavedData.ProductID;
	                Grid1.Rows[i].Cells['ProductName'].Value = lastSavedData.ProductName;
	                Grid1.Rows[i].Cells['UnitPrice'].Value = lastSavedData.UnitPrice;

	                var row = Grid1.GridBodyContainer.firstChild.firstChild.childNodes[1].childNodes[i];

	                row.childNodes[0].firstChild.firstChild.innerHTML = lastSavedData.ProductID;
	                row.childNodes[2].firstChild.firstChild.innerHTML = lastSavedData.ProductName;
	                row.childNodes[3].firstChild.firstChild.innerHTML = lastSavedData.UnitPrice;

	                break;
	            }
	        }
	    }

	    function onFailedSaveProduct() {
	    }

	    function deleteProduct() {
	        lastSavedData = { 'ProductID': document.getElementById('ProductID').value };
	        PageMethods.DeleteProduct(lastSavedData, onSucceededDeleteProduct, onFailedDeleteProduct);

	        return false;
	    }

	    function onSucceededDeleteProduct() {
	        for (var i = 0; i < Grid1.Rows.length; i++) {
	            if (Grid1.Rows[i] && Grid1.Rows[i].Cells && Grid1.Rows[i].Cells['ProductID'].Value == lastSavedData.ProductID) {
	                Grid1.Rows.splice(i, 1);

	                var body = Grid1.GridBodyContainer.firstChild.firstChild.childNodes[1];
	                body.removeChild(body.childNodes[i]);

	                break;
	            }
	        }

	        document.getElementById('ProductID').value = 0;
	        ProductName.value('');
	        UnitPrice.value('');
	    }

	    function onFailedDeleteProduct() {
	    }

	    function browseRecords(type) {
	        var row = Grid1.GridBodyContainer.firstChild.firstChild.childNodes[1].firstChild;
	        var selectedIndex = 0;
	        while (row && row.className != 'ob_gRS') {
	            row = row.nextSibling;
	            selectedIndex++;
	        }

	        var newIndex;
	        if (row) {
	            if (type == 'back') {
	                newIndex = selectedIndex - 1;
	                row = row.previousSibling;
	                while (row && !Grid1.isBodyRecord(row)) {
	                    row = row.previousSibling;
	                    newIndex--;
	                }

	                if (row) {
	                    Grid1.selectRecord(newIndex);
	                } else {
	                    newIndex = -1;
	                }
	            } else {
	                newIndex = selectedIndex + 1;
	                row = row.nextSibling;
	                while (row && !Grid1.isBodyRecord(row)) {
	                    row = row.nextSibling;
	                    newIndex++;
	                }

	                if (row) {
	                    Grid1.selectRecord(newIndex);
	                } else {
	                    newIndex = -1;
	                }
	            }

	            if (newIndex != -1) {
	                Grid1.deselectRecord(selectedIndex);
	            }
	        }

	        return false;
	    }

	    function addProduct() {
	        if (lastSavedData == null) {
	            return;
	        }

	        document.getElementById('ProductID').value = 0;
	        lastSavedData = { 'ProductID': 0, CategoryID: document.getElementById('CategoryID').value, 'ProductName': ProductName.value(), 'UnitPrice': UnitPrice.value() };
	        PageMethods.InsertProduct(lastSavedData, onSucceededInsertProduct, onFailedInsertProduct);

	        return false;
	    }

	    function onSucceededInsertProduct(newId) {
	        lastSavedData.ProductID = newId;

	        var row = Grid1.GridBodyContainer.firstChild.firstChild.childNodes[1].firstChild;
	        var index = 0;
	        while (row && row.className != 'ob_gRS') {
	            row = row.nextSibling;
	            index++;
	        }

	        if (row != null) {
	            Grid1.deselectRecord(index);
	            var newRow = Grid1.addBodyRow(true, index);
	            Grid1.selectRecord(index + 1);
	            window.setTimeout('Grid1.assignBodyEvents();', 150);

	            var element = new Object();
	            element.Cells = new Array();

	            element.Cells[0] = new Object();
	            element.Cells[0].Value = lastSavedData.ProductID;
	            element.Cells[1] = new Object();
	            element.Cells[1].Value = lastSavedData.CategoryID;
	            element.Cells[2] = new Object();
	            element.Cells[2].Value = lastSavedData.ProductName;
	            element.Cells[3] = new Object();
	            element.Cells[3].Value = lastSavedData.UnitPrice;

	            element.Cells['ProductID'] = new Object();
	            element.Cells['ProductID'].Value = lastSavedData.ProductID;
	            element.Cells['CategoryID'] = new Object();
	            element.Cells['CategoryID'].Value = lastSavedData.CategoryID;
	            element.Cells['ProductName'] = new Object();
	            element.Cells['ProductName'].Value = lastSavedData.ProductName;
	            element.Cells['UnitPrice'] = new Object();
	            element.Cells['UnitPrice'].Value = lastSavedData.UnitPrice;

	            Grid1.Rows.splice(index + 1, 0, element);

	            newRow.childNodes[0].firstChild.firstChild.innerHTML = lastSavedData.ProductID;
	            newRow.childNodes[1].firstChild.firstChild.innerHTML = lastSavedData.CategoryID;
	            newRow.childNodes[2].firstChild.firstChild.innerHTML = lastSavedData.ProductName;
	            newRow.childNodes[3].firstChild.firstChild.innerHTML = lastSavedData.UnitPrice;

	            Grid1_ClientSelect(Grid1, [lastSavedData]);
	        }
	    }

	    function onFailedInsertProduct() {
	    }

	    window.onload = function () {
	        oboutGrid.prototype._executeOnCallbackScrollingEvents = function () {
	            var numberOfRows = 1;
	            var body = this.GridBodyContainer.firstChild.firstChild.childNodes[1];
	            for (var i = 0; i < body.childNodes.length; i++) {
	                if (this.isBodyRecord(body.childNodes[i])) {
	                    numberOfRows++;
	                }
	            }

	            if (numberOfRows >= this.getTotalNumberOfRecords()) {
	                this._virtualScrollingHelperBottomAdded = false;
	                this.GridBodyContainer.firstChild.style.paddingTop = '0px';
	                this.GridBodyContainer.firstChild.style.paddingBottom = '0px';
	            } else {
	                if (!this.UsePagingForVirtualScrolling) {
	                    if (!this._virtualScrollingHelperBottomAdded) {
	                        this._virtualScrollingHelperBottomAdded = true;
	                        this.GridBodyContainer.firstChild.style.paddingBottom = '50px';
	                    }
	                } else {
	                    var totalNumberOfPages = this.getTotalNumberOfPages();
	                    var currentPageIndex = this.getCurrentPageIndex();

	                    var topPadding = this.GridBodyContainer.offsetHeight * currentPageIndex;
	                    var bottomPadding = this.GridBodyContainer.offsetHeight * (totalNumberOfPages - currentPageIndex - 1);

	                    this.GridBodyContainer.firstChild.style.paddingTop = topPadding + 'px';
	                    this.GridBodyContainer.firstChild.style.paddingBottom = bottomPadding + 'px';

	                    this._lastScrollTopUsedForVirtualScrolling = topPadding;
	                    this.GridBodyContainer.scrollTop = topPadding;
	                }
	            }

	            this._currentScrollTop = this.GridBodyContainer.scrollTop;
	        }
	    }
    </script>
</asp:Content>
