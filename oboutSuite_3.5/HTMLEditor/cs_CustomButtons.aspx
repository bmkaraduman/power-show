<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_CustomButtons.aspx.cs" Inherits="HTMLEditor_cs_CustomButtons" %>
<%@ Register Assembly="Obout.Ajax.UI" TagPrefix="obout" Namespace="Obout.Ajax.UI.HTMLEditor" %>
<%@ Register Assembly="Obout.Ajax.UI" TagPrefix="obout" Namespace="Obout.Ajax.UI.HTMLEditor.ContextMenu" %>
<%@ Register Assembly="Obout.Ajax.UI" TagPrefix="obout" Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" %>
<%@ Register Assembly="Obout.Ajax.UI" TagPrefix="obout" Namespace="Obout.Ajax.UI.HTMLEditor.Popups" %>
<%@ Register TagPrefix="custom" Namespace="CustomToolbarButton" %>

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
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - Custom button defined in <b>App_Code</b></span>
    <br /><br />
    Custom button <img alt="" src="../App_Obout/HTMLEditor/customButtons/ed_date_n.gif" align="absmiddle" style="background-color:Blue;" />
    - insert the current date.<br />
    See files <span style="color: #00018b">"/App_Code/HTMLEditor/CustomButtonsAndPopups.cs"</span>
    and <span style="color: #00018b">"/App_Obout/HTMLEditor/Scripts/InsertDate.js"</span>.
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <obout:PopupHolder runat="server" id="popupHolder" DefaultAddPolicy="Demand" >
            <preload>
                <obout:ColorPickerPopup runat="server">
                </obout:ColorPickerPopup>
                <obout:Icons runat="server" RelativeUrl="false">
                </obout:Icons>
                <obout:LinkProperties runat="server">
                </obout:LinkProperties>
                <obout:SpecialCharacters runat="server">
                </obout:SpecialCharacters>
            </preload>
            <demand>
                <obout:ImageBrowser runat="server" RelativeUrl="false">
                </obout:ImageBrowser>
            </demand>
        </obout:PopupHolder>
        <obout:DefaultContextMenu Width="200px" runat="server" ID="contextMenu" PopupHolderID="popupHolder" >
        </obout:DefaultContextMenu>
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
               <obout:Editor runat="server" Id="editor" Height="500px" Width="100%" PopupHolderID="popupHolder">
                 <TopToolBar Appearance="Full" >
                    <AddButtons>
                        <obout:HorizontalSeparator runat="server" />
                        <custom:InsertDate runat="server" />
                    </AddButtons>
                 </TopToolBar>
                 <EditPanel ContextMenuID="contextMenu" />
               </obout:Editor>
               <br />
               <asp:Button runat="server" Text="Submit content" ID="submit" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
</html>