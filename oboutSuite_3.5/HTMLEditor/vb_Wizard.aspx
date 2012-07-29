<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_Wizard.aspx.vb" Inherits="HTMLEditor_vb_Wizard" %>
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
            var src = '<%=Page.ClientScript.GetWebResourceUrl(GetType(Obout.Ajax.UI.HTMLEditor.Editor), "Obout.Ajax.UI.HTMLEditor.Images.ed_wait.gif")%>';
            popup.innerHTML = "<img src='" + src + "'>";

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
        #<%= previewContent.ClientID %> p { padding: 0px;}
        #<%= previewContent.ClientID %> { font-family: verdana,sans-serif;font-size: 10pt; }
        #<%= previewContent.ClientID %> p, #<%= previewContent.ClientID %> td { font-family: verdana,sans-serif;font-size: 10pt; }
    </style>
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - <b>Editor</b> control in <b>Wizard</b></span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <obout:EditorPopupHolder runat="server" ID="popupHolder" />

        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <asp:Wizard 
                    ID="Wizard1" 
                    runat="server" 
                    ActiveStepIndex="0"
                    Width="100%"
                    OnActiveStepChanged="OnActiveStepChanged"
                    OnFinishButtonClick="OnFinishButtonClick"
                    DisplaySideBar="False" >
                    <HeaderTemplate>
                        <% If Wizard1.ActiveStep.ID = edit_step.ID Then%>
                            <div style="float:right">
                                    <asp:ImageButton OnClientClick="return navigationClicked();" ID="StartNextButton" runat="server" Text="Next" CommandName="MoveNext" ImageUrl="SiteImages/Forward-48-n-ps.gif" />
                            </div>
                        <% ElseIf Wizard1.ActiveStep.ID = preview_step.ID Then%>
                            <div style="float:right">
                                    <asp:ImageButton OnClientClick="return navigationClicked();" ID="StepPreviousButton" runat="server" Text="Previous" CommandName="MovePrevious" ImageUrl="SiteImages/Back-48-n-ps.gif" />
                                    <asp:ImageButton OnClientClick="return navigationClicked();" ID="StepNextButton" runat="server" Text="Next" CommandName="MoveNext" ImageUrl="SiteImages/Forward-48-n-ps.gif" />
                            </div>
                        <% ElseIf Wizard1.ActiveStep.ID = description_step.ID Then%>
                            <div style="float:right">
                                    <asp:ImageButton OnClientClick="return navigationClicked();" ID="FinishPreviousButton" runat="server" Text="Previous" CommandName="MovePrevious" ImageUrl="SiteImages/Back-48-n-ps.gif" />
                                    <asp:ImageButton OnClientClick="return navigationClicked();" ID="FinishButton" runat="server" Text="Finish" CommandName="MoveComplete" ImageUrl="SiteImages/Last-48-n-ps.gif" />
                            </div>
                        <% End If%>
                    </HeaderTemplate> 
                    <StartNavigationTemplate />
                    <StepNavigationTemplate />
                    <FinishNavigationTemplate />
                    <WizardSteps>
                        <asp:WizardStep ID="edit_step" runat="server" Title="Edit content">        
                            <center><h3>Edit content</h3></center>
                            <br />
                            <obout:Editor runat="server" Id="editor" EditPanel-Height="350px" Width="100%" PopupHolderID="popupHolder" >
                                <BottomToolbar ShowPreviewButton="false" ShowDesignButton="false" ShowHtmlTextButton="false" />
                            </obout:Editor>
                        </asp:WizardStep>
                        <asp:WizardStep ID="preview_step" runat="server" Title="Preview content">
                            <center><h3>Content</h3></center>
                            <br />
                            <hr style="width:100%" />
                            <asp:Label runat="server" ID="previewContent" Text="" />
                            <hr style="width:100%" />
                        </asp:WizardStep>
                        <asp:WizardStep ID="description_step" runat="server" Title="Content description">
                            <center><h3>Content description</h3></center>
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
                            <br />
                            <center>
                                <asp:Label id="Label1" runat="Server" visible="False" style="color:blue; font-weight: bold; font-size:14pt;" />
                            </center>
                        </asp:WizardStep>
                    </WizardSteps>
                </asp:Wizard>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>