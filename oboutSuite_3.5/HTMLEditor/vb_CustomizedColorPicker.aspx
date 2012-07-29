<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_CustomizedColorPicker.aspx.vb" Inherits="HTMLEditor_vb_CustomizedColorPicker" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor.Popups"
    TagPrefix="obout" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.ColorPicker"
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
<body>
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - Customized <b>ColorPicker</b> using</span>
    <br /><br />
    Customized <b>ColorPicker</b> is used here, click any of two
    <img style="background-color:#C2C2C2;"
       src="<%=Page.ClientScript.GetWebResourceUrl(GetType(Obout.Ajax.UI.HTMLEditor.Editor), "Obout.Ajax.UI.HTMLEditor.Images.ed_selector_n.gif")%>"
       onmouseover="this.style.backgroundColor='#3C8AFF';" onmouseout="this.style.backgroundColor='#C2C2C2';"
       align="absmiddle" alt="" />
    color selectors in the top toolbar.<br />
    The <b>ColorPicker</b> has additional custom colors and doesn't contain
    <img
       src="<%=Page.ClientScript.GetWebResourceUrl(GetType(Obout.Ajax.UI.ColorPicker.ColorPickerExtender),"Obout.Ajax.UI.ColorPicker.Images.SaveButton.gif")%>"
       onmouseover="this.src = '<%=Page.ClientScript.GetWebResourceUrl(GetType(Obout.Ajax.UI.ColorPicker.ColorPickerExtender),"Obout.Ajax.UI.ColorPicker.Images.SaveButtonOver.gif")%>';"
       onmouseout="this.src = '<%=Page.ClientScript.GetWebResourceUrl(GetType(Obout.Ajax.UI.ColorPicker.ColorPickerExtender),"Obout.Ajax.UI.ColorPicker.Images.SaveButton.gif")%>';"
       align="absmiddle" alt="" title="Apply selected color" />
    button, so you can select color in <span style="color: #0d007f">'One touch'</span>.
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <obout:PopupHolder runat="server" id="popupHolder" DefaultAddPolicy="Demand" >
           <Preload>
               <%-- preload 'Special characters' popup --%>
               <obout:SpecialCharacters runat="server" />
               <%-- preload 'Color picker' popup --%>
               <obout:ColorPickerPopup runat="server">
                   <%-- color is picked in 'one touch' without 'Picker' button: PickButton="false" --%>
                   <ColorPicker PickButton="false" >
                        <%-- define additional custom colors --%>
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
                   </ColorPicker>
               </obout:ColorPickerPopup>
           </Preload>
        </obout:PopupHolder>
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
               <obout:Editor runat="server" Id="editor" PopupHolderID="popupHolder" Height="500px" Width="100%">
              </obout:Editor>
               <br />
               <asp:Button runat="server" Text="Submit content" ID="Submit" OnClick="Submit_click" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>
