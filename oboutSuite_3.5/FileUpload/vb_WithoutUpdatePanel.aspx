<%@ Page Language="VB" AutoEventWireup="false" CodeFile="vb_WithoutUpdatePanel.aspx.vb" Inherits="FileUpload_vb_WithoutUpdatePanel" %>
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
            return true;
        } 
    </script>
    <span class="tdText"><b>Obout.Ajax.UI.FileUpload</b> - Synchronous postback</span>
    <br /><br />
    <a href="Default.aspx?type=VBNET">< Back to examples</a>
    <br /><br />
    <form id="form1" runat="server" enctype="multipart/form-data" method="post">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <center>
            Here you can upload up to 10 MB of files with any extension, maximum size of a file - 1 MB.<br />
            Synchronous postback is used (no <b>UpdatePanel</b>).
            <br /><br />
            <obout:FileUpload OnClientBeforeUpload="onClientBeforeUpload"
                MaximumTotalFileSize="10240"
                Width="250px" runat="server" id="fileUpload1" BrowseFieldDescription="Images"
            />
            <br /><asp:Button runat="server" ID="submit" Text="Upload files" /><br /><br />
            <asp:Label runat="server" ID="label" Text="" />
        </center>
    </form>
</body>
</html>
