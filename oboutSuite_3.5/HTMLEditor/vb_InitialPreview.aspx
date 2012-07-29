<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_InitialPreview.aspx.vb" Inherits="HTMLEditor_vb_InitialPreview" %>
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
<script type="text/JavaScript">

var savedContent;
var activeMode = null;

function onClientEdit() {
    var editPanel = $find("<%= editor.ClientID %>").get_editPanel();
    $get("<%= EditButton.ClientID %>").style.display = "none";
    $get("<%= CancelButton.ClientID %>").style.display = "";
    $get("<%= SubmitButton.ClientID %>").style.display = "";
    $get("<%= ClearContent.ClientID %>").style.display = "";

    /* save content for restoring after 'cancel' */
    savedContent = editPanel.get_content();

    /* set the previous edit mode or 'Design' mode on first run */
    if (activeMode == null) {
        activeMode = Obout.Ajax.UI.HTMLEditor.ActiveModeType.Design;
    }
    editPanel.set_activeMode(activeMode);
    return false;
}

function onClientCancel() {
    var editPanel = $find("<%= editor.ClientID %>").get_editPanel();
    $get("<%= EditButton.ClientID %>").style.display = "";
    $get("<%= CancelButton.ClientID %>").style.display = "none";
    $get("<%= SubmitButton.ClientID %>").style.display = "none";
    $get("<%= ClearContent.ClientID %>").style.display = "none";

    /* set 'Preview' mode */
    editPanel.set_activeMode(Obout.Ajax.UI.HTMLEditor.ActiveModeType.Preview);

    /* restore saved content */
    editPanel.set_content(savedContent);
    return false;
}

function onClearContent() {
    var editPanel = $find("<%= editor.ClientID %>").get_editPanel();
    editPanel.set_content("");
    return false;
}

function onActiveModeChanged(sender, e) {
    var newMode = e.get_newMode();
    if (newMode != Obout.Ajax.UI.HTMLEditor.ActiveModeType.Preview) {
        /* save new active edit mode  */
        activeMode = newMode;
    }
}

function onLoaded(sender, e) {
    $get("<%= EditButton.ClientID %>").style.display = "";
}
</script>
<body style="font:12px Verdana;">
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - <b>Editor</b> control with preview on load</span>
    <br /><br />
    <form id="form1" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <asp:UpdatePanel ID="updatePanel1" runat="server">
    <ContentTemplate>
       <obout:Editor runat="server" Id="editor" Height="500px" Width="100%">
           <EditPanel OnClientActiveModeChanged="onActiveModeChanged" OnClientLoaded="onLoaded" />
       </obout:Editor>
       <br />
       <asp:Button runat="server" Text="Edit content" ID="EditButton" OnClientClick="return onClientEdit();" Style="display:none" />
       <asp:Button runat="server" Text="Cancel" ID="CancelButton" OnClientClick="return onClientCancel();" Style="display:none" />
       <asp:Button runat="server" Text="Submit" ID="SubmitButton" Style="display:none" />
       <asp:Button runat="server" Text="Clear content" ID="ClearContent" OnClientClick="return onClearContent();" Style="display:none" />
    </ContentTemplate>
    </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>
