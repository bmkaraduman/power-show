<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_oboutFlyout.aspx.cs" Inherits="HTMLEditor_cs_oboutFlyout" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>

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
<script type="text/javascript">
    function pageLoad() {
        function invokingRequest() {
            Sys.Net.WebRequestManager.remove_invokingRequest(invokingRequest);
            if (!Obout.Ajax.UI.HTMLEditor.AjaxPopupLoadingInProgress) {
                document.getElementById("<%=Submit.ClientID%>").style.display = "none";
                document.getElementById("wait").style.visibility = "visible";
            }
        }
        Sys.Net.WebRequestManager.add_invokingRequest(invokingRequest);
        document.getElementById("wait").style.visibility = "hidden";
    }
    var openedPopups = 0;
    function popupStateChanged(sender, args) {
        var flyout = eval("<%=Flyout1.getClientID()%>");
        switch (args.get_state()) {
            case Obout.Ajax.UI.HTMLEditor.PopupStateType.LoadStart:
                // prevent to close Flyout while any Editor's popup is loading
                flyout.setCloseEvent("NONE");
                break;
            case Obout.Ajax.UI.HTMLEditor.PopupStateType.PreOpen:
                // prevent to close Flyout while any Editor's popup is opened
                flyout.setCloseEvent("NONE");
                openedPopups++;
                break;
            case Obout.Ajax.UI.HTMLEditor.PopupStateType.Close:
                openedPopups--;
                if (openedPopups == 0) {
                    // permit to close Flyout
                    flyout.setCloseEvent("ONMOUSEOUT");
                }
                break;
        }
    }
</script>
<body style="font:12px Verdana;" scroll="no">
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - <b>Editor</b> inside the <b>Flyout</b> control</span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <center>
                    <img id="ad1" src="SiteImages/Edit-48-n-ps.gif" title="Edit" alt="" />
                </center>
                <obout:Flyout runat="server" ID="Flyout1"  AttachTo="ad1" >
                    <div style="border: solid 1px black; padding:3px; background-color: White;">
                       <obout:EditorPopupHolder runat="server" id="popupHolder"
                                               OnClientPopupStateChanged="popupStateChanged" />
                       <obout:Editor runat="server" Id="editor" Height="420px" Width="100%" PopupHolderID="popupHolder" EditPanel-ContextMenu-KeepPaternity="true" />
                       <asp:LinkButton runat="server" Text="Save content" ID="Submit" />
                       <img id="wait" align="absMiddle" style="visibility:hidden; height:30px;" src="<%=Page.ClientScript.GetWebResourceUrl(typeof(Obout.Ajax.UI.HTMLEditor.Editor), "Obout.Ajax.UI.HTMLEditor.Images.ed_wait.gif")%>" />
                    </div>
                </obout:Flyout>                 
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
</html>