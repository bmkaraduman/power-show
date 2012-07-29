<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_DatabaseImageGallery.aspx.vb" Inherits="HTMLEditor_vb_DatabaseImageGallery" %>
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
    </style>
</head>
<body style="font:12px Verdana;">
<script type="text/JavaScript">
</script>
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - <b>Image Gallery</b> in database</span>
    <br /><br />
    In this example you can see customized <b>"Browse Image Gallery"</b> popup.
    It allows to work with images from database.
    <br />
    To open this popup, click "Browse" button in the "Image properties" popup (insert or edit an Image
    <img style="background-color: blue;margin:0px;" align="absmiddle" alt=""
        src="<%= Page.ClientScript.GetWebResourceUrl(GetType(Obout.Ajax.UI.HTMLEditor.ToolbarButton.CommonButton),"Obout.Ajax.UI.HTMLEditor.Images.ed_image_n.gif") %>" />
    ):
    <br /><br />
    <img alt="" align="absMiddle" src="SiteImages/DatabaseImageGallery.gif" />
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
               <obout:Editor runat="server" Id="editor" Height="400px" Width="100%">
                 <EditPanel AutoFocus="true" ActiveMode="design" IndentInDesignMode="20" />
                 <BottomToolBar ShowDesignButton="true" ShowHtmlTextButton="true" ShowPreviewButton="true" >
                 </BottomToolBar>
               </obout:Editor>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>