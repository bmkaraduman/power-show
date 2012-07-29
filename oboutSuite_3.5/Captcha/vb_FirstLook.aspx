<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_FirstLook.aspx.vb" Inherits="Captcha_vb_FirstLook" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Captcha" Assembly="Obout.Ajax.UI" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>obout Captcha - first look</title>
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
    <span class="tdText"><b>Obout.Ajax.UI.Captcha</b> - First look.</span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />

        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <table>
                    <tr>
                        <td valign="middle" style="border: 1px solid gray;">
                            <a href="javascript: $find('<%= Captcha1.ClientID %>').getNewImage();">Generate a new image</a><br /><%--<br />--%>
                            <obout:CaptchaImage ID="Captcha1" runat="server" RelativeImageUrl="false" /><br /><%--<br />--%>
                            <obout:OboutTextBox runat="server" ID="CaptchaIn" Width="200" WatermarkText="Type the code from the image" FolderStyle="../interface/styles/black_glass/OboutTextBox" /><br />
                            <obout:CaptchaValidator runat="server" ValidationGroup="SubmitInfo" ControlToValidate="CaptchaIn" CaptchaImageID="Captcha1"
                                ErrorMessage="The code you entered is not valid." Display="Static">
                            </obout:CaptchaValidator>
                            <br /><%--<br />--%>
                            <%--<obout:OboutButton runat="server" Text="Submit the form" Width="150" OnClick="Submit1_click" ValidationGroup="SubmitInfo" FolderStyle="../interface/styles/black_glass/OboutButton"  />--%>
                            <asp:Button runat="server" Text="submit" ValidationGroup="SubmitInfo"  OnClick="Submit1_click" />
                        </td>
                        <td valign="top" style="border: 1px solid gray; background-color: #F0F0F0">
                            <strong>Text Settings:</strong>
                            <div style="padding: 10px">
                                <table style="width: 300px">
                                    <tr>
                                        <td style="width: 150px; text-align: right">Text Length:</td>
                                        <td>
		                                    <obout:OboutDropDownList runat="server" ID="ddl1" Width="70" Height="60"
		                                        FolderStyle="../interface/styles/black_glass/OboutDropDownList"
		                                        OnSelectedIndexChanged="ddl1_SelectedIndexChanged" AutoPostBack="true"
		                                        >
		                                        <Items>
		                                            <asp:ListItem>5</asp:ListItem>
		                                            <asp:ListItem Selected="True">6</asp:ListItem>
		                                            <asp:ListItem>7</asp:ListItem>
		                                        </Items>		    
		                                    </obout:OboutDropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">Font Family:</td>
                                        <td>
		                                    <obout:OboutDropDownList runat="server" ID="ddl2" Width="100" Height="80"
		                                        FolderStyle="../interface/styles/black_glass/OboutDropDownList"
		                                        OnSelectedIndexChanged="ddl2_SelectedIndexChanged" AutoPostBack="true"
		                                        >
		                                        <Items>
		                                            <asp:ListItem Selected="True">Verdana</asp:ListItem>
		                                            <asp:ListItem>Courier New</asp:ListItem>
		                                            <asp:ListItem>Tahoma</asp:ListItem>
		                                            <asp:ListItem>Georgia</asp:ListItem>
		                                        </Items>		    
		                                    </obout:OboutDropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">Foreground Color:</td>
                                        <td>
		                                    <obout:OboutDropDownList runat="server" ID="ddl3" Width="100" Height="60"
		                                        FolderStyle="../interface/styles/black_glass/OboutDropDownList"
		                                        OnSelectedIndexChanged="ddl3_SelectedIndexChanged" AutoPostBack="true"
		                                        >
		                                        <Items>
		                                            <asp:ListItem Selected="True">Dark Gray</asp:ListItem>
		                                            <asp:ListItem>Black</asp:ListItem>
		                                            <asp:ListItem>Blue</asp:ListItem>
		                                        </Items>		    
		                                    </obout:OboutDropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">Background Color:</td>
                                        <td>
		                                    <obout:OboutDropDownList runat="server" ID="ddl4" Width="115" Height="60"
		                                        FolderStyle="../interface/styles/black_glass/OboutDropDownList"
		                                        OnSelectedIndexChanged="ddl4_SelectedIndexChanged" AutoPostBack="true"
		                                        >
		                                        <Items>
		                                            <asp:ListItem Selected="True">White</asp:ListItem>
		                                            <asp:ListItem>Light Gray</asp:ListItem>
		                                            <asp:ListItem>Light Sky Blue</asp:ListItem>
		                                        </Items>		    
		                                    </obout:OboutDropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">Brush Filler Color:</td>
                                        <td>
		                                    <obout:OboutDropDownList runat="server" ID="ddl5" Width="115" Height="60"
		                                        FolderStyle="../interface/styles/black_glass/OboutDropDownList"
		                                        OnSelectedIndexChanged="ddl5_SelectedIndexChanged" AutoPostBack="true"
		                                        >
		                                        <Items>
		                                            <asp:ListItem>White</asp:ListItem>
		                                            <asp:ListItem Selected="True">Light Gray</asp:ListItem>
		                                            <asp:ListItem>Light Sky Blue</asp:ListItem>
		                                        </Items>		    
		                                    </obout:OboutDropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">Text Brush:</td>
                                        <td>
		                                    <obout:OboutDropDownList runat="server" ID="ddl6" Width="100" Height="80"
		                                        FolderStyle="../interface/styles/black_glass/OboutDropDownList"
		                                        OnSelectedIndexChanged="ddl6_SelectedIndexChanged" AutoPostBack="true"
		                                        >
		                                        <Items>
		                                            <asp:ListItem>Solid</asp:ListItem>
		                                            <asp:ListItem Selected="True">Confetti</asp:ListItem>
		                                            <asp:ListItem>Horizontal</asp:ListItem>
		                                            <asp:ListItem>Vertical</asp:ListItem>
		                                        </Items>		    
		                                    </obout:OboutDropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">Background Brush:</td>
                                        <td>
		                                    <obout:OboutDropDownList runat="server" ID="ddl7" Width="100" Height="80"
		                                        FolderStyle="../interface/styles/black_glass/OboutDropDownList"
		                                        OnSelectedIndexChanged="ddl7_SelectedIndexChanged" AutoPostBack="true"
		                                        >
		                                        <Items>
		                                            <asp:ListItem>Solid</asp:ListItem>
		                                            <asp:ListItem Selected="True">Confetti</asp:ListItem>
		                                            <asp:ListItem>Horizontal</asp:ListItem>
		                                            <asp:ListItem>Vertical</asp:ListItem>
		                                        </Items>		    
		                                    </obout:OboutDropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <strong>Image Noise:</strong>
                            <div style="padding: 10px">
                                <table style="width: 300px">
                                    <tr>
                                        <td style="text-align: right">Line Noise Level:</td>
                                        <td>
		                                    <obout:OboutDropDownList runat="server" ID="ddl8" Width="100" Height="80"
		                                        FolderStyle="../interface/styles/black_glass/OboutDropDownList"
		                                        OnSelectedIndexChanged="ddl8_SelectedIndexChanged" AutoPostBack="true"
		                                        >
		                                        <Items>
		                                            <asp:ListItem>None</asp:ListItem>
		                                            <asp:ListItem Selected="True">Low</asp:ListItem>
		                                            <asp:ListItem>Medium</asp:ListItem>
		                                            <asp:ListItem>High</asp:ListItem>
		                                        </Items>		    
		                                    </obout:OboutDropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">Background Noise Level:</td>
                                        <td>
		                                    <obout:OboutDropDownList runat="server" ID="ddl9" Width="100" Height="80"
		                                        FolderStyle="../interface/styles/black_glass/OboutDropDownList"
		                                        OnSelectedIndexChanged="ddl9_SelectedIndexChanged" AutoPostBack="true"
		                                        >
		                                        <Items>
		                                            <asp:ListItem>None</asp:ListItem>
		                                            <asp:ListItem Selected="True">Low</asp:ListItem>
		                                            <asp:ListItem>Medium</asp:ListItem>
		                                            <asp:ListItem>High</asp:ListItem>
		                                        </Items>		    
		                                    </obout:OboutDropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">Font Warp Level:</td>
                                        <td>
		                                    <obout:OboutDropDownList runat="server" ID="ddl10" Width="100" Height="80"
		                                        FolderStyle="../interface/styles/black_glass/OboutDropDownList"
		                                        OnSelectedIndexChanged="ddl10_SelectedIndexChanged" AutoPostBack="true"
		                                        >
		                                        <Items>
		                                            <asp:ListItem>None</asp:ListItem>
		                                            <asp:ListItem>Low</asp:ListItem>
		                                            <asp:ListItem Selected="True">Medium</asp:ListItem>
		                                            <asp:ListItem>High</asp:ListItem>
		                                        </Items>		    
		                                    </obout:OboutDropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <strong>Image Border:</strong>
                            <div style="padding: 10px">
                                <table style="width: 300px">
                                    <tr>
                                        <td style="text-align: right">Width:</td>
                                        <td>
		                                    <obout:OboutDropDownList runat="server" ID="ddl11" Width="100" Height="80"
		                                        FolderStyle="../interface/styles/black_glass/OboutDropDownList"
		                                        OnSelectedIndexChanged="ddl11_SelectedIndexChanged" AutoPostBack="true"
		                                        >
		                                        <Items>
		                                            <asp:ListItem Selected="True">None</asp:ListItem>
		                                            <asp:ListItem>1px</asp:ListItem>
		                                            <asp:ListItem>2px</asp:ListItem>
		                                            <asp:ListItem>3px</asp:ListItem>
		                                        </Items>		    
		                                    </obout:OboutDropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">Color:</td>
                                        <td>
		                                    <obout:OboutDropDownList runat="server" ID="ddl12" Width="100" Height="80"
		                                        FolderStyle="../interface/styles/black_glass/OboutDropDownList"
		                                        OnSelectedIndexChanged="ddl12_SelectedIndexChanged" AutoPostBack="true"
		                                        >
		                                        <Items>
		                                            <asp:ListItem Selected="True">None</asp:ListItem>
		                                            <asp:ListItem>Dark Gray</asp:ListItem>
		                                            <asp:ListItem>Black</asp:ListItem>
		                                            <asp:ListItem>Blue</asp:ListItem>
		                                        </Items>		    
		                                    </obout:OboutDropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>
