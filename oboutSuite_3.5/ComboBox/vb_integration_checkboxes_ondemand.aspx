<%@ Page Title="" Language="VB" ValidateRequest="false" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_integration_checkboxes_ondemand.aspx.vb" Inherits="ComboBox_vb_integration_checkboxes_ondemand" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function ComboBox1_ItemClick(sender, index) {
            var item = ComboBox1.getItemByIndex(index);
            var checkbox = item.getElementsByTagName('INPUT')[0];
            checkbox.checked = !checkbox.checked;

            updateComboBoxSelection();
        }

        function updateComboBoxSelection() {
            var selectedItems = new Array();
            var checkboxes = ComboBox1.ItemsContainer.getElementsByTagName('INPUT');
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    selectedItems.push(ComboBox1.options[i].text);
                }
            }

            ComboBox1.setText(selectedItems.join(', '));
        }

        function handleCheckBoxClick(e) {
            if (!e) { e = window.event; }
            if (!e) { return false; }
            e.cancelBubble = true;
            if (e.stopPropagation) { e.stopPropagation(); }

            updateComboBoxSelection();
        }

        window.onload = function () {
            ComboBox1.setText('');
            Obout.ComboBox.prototype._loadItemsOnDemandCallbackOld = Obout.ComboBox.prototype._loadItemsOnDemandCallback;
            Obout.ComboBox.prototype._loadItemsOnDemandCallback = function (param1, param2) {
                this._loadItemsOnDemandCallbackOld(param1, param2);

                attachCheckBoxesOnClickHandlers();
            }
        }

        function attachCheckBoxesOnClickHandlers() {
            if (typeof (ComboBox1) == 'undefined' || typeof (ComboBox1.ItemsContainer) == 'undefined') {
                window.setTimeout(attachCheckBoxesOnClickHandlers, 250);
                return;
            }

            var checkboxes = ComboBox1.ItemsContainer.getElementsByTagName('INPUT');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].onclick = handleCheckBoxClick;
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Items with ASP.NET CheckBox Controls Loaded On-Demand</b></span>	
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" /> 

    <obout:OboutButton ID="OboutButton1" runat="server" Text="Order" OnClick="Order" />

    <span class="tdText">
        <asp:Literal runat="server" ID="OrderDetails" />
    </span>
    
    <br /><br /><br />
    
    <span class="tdText">
        The items of the ComboBox can be loaded on-demand (via AJAX requests). The advantage of using this approach<br />
        is that the items are loaded only when the end user types something into the input field or opens the drop down menu <br />(by clicking on the arrow button). 
        Thus, the page will load very fast because no item is loaded on page load.<br /><br />
        
        In order to enable the on demand loading feature, set the <b>EnableLoadOnDemand</b> property to <span class="option2">true</span>.<br />
        You also need to handle the <b>LoadingItems</b> server-side event, which is executed each time the ComboBox <br />
        requests items from the server via AJAX. The server-side event handler will load all the items that match the text typed in the input field.<br /><br />
        
        To improve the performance even further, you can use the "paging" approach for the load on demand feature. <br />
        Using this approach will force the ComboBox to load only a limited number at a time, instead of retrieving all the matches at once.<br />
        So for example, if there are 10,000 items in the database, you can configure the ComboBox to load 100 items at a time, <br />
        to make the on demand loading functionality run smoother.<br /><br />
        
        To load the next set of items, the end user simply needs to click on the footer text from the bottom of the list with items.<br /><br />

        The items of the ComboBox can be customized using templates. You can embed any content inside an item template, <br />
        including HTML markup and ASP.NET server controls (any control from the Obout suite may be added to a template).<br /><br />
        
        In order to set up an item template, use the <b>ItemTemplate</b> property of the ComboBox.<br />
        To extract data from the data item, use the <b>Eval</b> method which expects as a parameter <br />
        the name of the data field from which to load the data. <br /><br />
        
        This example showcases the use of <b>ASP.NET CheckBox</b> controls inside the items, which are loaded on demand.<br />
        The end user is able to select any number of items by clicking on them or by checking the checkboxes.
    </span>
    
</asp:Content>