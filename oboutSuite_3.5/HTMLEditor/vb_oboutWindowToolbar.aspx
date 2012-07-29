<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_oboutWindowToolbar.aspx.vb" Inherits="HTMLEditor_vb_oboutWindowToolbar" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    TagPrefix="obout"
    Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Editor Sample</title>
    <style type="text/css">
            a {
                   font-size:10pt;font-family:Tahoma
            }
            a:hover {
                   color:crimson;
            }
            .tdText {
                    font:11px Verdana;
                    color:#333333;
            }
    </style>
</head>
    <script type="text/javascript">
        function windowClose() {
            $get("showToolbarButton").style.visibility = "visible";
        }
        var editMode = null;
        function pageLoad() {
            // trick against incorrect script loading on partial postback
            // if Safari or Google Chrome
            if (Sys.Browser.agent === Sys.Browser.Safari) {
                if (typeof Sys._ScriptLoader.prototype._loadScriptsInternal_saved != "function") {
                    // save some original functions
                    Sys._ScriptLoader.prototype._loadScriptsInternal_saved = Sys._ScriptLoader.prototype._loadScriptsInternal;
                    Sys.UI.DomEvent.removeHandler_saved = Sys.UI.DomEvent.removeHandler;
                    // override them
                    Sys._ScriptLoader.prototype._loadScriptsInternal = function () {
                        var client = Sys.Browser.agent;
                        Sys.Browser.agent = Sys.Browser.InternetExplorer;
                        $removeHandler = Sys.UI.DomEvent.removeHandler = function (element, eventName, handler) {
                            try {
                                Sys.UI.DomEvent.removeHandler_saved(element, eventName, handler);
                            } catch (ex) {
                            }
                        };
                        this._loadScriptsInternal_saved();
                        Sys.Browser.agent = client;
                    }
                } else {
                    $removeHandler = Sys.UI.DomEvent.removeHandler = Sys.UI.DomEvent.removeHandler_saved;
                }
            }


            function invokingRequest() {
                Sys.Net.WebRequestManager.remove_invokingRequest(invokingRequest);
                if (!Obout.Ajax.UI.HTMLEditor.AjaxPopupLoadingInProgress) {
                    var editPanel = $find("<%= EditPanel.ClientID %>");
                    editMode = editPanel.get_activeMode();
                    editPanel.set_activeMode(Obout.Ajax.UI.HTMLEditor.ActiveModeType.Preview);
                    if (typeof myWindow != "undefined" && myWindow != null) {
                        myWindow.Close();
                    }
                    $get("wait").style.visibility = "visible";
                    var showToolbarButton = $get("showToolbarButton");
                    showToolbarButton.style.display = "";
                    showToolbarButton.style.cursor = "text";
                    showToolbarButton.onclick = function() { };
                    showToolbarButton.style.visibility = 'hidden';
                }
            }
            Sys.Net.WebRequestManager.add_invokingRequest(invokingRequest);
            var wait = $get("wait");
            wait.style.visibility = "hidden";
            wait.style.height = document.getElementById("<%=Submit.ClientID%>").offsetHeight + "px";
            var editPanel = $find("<%= EditPanel.ClientID %>");
            editPanel.set_activeMode(editMode == null ? Obout.Ajax.UI.HTMLEditor.ActiveModeType.Design : editMode);
        }
        function checkWindow() {
            if (typeof myWindow == "undefined" || myWindow == null) {
                setTimeout(checkWindow, 10);
            } else {
                myWindow.Open();
                $get("showToolbarButton").style.visibility = "hidden";
            }
        }
        function showToolbar() {
            checkWindow();
            return false;
        }
        function editPanelLoaded(sender, args) {
            var showToolbarButton = $get("showToolbarButton");
            showToolbarButton.style.cursor = "pointer";
            showToolbarButton.onclick = showToolbar;
            showToolbarButton.style.visibility = "visible";
        }
    </script>
    <style type="text/css">
        .toptoolbar
        {
                cursor:text;
                padding: 0px 2px 2px 2px;
                border-bottom: 1px solid #C2C2C2;
                border-left: 1px solid #C2C2C2;
                border-right: 1px solid #C2C2C2;
        }
    </style>
    <body style="font:12px Verdana;" scroll="no">
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - <b>Toolbar</b> inside the <b>Window</b> control</span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <obout:PopupHolder runat="server" id="popupHolder" DefaultAddPolicy="Demand" >
        </obout:PopupHolder>
        <a id="showToolbarButton" style="cursor:text; visibility:hidden; font-family: Verdana; font-size:12px; text-decoration: underline;">Open toolbar window</a>
        <br /><br />
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
               <obout:EditorEditPanel PopupHolderID="form1:popupHolder" runat="server" Id="EditPanel"
                           AutoFocus="true" Width="100%" Height="300px" OnClientLoaded="editPanelLoaded" 
                           LinkedToolbars="myWindow:TopToolbar" Style="border: 1px solid #C2C2C2;" />
            </ContentTemplate>
            <Triggers>
               <asp:AsyncPostBackTrigger ControlID="Submit" /> 
            </Triggers> 
        </asp:UpdatePanel>
        <obout:Window runat="server" ShowMaximizeButton="false" Title="Toolbar" Overflow="HIDDEN" ID="myWindow"
                   Width="615" Height="145" Left="450" Top="100" VisibleOnLoad="false" OnClientClose="windowClose();"
                   StyleFolder="../window/wdstyles/default" ShowStatusBar="false" >
            <obout:EditorTopToolbar runat="server" PopupHolderID="form1:popupHolder" Width="600px" PreservePlace="true"
                Id="TopToolbar" CssClass="toptoolbar" IgnoreTab="True" >
                <AddButtons>
                    <obout:VerticalSeparator ID="VerticalSeparator1" runat="server" />
                    <obout:PreviewMode ID="PreviewMode1" runat="server" style="float:right" />
                    <obout:HtmlMode ID="HtmlMode1" runat="server" style="float:right" />
                    <obout:DesignMode ID="DesignMode1" runat="server" style="float:right" />
                </AddButtons>
            </obout:EditorTopToolbar>
        </obout:Window>
        <asp:Button runat="server" Text="Submit content" ID="Submit" />
        <img alt="" id="wait" align="absMiddle" style="visibility:hidden; height: 30px" src="<%=Page.ClientScript.GetWebResourceUrl(GetType(Obout.Ajax.UI.HTMLEditor.Editor), "Obout.Ajax.UI.HTMLEditor.Images.ed_wait.gif")%>" />
    </form>
    <br /><br /><a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>