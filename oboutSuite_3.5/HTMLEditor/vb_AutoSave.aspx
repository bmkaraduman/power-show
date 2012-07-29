<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_AutoSave.aspx.vb" Inherits="HTMLEditor_vb_AutoSave" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
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
    <script type="text/javascript">
        // autosave time value
        var timerValue = 60000; // 1 min
        // autosave timer handler
        var timerHandler = null;

        // save current content of the Editor
        function saveCurrentContent() {
            // send content to server
            function sendToServer(args) {
              <%= sCallbackInvocation %>;
            }
            var editPanel = $find("<%= editor.ClientID %>").get_editPanel();
            var content = editPanel.get_content();
            // clear the timer handler
            timerHandler = null;
            // send content to server
            sendToServer(content);
        }

        // after callback
        function Callback(val, context) {
            $get("logDiv").innerHTML += "content was saved at "+val+" (Server time)<br/>";
        }

        // on EditPanel load
        function editPanelLoad(sender, args) {
            // Design panel component
            var designPanel = sender.get_modePanels()[Obout.Ajax.UI.HTMLEditor.ActiveModeType.Design];
            // add 'contentChanged' event handler
            designPanel.add_contentChanged(contentChangedHandler);
        }

        // 'contentChanged' event handler
        function contentChangedHandler(sender, args) {
            // timer is set already?
            if (timerHandler != null) {
                // reset the timer
                clearTimeout(timerHandler);
            }
            // try to save content with delay
            timerHandler = setTimeout(saveCurrentContent, timerValue);
        }
    </script>
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - <b>Editor</b> control with autosave feature</span>
    <br /><br />
    Content will be automatically saved after last change in one minute.
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />

        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
               <obout:Editor runat="server" Id="editor" EditPanel-Height="400px" EditPanel-OnClientLoaded="editPanelLoad" Width="100%">
                 <TopToolbar PreservePlace="true" />
                 <BottomToolBar ShowDesignButton="false" ShowHtmlTextButton="false" ShowPreviewButton="false" />
               </obout:Editor>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        Autosave Log:
        <div id="logDiv" style="color:blue; border: 1px solid black; width: 400px; height: 100px; overflow:auto"></div>
    </form>
    <br /><br /><a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>
