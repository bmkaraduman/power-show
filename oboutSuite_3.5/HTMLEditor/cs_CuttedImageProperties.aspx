<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_CuttedImageProperties.aspx.cs" Inherits="HTMLEditor_cs_CuttedImageProperties" %>
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
    function enDisClicked() {
        $find("<%= editor.ClientID %>").get_editPanel().setCancelOnPostback();
        return true;
    } 
</script>
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - Customized <b>'Image properties'</b> popup</span>
    <br /><br />
    In this example you can see customized "Image properties" popup.
    It does not contain the <b>"ID"</b> and <b>"Css class"</b> fields, <b>"Layout"</b> and <b>"Spacing"</b> fieldsets:
    <br /><br />
    <img alt="" align="absMiddle" src="SiteImages/CuttedImageProperties.gif" />
    <br /><br />
    Try to insert/edit images
    <img style="background-color: blue;margin:0px;" align="absmiddle" alt=""
        src="<%= Page.ClientScript.GetWebResourceUrl(typeof(Obout.Ajax.UI.HTMLEditor.ToolbarButton.CommonButton),
            "Obout.Ajax.UI.HTMLEditor.Images.ed_image_n.gif") %>" />
    . Also you can edit the image properties with the context menu.
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
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
</html>