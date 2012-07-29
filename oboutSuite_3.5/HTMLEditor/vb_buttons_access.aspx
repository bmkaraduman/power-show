<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_buttons_access.aspx.vb" Inherits="HTMLEditor_vb_buttons_access" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
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
<body style="font:12px Verdana;">
<script type="text/JavaScript">
    function callButtonMethod(buttonName) {
        var toolbarButton = getTopToolbarButton(buttonName);
        if (toolbarButton == null || !toolbarButton.callMethod()) {
            alert("'" + buttonName + "' can not be executed.");
        }
        return false;
    }
    function getTopToolbarButton(buttonName) {
        var toolbarButton = null;
        var editor = $find("<%= editor.ClientID %>");
        var topToolbar = editor.get_topToolbar();
        var buttons = topToolbar.get_buttons();
        var buttonsLength = buttons.length;
        for (var i = 0; i < buttonsLength; i++) {
            var button = buttons[i];
            if (button.get_buttonName() == buttonName) {
                toolbarButton = button;
                break;
            }
        }
        return toolbarButton;
    }
    var editMode = null;
    function pageLoad(sender, e) {
        function invokingRequest() {
            Sys.Net.WebRequestManager.remove_invokingRequest(invokingRequest);
            if (!Obout.Ajax.UI.HTMLEditor.AjaxPopupLoadingInProgress) {
                var editor = $find("<%= editor.ClientID %>");
                var toolbar = editor.get_bottomToolbar();
                var buttons = toolbar.get_buttons();
                for (var i = 0; i < buttons.length; i++) {
                    var button = buttons[i];
                    button.set_preservePlace(true);
                    button.canBeShown = function () { return false; };
                    button.hideButton();
                }
                var editPanel = editor.get_editPanel();
                editMode = editPanel.get_activeMode();
                editPanel.set_activeMode(Obout.Ajax.UI.HTMLEditor.ActiveModeType.Preview);

                $get("<%= LinkButton1.ClientID %>").disabled = true;
                $get("<%= LinkButton2.ClientID %>").disabled = true;
                $get("<%= Submit.ClientID %>").disabled = true;
                $get("wait").style.visibility = "visible";
            }
        }
        Sys.Net.WebRequestManager.add_invokingRequest(invokingRequest);
        var wait = $get("wait");
        wait.style.visibility = "hidden";
        wait.style.height = document.getElementById("<%=Submit.ClientID%>").offsetHeight + "px";
        var editPanel = $find("<%= editor.ClientID %>").get_editPanel();
        editPanel.set_activeMode(editMode == null ? Obout.Ajax.UI.HTMLEditor.ActiveModeType.Design : editMode);
    }
</script>
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - Client-side access to the toolbar buttons' functionality</span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <obout:EditorPopupHolder runat="server" id="popupHolder" />

        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <ul>
                    <li>
                        <img style="background-color: Gray; margin:0px;" align="absmiddle" alt=""
                            src="<%= Page.ClientScript.GetWebResourceUrl(GetType(Obout.Ajax.UI.HTMLEditor.ToolbarButton.CommonButton), _
                                "Obout.Ajax.UI.HTMLEditor.Images.ed_SpellCheck_n.gif") %>" />
                        <asp:LinkButton ID="LinkButton1" runat="server" OnMouseDown="return callButtonMethod('SpellCheck');" OnClientClick="return false;" Text="Run spell checking" />
                    </li>
                    <li style="margin-top: 3px;">
                        <img style="background-color: Gray; margin:0px;" align="absmiddle" alt=""
                            src="<%= Page.ClientScript.GetWebResourceUrl(GetType(Obout.Ajax.UI.HTMLEditor.ToolbarButton.CommonButton), _
                                "Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_n.gif") %>" />
                        <asp:LinkButton ID="LinkButton2" runat="server" OnMouseDown="return callButtonMethod('Bold');" OnClientClick="return false;" Text="Toggle BOLD on selected text" />
                    </li>
                </ul>
               <obout:Editor runat="server" Id="editor" TopToolbar-PreservePlace="true" EditPanel-Height="450px" Width="100%" PopupHolderID="popupHolder" />
               <br />
               <asp:Button runat="server" Text="Submit content" ID="Submit" />
               <img alt="" id="wait" align="absMiddle" style="visibility:hidden; height: 30px" src="<%=Page.ClientScript.GetWebResourceUrl(GetType(Obout.Ajax.UI.HTMLEditor.Editor), "Obout.Ajax.UI.HTMLEditor.Images.ed_wait.gif")%>" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>