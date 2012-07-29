<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_moveToWord.aspx.cs" Inherits="HTMLEditor_cs_moveToWord" %>
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
<script type="text/JavaScript">
    function doit(mode) {
        var designMode = Obout.Ajax.UI.HTMLEditor.ActiveModeType.Design;
        var editPanel = $find("<%= editor.ClientID %>").get_editPanel();
        // current mode
        var activeMode = editPanel.get_activeMode();
        // for 'Design' mode only
        if (activeMode == designMode) {
            var designPanel = editPanel.get_activePanel();
            var inputElement = $get("<%= numberOfWord.ClientID %>");
            var n = parseInt(inputElement.value);
            n = isNaN(n) ? 0 : n;
            inputElement.value = n;
            designPanel.moveToWord(n, mode);
        }
        return false;
    }
</script>
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - Example of the <b>DesignPanel</b> component's <i>moveToWord()</i> client-side method</span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        Here you can set cursor to the specified word in the content or select(highlight) the specified word.
        <br /><br />
        Plain text word number (start from 0): <asp:TextBox runat="server" ID="numberOfWord" Text="0" style="width:30px" /><br />
        <asp:Button runat="server" OnClientClick="return doit(2);" Text="Select the whole word" />
        <asp:Button runat="server" OnClientClick="return doit(0);" Text="Set cursor to the start of the word" />
        <asp:Button runat="server" OnClientClick="return doit(1);" Text="Set cursor to the end of the word" />
        <br /><br />
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
               <obout:Editor runat="server" Id="editor" Height="500px" Width="100%" />
               <br />
               <asp:Button runat="server" Text="Submit content" ID="Submit" OnClick="Submit_click" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
</html>