<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_ModalPopup.aspx.vb" Inherits="HTMLEditor_vb_ModalPopup" %>
<%@ Register 
    Assembly="AjaxControlToolkit" 
    Namespace="AjaxControlToolkit" 
    TagPrefix="ajaxToolkit" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>

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
           .modalPopup {
                   background-color:#ffffdd;
                   border-width:3px;
                   border-style:solid;
                   border-color:Gray;
                   padding:3px;
                   width:600px;
           }
           .modalBackground 
           {
               background-color:Gray;
               opacity:0.7;
               filter:alpha(opacity=70);
           }
    </style>
</head>
<body style="font:12px Verdana;">
    <script type="text/javascript">
        function windowPreClose() {
            var editorObject = $find("<%= editor.ClientID %>");
            var editPanel = editorObject.get_editPanel();
            editPanel.ensurePopupsClosed();
            return true;
        }
    </script>
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - <b>Editor</b> control with <b>ModalPopupExtender</b></span>
    <br /><br />
    <form id="form1" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <obout:PopupHolder runat="server" id="popupHolder" DefaultAddPolicy="Demand" PopupsZIndex="200000" />
    <asp:LinkButton ID="LinkButton1" runat="server" Text="Show Editor" />
    
    <asp:Panel ID="Panel1" runat="server" Style="display: none" CssClass="modalPopup">
       <asp:UpdatePanel ID="updatePanel1" runat="server">
       <ContentTemplate>
          <obout:Editor runat="server" Id="editor" Height="700px" Width="100%" PopupHolderID="popupHolder">
            <TopToolBar Appearance="Full" />
            <EditPanel  AutoFocus="true" ActiveMode="design" />
            <BottomToolBar ShowDesignButton="true" ShowHtmlTextButton="true" ShowPreviewButton="true" />
          </obout:Editor>
          <br />
          <asp:Button runat="server" Text="Submit content" ID="submit" />
       </ContentTemplate>
       </asp:UpdatePanel>
       <asp:Button ID="CancelButton" runat="server" Text="Cancel" onmousedown="return windowPreClose();" />
    </asp:Panel>
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" 
        TargetControlID="LinkButton1"
        PopupControlID="Panel1" 
        BackgroundCssClass="modalBackground" 
        CancelControlID="CancelButton" 
        DropShadow="true"
        PopupDragHandleControlID="Panel3" />
    </form>
    <br /><br /><a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>