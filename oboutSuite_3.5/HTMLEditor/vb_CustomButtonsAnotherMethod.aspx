<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_CustomButtonsAnotherMethod.aspx.vb" Inherits="HTMLEditor_vb_CustomButtonsAnotherMethod" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    TagPrefix="obout"
    Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" %>
<%@ Register
    TagPrefix="custom"
    Namespace="CustomToolbarButton" %>
<%@ Register
    TagPrefix="custom"
    Namespace="CustomEditor" %>

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
<body  style="font:12px Verdana; margin:2px; overflow:hidden;" scroll="no">
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - Custom <b>Editor</b> control (<b>App_Code</b>)</span>
    <br /><br />
    <form id="form1" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <obout:PopupHolder runat="server" id="popupHolder" DefaultAddPolicy="Demand" />
    <asp:UpdatePanel ID="updatePanel1" runat="server">
    <ContentTemplate>
       <custom:TestEditor runat="server" Id="editor" Height="500px" Width="100%" PopupHolderID="popupHolder" />
       <br />
       <asp:Button runat="server" Text="Submit content" ID="submit" />
    </ContentTemplate>
    </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>