<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="cs_ondemand_minchars.aspx.cs" Inherits="ComboBox_cs_ondemand_minchars" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        window.onload = function () {
            Obout.ComboBox.prototype._sendAjaxRequestOld = Obout.ComboBox.prototype._sendAjaxRequest;
            Obout.ComboBox.prototype._sendAjaxRequest = function (text, append) {
                if (text.length > 2) {
                    this._sendAjaxRequestOld(text, append);
                }
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Load Items with MinChars</b></span>	
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" />
    
    <br /><br /><br />
    
    <span class="tdText">
        The items of the ComboBox can be loaded on-demand (via AJAX requests). The advantage of using this approach<br />
        is that the items are loaded only when the end user types something into the input field. <br />
        Thus, the page will load very fast because no item is loaded on page load.<br /><br />
        
        In order to enable the on demand loading feature, set the <b>EnableLoadOnDemand</b> property to <span class="option2">true</span>.<br />
        You also need to handle the <b>LoadingItems</b> server-side event, which is executed each time the ComboBox <br />
        requests items from the server via AJAX. The server-side event handler will load all the items that match the text typed in the input field.<br /><br />

        This sample showcases the usage of a buffer for the on demand loading feature. The AJAX request that will load the items from the server<br />
        is being sent only after the end user types three characters. Thus, the overhead on the backend database server will be reduced, <br />
        because the database is hit less often.
    </span>
    
</asp:Content>
