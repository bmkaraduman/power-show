<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_FullScreen.aspx.cs" Inherits="HTMLEditor_cs_FullScreen" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton"
    TagPrefix="obout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html style="height:100%">
<head id="Head1" runat="server">
    <title>HTMLEditor Sample</title>
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
     </style>
</head>
<script type="text/javascript">
    function pageLoad() {
        if (Sys.Browser.agent == Sys.Browser.InternetExplorer ||
            Sys.Browser.agent == Sys.Browser.Firefox ||
            Sys.Browser.agent == Sys.Browser.Opera ||
            Sys.Browser.agent == Sys.Browser.Safari) {
            changeEditorHeight();
        } else {
            window.setTimeout(changeEditorHeight, 250);
        }
    }
    function changeEditorHeight(ev) {
        document.getElementById("<%= editor.ClientID %>").style.height = document.getElementById("container").offsetHeight
             - document.getElementById("header").offsetHeight
             - parseInt(document.body.style.marginTop) - parseInt(document.body.style.marginBottom)
             - (Obout.Ajax.UI.HTMLEditor.isIE?0:3)
             + "px";
        if (typeof ev != "undefined" && (Sys.Browser.agent == Sys.Browser.InternetExplorer && document.compatMode != "BackCompat" && Sys.Browser.version == 8 || Sys.Browser.agent == Sys.Browser.Opera)) {
            var editorControl = $find("<%= editor.ClientID %>");
            if (editorControl != null) {
                editorControl._onresize();
            }
        }
    }
</script>
<body style="font:12px Verdana; height:100%; margin:0px; overflow:hidden;" scroll="no" onresize="changeEditorHeight(event);">
    <div id="container" style="height:100%;">
        <form id="form1" runat="server">
            <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
            <div id="header" style="margin-bottom:3px;margin-left:3px;">
               <a href="Default.aspx?type=CSHARP">< Back to examples</a>
               <br /><br />
            </div>
            <asp:UpdatePanel ID="updatePanel1" runat="server">
                <ContentTemplate>
                    <obout:Editor runat="server" id="editor" Width="100%" Height="100%" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </form>
    </div>
</body>
</html>
