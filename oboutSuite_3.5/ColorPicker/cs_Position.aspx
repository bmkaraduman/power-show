<%@ Page UICulture="auto" Language="C#" AutoEventWireup="true" CodeFile="cs_Position.aspx.cs" Inherits="ColorPicker_cs_Position" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.ColorPicker"
    TagPrefix="obout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ColorPicker Sample</title>
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
    <span class="tdText"><b>Obout.Ajax.UI.ColorPicker</b> - ColorPicker popup positioning</span>
    <br /><br />
    <form id="form1" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
     <b>Set position of the ColorPicker's popup:</b><br /><br />
     Vertical Position &nbsp; &nbsp;
     <select id="vPosition" style="width:100px;">
        <option value="TOP"   >Top</option>
        <option value="MIDDLE">Middle</option>
        <option value="BOTTOM" selected="selected">Bottom</option>
     </select>
     Top offset <input type="text" value="0" id="topoffset" style="width:30px;" />px
    <br />
     Horizontal Position
     <select id="hPosition" style="width:100px;">
        <option value="LEFT"  >Left</option>
        <option value="CENTER">Center</option>
        <option value="RIGHT" selected="selected">Right</option>
     </select>
     Left offset &nbsp;<input type="text" value="0" id="leftoffset" style="width:30px;" />px
    <br /><br />
    <center>
        Click to the TextBox to select background color:
        <br /><br />
        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
            <ContentTemplate>
                <asp:TextBox runat="server" Text="" id="textbox" ReadOnly="true" style="cursor: pointer; background-color: #FFFFFF"/>
                <obout:ColorPickerExtender runat="server" ID="spelcheck" OnClientOpen="onClientOpen" OnColorPostBack="color_postback"
                             AutoPostBack="true" TargetProperty="style.backgroundColor"
                             PopupButtonID="textbox" TargetControlID="textbox"
                />
            </ContentTemplate>
        </asp:UpdatePanel>
   </center>
    </form>
    <br /><br />
    <a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
<script type="text/JavaScript">
    function onClientOpen(sender, args) {
        sender.setColor(sender.get_targetElement().style.backgroundColor);

        var elVPosition = document.getElementById("vPosition");
        var elHPosition = document.getElementById("hPosition");
        var elTOffset = document.getElementById("topoffset");
        var elLOffset = document.getElementById("leftoffset");

        var vpose;
        switch (elVPosition.options.item(elVPosition.selectedIndex).value) {
            case "TOP": vpose = Obout.Ajax.UI.ColorPicker.VerticalPositionType.Top;
                break;
            case "MIDDLE": vpose = Obout.Ajax.UI.ColorPicker.VerticalPositionType.Middle;
                break;
            case "BOTTOM": vpose = Obout.Ajax.UI.ColorPicker.VerticalPositionType.Bottom;
                break;
        }

        var hpose;
        switch (elHPosition.options.item(elHPosition.selectedIndex).value) {
            case "LEFT": hpose = Obout.Ajax.UI.ColorPicker.HorizontalPositionType.Left;
                break;
            case "CENTER": hpose = Obout.Ajax.UI.ColorPicker.HorizontalPositionType.Center;
                break;
            case "RIGHT": hpose = Obout.Ajax.UI.ColorPicker.HorizontalPositionType.Right;
                break;
        }

        sender.set_verticalPosition(vpose);
        sender.set_horizontalPosition(hpose);
        
        sender.set_offsetTop(elTOffset.value);
        elTOffset.value = sender.get_offsetTop();
        sender.set_offsetLeft(elLOffset.value);
        elLOffset.value = sender.get_offsetLeft();
    }
</script>
</html>
