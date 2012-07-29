<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_ValidationSummary.aspx.vb" Inherits="Captcha_vb_ValidationSummary" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Captcha" Assembly="Obout.Ajax.UI" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>obout Captcha - with ValidationSummary</title>
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
            $find("<%= Captcha1.ClientID %>").beginProgress();
        }
        // add the request invoking handler
        Sys.Net.WebRequestManager.add_invokingRequest(invokingRequest);
    }
</script>
    <span class="tdText"><b>Obout.Ajax.UI.Captcha</b> - With ValidationSummary</span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />

        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <fieldset style="width: 450px; height: 100px; margin-bottom: 10px;">
                        <legend>Validation Summary</legend>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="SubmitInfo" EnableClientScript="False" />
                    </fieldset>
                </div>
                <br />
                <b>Registration Form</b><br /><br />
                <table>
                    <tr>
                        <td>
                            <obout:OboutTextBox runat="server" ID="FirstName" WatermarkText="First name" Width="200" FolderStyle="../interface/styles/black_glass/OboutTextBox" /> *
                        </td>
                        <td style="width: 300px;">
                            <asp:RequiredFieldValidator ID="FirstValidator" runat="server" ControlToValidate="FirstName" InitialValue="First name"
                            EnableClientScript="false" ValidationGroup="SubmitInfo" ErrorMessage="Please fill in first name!"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <obout:OboutTextBox runat="server" ID="LastName" WatermarkText="Last name" Width="200" /> *
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="LastValidator" runat="server" ControlToValidate="LastName" InitialValue="Last name"
                            EnableClientScript="false" ValidationGroup="SubmitInfo" ErrorMessage="Please fill in last name!"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <obout:CaptchaImage ID="Captcha1" runat="server" >
                            </obout:CaptchaImage>
                        </td>
                        <td>
                            <a href="javascript: $find('<%= Captcha1.ClientID %>').getNewImage();">Generate a new image</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <obout:OboutTextBox runat="server" ID="CaptchaIn" Width="200" WatermarkText="Type the code from the image" /> *
                        </td>
                        <td>
                            <obout:CaptchaValidator runat="server" ValidationGroup="SubmitInfo" ControlToValidate="CaptchaIn" CaptchaImageID="Captcha1"
                                ErrorMessage="The code you entered is not valid." Display="Dynamic">
                            </obout:CaptchaValidator>
                        </td>
                    </tr>
                </table>
                <br />
                <%--<obout:OboutButton runat="server" Text="Submit the form" Width="150" OnClick="Submit1_click" ValidationGroup="SubmitInfo" FolderStyle="../interface/styles/black_glass/OboutButton"  />--%>
                <asp:Button runat="server" Text="Submit the form" ValidationGroup="SubmitInfo"  OnClick="Submit1_click" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>
