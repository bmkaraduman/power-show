<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_MultiView.aspx.cs" Inherits="HTMLEditor_cs_MultiView" %>
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
    <script type="text/javascript">
        var requestPopup = null;

        function beginRequest() {
            var containerBody = $get("<%= updatePanel1.ClientID   %>");
            var coord = Obout.Ajax.UI.Library.getPosition(containerBody);
            var popup;

            popup = Obout.Ajax.UI.Library.getOwnerDocument(containerBody).createElement("div");
            popup.style.zIndex = "20000";
            popup.style.position = "absolute";
            var src = '<%=Page.ClientScript.GetWebResourceUrl(typeof(Obout.Ajax.UI.HTMLEditor.Editor), "Obout.Ajax.UI.HTMLEditor.Images.ed_wait.gif")%>';
            popup.innerHTML = "<img src='"+src+"'>";

            var parent = document.body;
            parent.appendChild(popup);

            popup.style.display = "none";

            var theVisibleWidth = parseInt(containerBody.offsetWidth);
            var theVisibleHeight = parseInt(containerBody.offsetHeight);
            var y = theVisibleHeight / 2 - 32 + coord.y;
            var x = theVisibleWidth / 2 - 32 + coord.x;

            popup.style.top = y + "px";
            popup.style.left = x + "px";

            popup.style.display = "";

            requestPopup = popup;
        }

        function endRequest() {
            if (requestPopup) requestPopup.parentNode.removeChild(requestPopup);
            requestPopup = null;

            Sys.WebForms.PageRequestManager.getInstance().remove_beginRequest(beginRequest);
            Sys.WebForms.PageRequestManager.getInstance().remove_endRequest(endRequest);
        }

        function navigationClicked() {
            Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginRequest);
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequest);
            return true;
        }
    
    </script>
    <style type="text/css">
        #<%= editor_content.ClientID %> p { padding: 0px;}
        #<%= editor_content.ClientID %> { font-family: verdana,sans-serif;font-size: 10pt; }
        #<%= editor_content.ClientID %> p, #<%= editor_content.ClientID %> td { font-family: verdana,sans-serif;font-size: 10pt; }
    </style>
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - <b>Editor</b> control in <b>MultiView</b></span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <obout:PopupHolder runat="server" ID="popupHolder" DefaultAddPolicy="Demand" />

        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <asp:MultiView ID="MultiView1" runat="server" >
                    <asp:View ID="Tab1" runat="server"  >
                        <table width="100%" height="500" cellpadding=0 cellspacing=0>
                            <tr valign="top">
                                <td style="width: 100%">
                                    <center><h3>Edit content</h3></center>
                                    <br />
                                    <asp:LinkButton OnClientClick="return navigationClicked();" ID="preview_button" Text="Preview content" runat="server" onClick="previewClick" />
                                    <br />
                                    <br />
                                    <obout:Editor runat="server" PopupHolderID="popupHolder" Id="editor" EditPanel-Height="350px" Width="100%" BottomToolbar-ShowPreviewButton="false" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="Tab2" runat="server">
                        <table width="100%" height="500px" cellpadding=0 cellspacing=0>
                            <tr valign="top">
                                <td style="width: 100%">
                                    <center><h3>Content</h3></center>
                                    <br />
                                    <asp:LinkButton OnClientClick="return navigationClicked();" ID="back_to_edit_button" Text="Back to edit" runat="server" onClick="backToEditClick" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:LinkButton OnClientClick="return navigationClicked();" ID="finish_button" Text="Finish" runat="server" onClick="finishClick" />
                                    <br />
                                    <br />
                                    <hr style="width:100%" />
                                    <asp:Label runat="server" ID="editor_content" Text="" />
                                    <hr style="width:100%" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="Tab3" runat="server">
                        <table width="100%" height="500px" cellpadding=0 cellspacing=0>
                            <tr valign="top">
                                <td style="width: 100%">
                                    <center><h3>Content description</h3></center>
                                    <br />
                                    <asp:LinkButton OnClientClick="return navigationClicked();" ID="back_to_preview_button" Text="Back to preview" runat="server" onClick="backToPreviewClick" />
                                    <br />
                                    <br />
                                    <hr style="width:100%" />
                                    <table cellpadding=0 cellspacing=4 border=0>
                                        <tr>
                                        <td align="left">Total HTML length:</td>
                                        <td align="right"><asp:Label runat="server" style="color:blue;" ID="htmlLength" Text="" /> </td>
                                        </tr>
                                        <tr>
                                        <td align="left">Plain Text length:</td>
                                        <td align="right"><asp:Label runat="server" style="color:blue;" ID="plainLength" Text="" /> </td>
                                        </tr>
                                    </table>
                                    <hr style="width:100%" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </ContentTemplate>
            <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="preview_button" />
                    <asp:AsyncPostBackTrigger ControlID="back_to_edit_button" />
                    <asp:AsyncPostBackTrigger ControlID="finish_button" />
                    <asp:AsyncPostBackTrigger ControlID="back_to_preview_button" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
</html>