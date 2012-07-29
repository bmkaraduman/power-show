<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_importMsWord.aspx.cs" Inherits="HTMLEditor_cs_importMsWord" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>

<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" tagprefix="obout" %>
<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.HTMLEditor.Popups" tagprefix="obout" %>

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
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - <b>MS Word</b> document importing.</span>
    <br /><br />
    You can upload <b>MS Word</b> documents and import their contents into the editing panel.
    <br />
    Just use the button
    <img style="background-color: blue;margin:0px;" align="absmiddle" alt=""
        src="<%= Page.ClientScript.GetWebResourceUrl(typeof(Obout.Ajax.UI.HTMLEditor.ToolbarButton.CommonButton),
        "Obout.Ajax.UI.HTMLEditor.Images.ed_importDocument_n.gif") %>" />
    .
    <span style="color: #3366ff">Be sure that <b>MS Word 2010</b> is installed on this computer.
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <obout:PopupHolder runat="server" ID="popupHolder" DefaultAddPolicy="Demand" >
            <Demand>
                <obout:ImportDocumentPopup runat="server" DocumentReaders="+doc:docx:MsWordDocumentReader" />
            </Demand>
        </obout:PopupHolder>
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <obout:Editor runat="server" Id="editor" Height="500px" Width="100%">
                    <TopToolbar Appearance="Custom">
                        <AddButtons>
                            <obout:Undo runat="server" />
                            <obout:Redo runat="server" />
                            <obout:HorizontalSeparator runat="server" />
                            <obout:RemoveAlignment runat="server" />
                            <obout:HorizontalSeparator runat="server" />
                            <obout:ImportDocument runat="server" />
                        </AddButtons>
                    </TopToolbar>
                </obout:Editor>
                <br />
                <asp:Button runat="server" Text="Submit content" ID="Submit" OnClick="Submit_click" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
</html>