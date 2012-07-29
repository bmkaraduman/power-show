<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_SurroundHTML.aspx.cs" Inherits="HTMLEditor_cs_SurroundHTML" %>
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
    function surround() {
        var editPanel = $find("<%= editor.ClientID %>").get_editPanel();
        var activeMode = editPanel.get_activeMode();
        var design = Obout.Ajax.UI.HTMLEditor.ActiveModeType.Design;
        if (activeMode == design) {
            var designPanel = editPanel.get_activePanel();
            var retval = designPanel.surroundHTML("<span style='font-weight: bold; background-color:#FFFF00; color:#0000FF'>&lt;&lt;</span><span style='font-style:italic; background-color:#FFEEDD; color:#663300'>", "</span><span style='font-weight: bold; background-color:#FFFF00; color:#0000FF'>&gt;&gt;</span>");
            if (!retval) {
                alert("Nothing was selected!");
            }
        }
        return true;
    } 
</script>
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - Surround selected content with HTML text</span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <input type="button" onclick="surround();" value="Make a quote from the selected text"/>
                <obout:Editor runat="server" Id="editor" Height="500px" Width="100%" />
                <br />
                <asp:Button runat="server" Text="Submit content" ID="Submit" OnClick="Submit_click" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
</html>