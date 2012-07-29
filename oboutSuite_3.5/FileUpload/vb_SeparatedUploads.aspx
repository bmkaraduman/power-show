<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_SeparatedUploads.aspx.vb" Inherits="FileUpload_vb_SeparatedUploads" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.FileUpload"
    TagPrefix="obout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>FileUpload example</title>
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
<body>
    <script type="text/JavaScript">
        function onClientBeforeUpload(sender, args) {
            $get("<%= label.ClientID %>").innerHTML = "";
            $get("<%= submit1.ClientID %>").disabled = true;
            $get("<%= submit2.ClientID %>").disabled = true;
            return true;
        }
        function pageLoad(sender, args) {
            $get("<%= submit1.ClientID %>").disabled = false;
            $get("<%= submit2.ClientID %>").disabled = false;
        } 
    </script>
    <span class="tdText"><b>Obout.Ajax.UI.FileUpload</b> - Separated uploads</span>
    <br /><br />
    <a href="Default.aspx?type=CSHARP">< Back to examples</a>
    <br /><br />
    <form id="form1" runat="server" enctype="multipart/form-data" method="post">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <center>
            Here you can upload up to 10 MB of images for each category of photos.
            <br /><br />
            <table cellpadding="5" cellspacing="5" border="0"><tr>
            <td style="border: 1px solid blue"><asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional"><ContentTemplate>
                My photos
                <obout:FileUpload OnClientBeforeUpload="onClientBeforeUpload"
                    ValidFileExtensions="jpeg;jpg;gif;tiff;png" MaximumTotalFileSize="10240"
                    Width="250px" runat="server" id="fileUpload1" BrowseFieldDescription="Images"
                />
                <asp:Button runat="server" ID="submit1" Text="Upload images" OnClick="submit1_click" />
            </ContentTemplate></asp:UpdatePanel></td>
            <td style="border: 1px solid blue"><asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional"><ContentTemplate>
                Photos of my children
                <obout:FileUpload OnClientBeforeUpload="onClientBeforeUpload"
                    ValidFileExtensions="jpeg;jpg;gif;tiff;png" MaximumTotalFileSize="10240"
                    Width="250px" runat="server" id="fileUpload2" BrowseFieldDescription="Images"
                />
                <asp:Button runat="server" ID="submit2" Text="Upload images" OnClick="submit2_click" />
            </ContentTemplate></asp:UpdatePanel></td></tr>
            </table>
            <asp:UpdatePanel runat="server" ID="UpdatePanel3"><ContentTemplate>
                <asp:Label runat="server" ID="label" Text="" />
            </ContentTemplate></asp:UpdatePanel>
        </center>
    </form>
</body>
</html>
