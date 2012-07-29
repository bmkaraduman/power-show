<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_Tabs.aspx.cs" Inherits="HTMLEditor_cs_Tabs" %>
<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton"
    TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server" >
    <title>HTMLEditor Sample</title>
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
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - <b>Editor</b> controls in <b>TabContainer</b></span>
    <br /><br />
    <b>HTMLEditor</b> controls inside <b>Tabs</b> control.<br />
    <br />
    <form id="Form1" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <obout:PopupHolder runat="server" id="popupHolder" DefaultAddPolicy="Demand" />
        <script type="text/javascript">
        </script>
        <ajaxToolkit:TabContainer runat="server" ID="Tabs" Height="400px" ActiveTabIndex="0" Width="402px">
            <ajaxToolkit:TabPanel runat="server" ID="Panel1" HeaderText="HTMLEditor 1">
                <ContentTemplate>
                    <asp:UpdatePanel UpdateMode="Conditional" ID="updatePanel1" runat="server">
                        <ContentTemplate>
                           <obout:Editor runat="server" id="editor1" Height="350px" PopupHolderID="popupHolder" >
                              <TopToolbar Appearance="lite" >
                                 <AddButtons>
                                     <obout:InsertLink runat="server" />
                                 </AddButtons>
                              </TopToolbar>
                           </obout:Editor>
                           <br />
                           <asp:Button ID="Button1" runat="server" Text="Submit content" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            
            <ajaxToolkit:TabPanel runat="server" ID="Panel2" HeaderText="HTMLEditor 2" >
                <ContentTemplate>
                    <asp:UpdatePanel UpdateMode="Conditional" ID="updatePanel2" runat="server">
                        <ContentTemplate>
                           <obout:Editor runat="server" id="editor2" Height="350px" PopupHolderID="popupHolder" >
                              <EditPanel ActiveMode="html" />
                           </obout:Editor>
                           <br />
                           <asp:Button ID="Button2" runat="server" Text="Submit content" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
</html>
