<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="cs_ondemand_initial_js.aspx.cs" Inherits="ComboBox_cs_ondemand_initial_js" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function setInitialText() {
            ComboBox1.options.clear();
            ComboBox1.options.add("E");
            ComboBox1._tryHidingEmptyText();
            ComboBox1.selectedIndex(0);
            ComboBox1._itemsLoadedOnOpen = false;
        }

        window.onload = function () {
            Obout.ComboBox.prototype._clearItems = function () {
                this._dropDownList.LastHighlightedItem = null;
                this._dropDownList.initOptionsCollection();
                this._sortedItems = new Array();

                this._dropDownList.ItemsInnerContainer.innerHTML = '';
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Initial Text on Client-Side</b></span>	
    
    <br /><br />
    
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" />

    <obout:OboutButton ID="OboutButton1" runat="server" Text="Set Initial Text" OnClientClick="setInitialText(); return false;" />
    
    <br /><br /><br />
    
    <span class="tdText">
        The items of the ComboBox can be loaded on-demand (via AJAX requests). The advantage of using this approach<br />
        is that the items are loaded only when the end user types something into the input field. <br />
        Thus, the page will load very fast because no item is loaded on page load.<br /><br />
        
        In order to enable the on demand loading feature, set the <b>EnableLoadOnDemand</b> property to <span class="option2">true</span>.<br />
        You also need to handle the <b>LoadingItems</b> server-side event, which is executed each time the ComboBox <br />
        requests items from the server via AJAX. The server-side event handler will load all the items that match the text typed in the input field.<br /><br />
        
        If you need to initially load the items that match a specific text, you need to use a <b>ComboBoxItem</b> that has its <b>Text</b> and <b>Value</b><br />
        properties set to the initial text that you want to search for. Also, the <b>Selected</b> property of this ComboBoxItem needs to be set to <span class="option2">true</span>.<br /><br />

        For this sample we used a JavaScript function to add a new item to the list and select it. <br />
        Then, when the user will focus the ComboBox, the items starting with "E" will be loaded.
    </span>
    
</asp:Content>
