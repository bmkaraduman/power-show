<%@ Page UICulture="auto" Language="C#" AutoEventWireup="true" CodeFile="cs_WithImage.aspx.cs" Inherits="ColorPicker_cs_WithImage" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.ColorPicker"
    TagPrefix="ColorPicker" %>

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
    <span class="tdText"><b>Obout.Ajax.UI.ColorPicker</b> - 'One touch' Color Picker with image button</span>
    <br /><br />
    <form id="form1" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <center>
        Click to the image button to select background color:
        <br /><br />
        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
            <ContentTemplate>
                <asp:TextBox runat="server" Text="" id="textbox" ReadOnly="true" style="cursor: pointer; background-color: #FFFFFF"/>
                <asp:ImageButton BorderColor="Black" BorderStyle="Solid" BorderWidth="1" runat="server" ID="button" ImageUrl="ColorPicker.gif" />
                <ColorPicker:ColorPickerExtender runat="server" ID="spelcheck" PickButton="false" OnClientOpen="onClientOpen"
                         OnColorPostBack="color_postback" AutoPostBack="true" TargetProperty="style.backgroundColor"
                         PopupButtonID="button" TargetControlID="textbox"
                />
            </ContentTemplate>
        </asp:UpdatePanel>
    </center>
    </form>
    <br /><br />
    <a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
<script type="text/JavaScript">
    function pageLoad(sender, args) {
        //alert(args.get_isPartialLoad() + " " + args.get_components().length);
    }
    function onClientOpen(sender, args) {
        sender.setColor(sender.get_targetElement().style.backgroundColor);
    }
</script>
</html>
