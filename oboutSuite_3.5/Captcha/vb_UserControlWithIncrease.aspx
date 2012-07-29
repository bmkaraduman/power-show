<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_UserControlWithIncrease.aspx.vb" Inherits="Captcha_vb_UserControlWithIncrease" %>
<%@ Register Src="UserControls/MyCaptchaWithIncrease.ascx" TagName="Captcha" TagPrefix="site" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>obout Captcha - in UserControl with increase feature</title>
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
    // on page load - called by ScriptManager
    function pageLoad() {
        // handler for request invoking
        function invokingRequest(sender, args) {
            // remove the request invoking handler
            // (it will be added again on the next pageLoad() call after partial postback)
            Sys.Net.WebRequestManager.remove_invokingRequest(invokingRequest);
            // activate the Captcha's progress
            $find("<%= Captcha1.CaptchaImage.ClientID %>").beginProgress();
        }
        // add the request invoking handler
        Sys.Net.WebRequestManager.add_invokingRequest(invokingRequest);
    }
</script>
    <span class="tdText"><b>Obout.Ajax.UI.Captcha</b> - In UserControl with increase feature</</span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />

        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <br />
                <site:Captcha runat="server" ID="Captcha1" ValidationGroup="SubmitInfo" /><br />
                <asp:Button runat="server" Text="Submit the form" ValidationGroup="SubmitInfo" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>
