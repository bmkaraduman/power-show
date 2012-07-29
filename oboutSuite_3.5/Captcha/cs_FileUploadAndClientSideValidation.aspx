<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_FileUploadAndClientSideValidation.aspx.cs" Inherits="Captcha_cs_FileUploadAndClientSideValidation" %>
<%@ Register Src="UserControls/MyCaptcha.ascx" TagName="Captcha" TagPrefix="site" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.FileUpload" Assembly="Obout.Ajax.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>obout Captcha - With FileUpload control and client-side validation</title>
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
<script type="text/javascript">
    function ClientValidate(source, arguments) {
        // one and only one file should be selected
        var fileupload = $find("<%= fileUpload1.ClientID %>")
        if (fileupload._files == null || fileupload._files.length == 0 || fileupload._files.length > 1) {
            arguments.IsValid = false;
        } else {
            arguments.IsValid = true;
        }
    }
    function filesPicked(sender, args) {
        // one and only one file should be selected
        setTimeout(function () { // trick against the IE9 behavior
            // set the validator's display style
            $get("<%= CustomValidator1.ClientID %>").style.display = (args.get_files().length == 1) ? "none" : "inline";
        }, 0);
        args.set_cancel(args.get_files().length != 1);
    }
    function BeforeSubmit(source, arguments) {
        $get("<%= placeHolder.ClientID %>").innerHTML = "";
        $get("<%= imageheight.ClientID %>").value = $get("registrationBody").clientHeight;
    }
</script>
    <span class="tdText"><b>Obout.Ajax.UI.Captcha</b> - With <b>FileUpload</b> control and client-side validation</span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />

        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <table style="border: 0px none;">
                    <tr>
                        <td valign="top" align="left" id="registrationBody">
                            <b>Registration Form</b><br /><br />
                            <obout:OboutTextBox runat="server" ID="FirstName" WatermarkText="First name" Width="223"
                                FolderStyle="../interface/styles/black_glass/OboutTextBox" /> *
                            <asp:RequiredFieldValidator ID="FirstValidator" runat="server" ControlToValidate="FirstName"
                                EnableClientScript="true" ValidationGroup="SubmitInfo" InitialValue="First name"
                                ErrorMessage="Please fill in first name!" Display="Dynamic" /><br />
                            <obout:OboutTextBox runat="server" ID="LastName" WatermarkText="Last name" Width="223" /> *
                            <asp:RequiredFieldValidator ID="LastValidator" runat="server" ControlToValidate="LastName"
                                EnableClientScript="true" ValidationGroup="SubmitInfo" InitialValue="Last name"
                                ErrorMessage="Please fill in last name!" Display="Dynamic" /><br />
                            <span style="font-family: arial">Your picture (you should select one image):</span><br />
                            <div style="display: inline-block"><obout:FileUpload OnClientFilesPicked="filesPicked"
                                ValidFileExtensions="jpeg;jpg;gif;tiff;png" MaximumTotalFileSize="10240"
                                Width="217px" runat="server" id="fileUpload1" BrowseFieldDescription="Images"
                            /></div> *
                            <asp:CustomValidator id="CustomValidator1" EnableClientScript="true"
                                   ValidationGroup="SubmitInfo"
                                   ClientValidationFunction="ClientValidate"
                                   Display="Dynamic"
                                   ErrorMessage="Select one image!"
                                   runat="server"/><br /><br />
                            <site:Captcha runat="server" ID="Captcha1" ValidationGroup="SubmitInfo" EnableClientScript="true" /><br />
                            <asp:CustomValidator id="CustomValidator2" EnableClientScript="true"
                                   ValidationGroup="SubmitInfo"
                                   ClientValidationFunction="BeforeSubmit"
                                   runat="server"/>
                            <asp:HiddenField ID="imageheight" runat="server" />
                            <asp:Button ID="submit" runat="server" Text="Submit the form" ValidationGroup="SubmitInfo" />
                        </td>
                        <td valign="top" align="center">
                            <div runat="server" id="placeHolder">
                                <asp:PlaceHolder runat="server" ID="result" />
                            </div>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
</html>
