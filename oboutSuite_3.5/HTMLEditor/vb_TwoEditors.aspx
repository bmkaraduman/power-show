<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_TwoEditors.aspx.vb" Inherits="HTMLEditor_vb_TwoEditors" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor.Popups"
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
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - Two <b>Editor</b> controls with <b>RequiredFieldValidator</b></span>
    <br /><br />
    <form id="form1" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <obout:PopupHolder runat="server" id="popupHolder" DefaultAddPolicy="Demand" >
       <demand>
           <obout:SpellCheckPopup CustomDictionaryOnServer="true" runat="server">
               <Dictionaries>
                 <obout:SpellCheckDictionary FileName="en-US.dic" DisplayName="English(US)" />
                 <obout:SpellCheckDictionary FileName="en-GB.dic" DisplayName="English(GB)" />
               </Dictionaries>
           </obout:SpellCheckPopup>
       </demand>
    </obout:PopupHolder>
    <asp:UpdatePanel ID="updatePanel1" runat="server">
    <ContentTemplate>
       <obout:Editor runat="server" Id="editor1" Height="200px" Width="100%" PopupHolderID="popupHolder">
         <TopToolBar Appearance="Lite" />
         <EditPanel  AutoFocus="true" ActiveMode="design" />
         <BottomToolBar ShowDesignButton="true" ShowHtmlTextButton="true" ShowPreviewButton="true" />
       </obout:Editor>
       <asp:RequiredFieldValidator ID="rfvEditor1" runat="server" ControlToValidate="editor1" InitialValue="" ErrorMessage="Empty" >*</asp:RequiredFieldValidator>
       <obout:Editor runat="server" Id="editor2" Height="200px" Width="100%" PopupHolderID="popupHolder">
         <TopToolBar Appearance="Lite" />
         <EditPanel  AutoFocus="true" ActiveMode="design" />
         <BottomToolBar ShowDesignButton="true" ShowHtmlTextButton="true" ShowPreviewButton="true" />
       </obout:Editor>
       <asp:RequiredFieldValidator ID="rfvEditor2" runat="server" ControlToValidate="editor2" InitialValue="" ErrorMessage="Empty" >*</asp:RequiredFieldValidator>
       <br />
       <asp:Button runat="server" Text="Submit content" ID="submit" />
    </ContentTemplate>
    </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>