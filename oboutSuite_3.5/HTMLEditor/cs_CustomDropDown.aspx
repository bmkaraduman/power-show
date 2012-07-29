<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_CustomDropDown.aspx.cs" Inherits="HTMLEditor_cs_CustomDropDown" %>
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
    Namespace="CustomPopups" %>

<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.HTMLEditor.Popups" tagprefix="obout" %>
<%@ Register namespace="CustomPopups" tagprefix="custom" %>

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
<body  style="font:12px Verdana; overflow:hidden;" scroll="no">
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - Custom dropdown button defined in <b>App_Code</b></span>
    <br /><br />
    <img alt="" src="../HTMLEditor/SiteImages/CustomDropDown.gif" align="absmiddle" style="background-color:Blue;" />
    - set/reset CSS class name, put cursor in a word or select some text.<br />
    See files <span style="color: #00018b">"/App_Code/HTMLEditor/ClassButton.cs"</span>
    , <span style="color: #00018b">"/App_Obout/HTMLEditor/Scripts/ClassNameButton.js"</span>
    and <span style="color: #00018b">"/App_Obout/HTMLEditor/Scripts/ClassNamesPopup.js"</span> if you are interested in implementation of this custom dropdown list.
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <obout:EditorPopupHolder runat="server" id="popupHolder">
            <preload>
                <custom:ClassNamesPopup runat="server" />
            </preload>
        </obout:EditorPopupHolder>
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
               <obout:Editor runat="server" Id="editor" EditPanel-Height="400px" Width="100%" PopupHolderID="popupHolder">
                 <TopToolBar Appearance="Lite" PreservePlace="true" >
                    <AddButtons>
                        <obout:HorizontalSeparator runat="server" />
                        <custom:ClassName runat="server" />
                    </AddButtons>
                 </TopToolBar>
               </obout:Editor>
               <br />
               <asp:Button runat="server" Text="Submit content" ID="submit" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
</html>