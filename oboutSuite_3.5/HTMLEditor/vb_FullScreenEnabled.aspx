<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_FullScreenEnabled.aspx.vb" Inherits="HTMLEditor_vb_FullScreenEnabled" %>
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
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - <b>Editor</b> control with <b>'Full screen'</b> enabled</span>
    <br /><br />
    Click button in the bottom toolbar: <img align="absMiddle" src="SiteImages/FullScreen.gif" style="border-width:1px; border-color:black; border-style: solid" />
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
               <obout:Editor runat="server" Id="editor" Height="400px" Width="600px">
                 <EditPanel AutoFocus="true" ActiveMode="design" IndentInDesignMode="20" />
                 <BottomToolBar ShowDesignButton="true" ShowHtmlTextButton="true" ShowPreviewButton="true" ShowFullScreenButton="true" >
                 </BottomToolBar>
               </obout:Editor>
               <br />
               <asp:Button runat="server" Text="Submit content" ID="Submit" OnClick="Submit_click" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>
