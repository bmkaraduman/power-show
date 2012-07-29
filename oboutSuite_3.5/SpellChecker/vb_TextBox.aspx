<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_TextBox.aspx.vb" Inherits="SpellChecker_vb_TextBox" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.SpellChecker"
    TagPrefix="obout" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Spell Checker example</title>
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
<body>
    <span class="tdText"><b>Obout.Ajax.UI.SpellChecker</b> - MultiLine <b>TextBox</b> with <b>SpellCheckExtender</b></span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <obout:PopupHolder runat="server" id="popupHolder" DefaultAddPolicy="Demand" />

        <asp:TextBox runat="server" Rows="20" Columns="60" Text="qqq aaa text mmm" TextMode="MultiLine" id="textbox" spellcheck="false" />
        <br />
        <asp:Button runat="server" Text="Spel Checker" OnClientClick="return false;" ID="button" />
        <obout:SpellCheckExtender runat="server" ID="spelcheck" PopupHolderID="popupHolder" PopupButtonID="button" TargetControlID="textbox"
                    LeftMarker="[[" RightMarker="]]"
        />
    </form>
    <br /><br />
    <a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>
