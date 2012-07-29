<%@ Page UICulture="auto" Language="VB" AutoEventWireup="true" CodeFile="vb_CustomColorsOnly.aspx.vb" Inherits="ColorPicker_vb_CustomColorsOnly" %>
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
    <span class="tdText"><b>Obout.Ajax.UI.ColorPicker</b> - Custom colors only</span>
    <br /><br />
    <form id="form1" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <center>
        Click to the TextBox to select background color:
        <br /><br />
        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
          <ContentTemplate>
             <asp:TextBox runat="server" Text="" id="textbox" ReadOnly="true" style="cursor: pointer; background-color: #FFFFFF"/>
             <obout:ColorPickerExtender runat="server" ID="spelcheck" OnClientOpen="onClientOpen" Width="175px"
                          SpectrumColors="false" WebColors="false" CustomColorsInLine="8" PickButton="false" HexView="false"
                          OnColorPostBack="color_postback" AutoPostBack="true" TargetProperty="style.backgroundColor"
                          PopupButtonID="textbox" TargetControlID="textbox" >
                 <CustomColors>
                     <obout:CustomColor Value="TRANSPARENT" Title="transparent" />
                     <obout:CustomColor Value="#FFFF00" />
                     <obout:CustomColor Value="#00FF00" />
                     <obout:CustomColor Value="#ADD8E6" />
                     <obout:CustomColor Value="#008000" />
                     <obout:CustomColor Value="#808080" />
                     <obout:CustomColor Value="#FFD700" />
                     <obout:CustomColor Value="#FFE4E1" />
                     <obout:CustomColor Value="#00FFFF" />
                     <obout:CustomColor Value="#87CEEB" />
                     <obout:CustomColor Value="#0000FF" />
                     <obout:CustomColor Value="#A9A9A9" />
                     <obout:CustomColor Value="#FFA500" />
                     <obout:CustomColor Value="#FFC0CB" />
                     <obout:CustomColor Value="#A52A2A" />
                     <obout:CustomColor Value="#008080" />
                     <obout:CustomColor Value="#000080" />
                     <obout:CustomColor Value="#C0C0C0" />
                     <obout:CustomColor Value="#FF0000" />
                     <obout:CustomColor Value="#C71585" />
                     <obout:CustomColor Value="#8B0000" />
                     <obout:CustomColor Value="#4B0082" />
                     <obout:CustomColor Value="#000000" />
                     <obout:CustomColor Value="#FFFFFF" />
                 </CustomColors>
             </obout:ColorPickerExtender>
          </ContentTemplate>
        </asp:UpdatePanel>
    </center>
    </form>
    <br /><br />
    <a href="Default.aspx?type=VBNET">< Back to examples</a>
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
