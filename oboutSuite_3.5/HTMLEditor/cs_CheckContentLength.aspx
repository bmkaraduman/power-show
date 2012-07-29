<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_CheckContentLength.aspx.cs" Inherits="HTMLEditor_cs_CheckContentLength" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton"
    TagPrefix="obout" %>

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
<body style="font:12px Verdana;" scroll="no">
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - Check the length of the content</span>
    <br /><br />
    The maximum number of characters for the plain text is set to <b>300</b> here.
    <br />
    Try to type more characters.
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <asp:UpdatePanel ID="updatePanel1" runat="server"><ContentTemplate>
            <obout:Editor runat="server" Id="editor" Height="400px" Width="600px">
                <BottomToolBar ShowDesignButton="false" ShowHtmlTextButton="false" ShowPreviewButton="false" ShowPlainTextCounter="true" />
            </obout:Editor>
            <br />
            <asp:Button runat="server" Text="Submit content" ID="Submit" OnClick="Submit_click" />
        </ContentTemplate></asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
<script type="text/javascript">
    // Set the maximum length of the plain text
    var maximumTextLength = 300;
    
    // do some things on the page load
    function pageLoad() {
        var editor = $find("<%= editor.ClientID %>");
        var bottomToolbar = editor.get_bottomToolbar();
        var editPanel = editor.get_editPanel();
        var designPanel = editPanel.get_modePanels()[Obout.Ajax.UI.HTMLEditor.ActiveModeType.Design];

        // find the 'PlainTextCounter' button in the bottom toolbar
        var plainTextCounter = null;
        var buttons = bottomToolbar.get_buttons();
        for (var i = 0; i < buttons.length; i++) {
            var button = buttons[i];
            if (button.get_buttonName() == "PlainTextCounter") {
                plainTextCounter = button;
                break;
            }
        }

        // if no 'PlainTextCounter' button found
        if (plainTextCounter == null) return;

        // save the original '_saveContent' method
        designPanel._saveContentOriginal = designPanel._saveContent;
        // our 'saved' flag
        designPanel._mySavedFlag = false;
        // redefine the '_saveContent' method
        designPanel._saveContent = function() {
            this._mySavedFlag = true;
            return this._saveContentOriginal();
        };
        // add a custom method (event handler) to the 'DesignPanel' control
        designPanel._onMyContentChanged = function(sender, args) {
            // input field of the 'PlainTextCounter' button
            var input = plainTextCounter.get_input();
            // get the current plain text length
            var currentPlainTextLength = input.value;
            // if too long text - 'undo' the last operation
            if (currentPlainTextLength > maximumTextLength) {
                // set some css of the input for attention
                input.style.backgroundColor = "#FF8080";
                input.style.fontWeight = "bold";
                // restore previously saved content
                designPanel.RestoreContent();
                // get the current plain text length again
                currentPlainTextLength = plainTextCounter.get_input().value;
            } else { // good plain text length
                // clear css for the input
                input.style.backgroundColor = "";
                input.style.fontWeight = "";
                if (currentPlainTextLength != this._currentPlainTextLength && !this._mySavedFlag) {
                    // if the length has been changed and no 'save' operation is done yet
                    // save for the 'undo' operation
                    this.SaveContent();
                }
            }
            // store the current plain text length
            this._currentPlainTextLength = currentPlainTextLength;
            // reset 'saved' flag
            this._mySavedFlag = false;
        };
        // add a handler to the 'contentChanged' event
        designPanel.add_contentChanged(Function.createDelegate(designPanel, designPanel._onMyContentChanged));
        // store the initial plain text length
        designPanel._currentPlainTextLength = plainTextCounter.get_input().value;
        // clear the content if the plain text is too long
        if (designPanel._currentPlainTextLength > maximumTextLength) {
            alert("Too large content...");
            // clear the inner iframe's body
            designPanel.get_doc().body.innerHTML = (Sys.Browser.agent == Sys.Browser.InternetExplorer) ? "" : "<br />";
            // raise 'contentChange'
            designPanel.onContentChanged();
        }
    }
</script>
</html>
