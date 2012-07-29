<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_EditablePanels.aspx.cs" Inherits="HTMLEditor_cs_EditablePanels" %>
<%@ Register Src="UserControls/EditablePanel.ascx" TagName="EditablePanel" TagPrefix="uc" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %>

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
                if (typeof EditablePanelTotal.ActiveEditorID != 'undefined' && EditablePanelTotal.ActiveEditorID != null) {
                    var editor = $find(EditablePanelTotal.ActiveEditorID);
                    if (editor) {
                        editor.get_editPanel().set_activeMode(Obout.Ajax.UI.HTMLEditor.ActiveModeType.Preview);
                    }
                    EditablePanelTotal.ActiveEditorID = null;
                }
                if (EditablePanelTotal.WaitImage.parentNode == null) {
                    if (typeof EditablePanelTotal.ActivePanelID != 'undefined' && EditablePanelTotal.ActivePanelID != null) {
                        var el = $get(EditablePanelTotal.ActivePanelID);
                        EditablePanelTotal.WaitImage.style.top = Math.round((el.offsetHeight - EditablePanelTotal.WaitImage.height) / 2) + 'px';
                        EditablePanelTotal.WaitImage.style.left = Math.round((el.offsetWidth - EditablePanelTotal.WaitImage.width) / 2) + 'px';
                        el.appendChild(EditablePanelTotal.WaitImage);
                        EditablePanelTotal.ActivePanelID = null;
                    } else {
                        var el = $get("panelDiv");
                        var el1 = $get("panelTable");
                        EditablePanelTotal.WaitImage.style.top = Math.round((el1.offsetHeight - EditablePanelTotal.WaitImage.height) / 2) + 'px';
                        EditablePanelTotal.WaitImage.style.left = Math.round((el1.offsetWidth - EditablePanelTotal.WaitImage.width) / 2) + 'px';
                        el.appendChild(EditablePanelTotal.WaitImage);
                    }
                }
            }
        }
        Sys.Net.WebRequestManager.add_invokingRequest(invokingRequest);
        if (EditablePanelTotal.WaitImage.parentNode) {
            EditablePanelTotal.WaitImage.parentNode.removeChild(EditablePanelTotal.WaitImage);
        }
    }
</script>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <obout:PopupHolder runat="server" ID="popupHolder" DefaultAddPolicy="Demand" />
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <div id="panelDiv" style="position: relative">
                    <table cellpadding="0" cellspacing="0" border="0" id="panelTable">
                        <tr>
                            <td>
                                <asp:Panel runat="server">
                                    <uc:EditablePanel runat="server" ID="panel1" PopupHolderID="popupHolder" />
                                </asp:Panel>
                            </td>
                            <td>
                                <asp:Panel runat="server">
                                    <uc:EditablePanel runat="server" ID="panel2" PopupHolderID="popupHolder" />
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel runat="server">
                                    <uc:EditablePanel runat="server" ID="panel3" PopupHolderID="popupHolder" />
                                </asp:Panel>
                            </td>
                            <td>
                                <asp:Panel runat="server">
                                    <uc:EditablePanel runat="server" ID="panel4" PopupHolderID="popupHolder" />
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button runat="server" Text="Submit content" ID="Submit" OnClick="Submit_click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
