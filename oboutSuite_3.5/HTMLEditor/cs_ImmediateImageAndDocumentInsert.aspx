<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_ImmediateImageAndDocumentInsert.aspx.cs" Inherits="HTMLEditor_cs_ImmediateImageAndDocumentInsert" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor.ContextMenu"
    TagPrefix="obout" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    TagPrefix="obout"
    Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" %>
<%@ Register
    TagPrefix="custom"
    Namespace="CustomToolbarButton" %>

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
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - Images and documents uploading with immediate inserting</span>
    <br /><br />
    Custom buttons
    <img alt="" src="../App_Obout/HTMLEditor/customButtons/ed_upload_image_n.gif" align="absmiddle" style="background-color:Blue;" />
    and
    <img alt="" src="../App_Obout/HTMLEditor/customButtons/ed_upload_document_n.gif" align="absmiddle" style="background-color:Blue;" />
    <br />
    See files <span style="color: #00018b">"/App_Code/HTMLEditor/CustomButtonsAndPopups.cs"</span>
    and <span style="color: #00018b">"/App_Obout/HTMLEditor/Scripts/ImmediateFileInsert.js"</span>.
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <obout:EditorPopupHolder runat="server" id="popupHolder" />
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
               <obout:Editor runat="server" Id="editor" Height="500px" Width="100%" PopupHolderID="popupHolder">
                 <TopToolBar Appearance="Lite" >
                    <AddButtons>
                        <obout:HorizontalSeparator runat="server" />
                        <custom:ImmediateImageInsert runat="server" />
                        <custom:ImmediateDocumentInsert runat="server" />
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