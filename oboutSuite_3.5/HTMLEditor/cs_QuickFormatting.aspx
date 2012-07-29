<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_QuickFormatting.aspx.cs" Inherits="HTMLEditor_cs_QuickFormatting" %>
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
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - <b>Editor</b> control with <b>'Quick Formatting'</b> panel</span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
               <obout:Editor runat="server" ShowQuickFormatting="true" QuickFormatting-Width="110px" Id="editor" Height="500px" Width="100%">
               </obout:Editor>
               <br />
               <asp:Button runat="server" Text="Disable editor" ID="Editable"
                           OnClientClick="return enDisClicked();" OnClick="Editable_click" />
               &nbsp
               <asp:Button runat="server" Text="Submit content" ID="Submit" OnClick="Submit_click" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
</html>