<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_ondemand_button.aspx.vb" Inherits="ComboBox_vb_ondemand_button" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        var allowLoadOnDemand = false;

        window.onload = function() {
            Obout.ComboBox.prototype._sendAjaxRequestOld = Obout.ComboBox.prototype._sendAjaxRequest;
            Obout.ComboBox.prototype._sendAjaxRequest = function(text, append) {
                if (allowLoadOnDemand) {
                    this._sendAjaxRequestOld(text, append);
                }
            }

            Obout.ComboBox.prototype._loadItemsOnDemandCallbackOld = Obout.ComboBox.prototype._loadItemsOnDemandCallback;
            Obout.ComboBox.prototype._loadItemsOnDemandCallback = function(param1, param2) {
                this._loadItemsOnDemandCallbackOld(param1, param2);
                //ComboBox1._dropDownList.TextBox.blur();
                ComboBox1._tempSelectedIndex = -1;
            }


        }

        function loadComboBoxItems() {
            allowLoadOnDemand = true;
            ComboBox1._sendAjaxRequest(ComboBox1._dropDownList.TextBox.value, false);
            allowLoadOnDemand = false;

            return false;
        }

    </script>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Load Items on Button Click</b></span>	
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" />

    <obout:OboutButton ID="OboutButton1" runat="server" Text="Load Items" OnClientClick="return loadComboBoxItems()" />
    
    <br /><br /><br />
    
    <span class="tdText">
        The items of the ComboBox can be loaded on-demand (via AJAX requests). <br />
        This sample showcases the loading of ComboBox items when an external button is clicked. <br />
        Thus, the page will load very fast because no item is loaded on page load.<br />
        Also, the overhead on the backend database server will be reduced, because the database is hit <br />
        only when the button is clicked, instead of each time the end user types a character.<br /><br />
        
        In order to enable the on demand loading feature, set the <b>EnableLoadOnDemand</b> property to <span class="option2">true</span>.<br />
        You also need to handle the <b>LoadingItems</b> server-side event, which is executed each time the ComboBox <br />
        requests items from the server via AJAX. The server-side event handler will load all the items that match the text typed in the input field.        
    </span>
    
</asp:Content>
