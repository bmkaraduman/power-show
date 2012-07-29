<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_OboutForum.aspx.vb" Inherits="HTMLEditor_vb_OboutForum" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.Popups" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.ContextMenu" TagPrefix="obout" %>
<%@ Register TagPrefix="custom" Namespace="CustomToolbarButton" %>
<%@ Register TagPrefix="custom" Namespace="CustomPopups" %>

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
    <link href="prettify/prettify.css" type="text/css" rel="stylesheet" /> 
    <script type="text/javascript" src="prettify/prettify.js"></script>
    <script type="text/javascript" src="prettify/lang-css.js"></script>
    <script type="text/javascript" src="prettify/lang-vb.js"></script>
</head>
<body style="font:12px Verdana;" >
<script type="text/JavaScript">
    function pageLoad() {
        function invokingRequest() {
            Sys.Net.WebRequestManager.remove_invokingRequest(invokingRequest);
            if (!Obout.Ajax.UI.HTMLEditor.AjaxPopupLoadingInProgress) {
                var editor = $find("<%= editor.ClientID %>");
                if (editor) {
                    editor.get_editPanel().set_activeMode(Obout.Ajax.UI.HTMLEditor.ActiveModeType.Preview);
                }
            }
        }
        Sys.Net.WebRequestManager.add_invokingRequest(invokingRequest);
    }
</script>
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - <b>Editor</b> from the <a style="font-weight:bold" href="http://forum.obout.com/">obout Forum</a></span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel runat="server" ID="editorPanel" Visible="true">
                    <obout:Editor runat="server" Id="editor" Width="100%">
                        <TopToolbar Appearance="lite" PreservePlace="true" AdditionalCSS="~/App_Obout/HTMLEditor/CSS/prettify_editor.css" >
                            <AddButtons>
                                <obout:HorizontalSeparator runat="server" />
                                <obout:FontSize runat="server" />
                                <obout:HorizontalSeparator runat="server" />
                                <obout:ButtonsGroup runat="server"><Buttons>
                                    <obout:Cut runat="server" />
                                    <obout:Copy runat="server" />
                                    <obout:Paste runat="server" />
                                    <obout:PasteText runat="server" />
                                    <obout:PasteWord runat="server" />
                                    <obout:HorizontalSeparator  runat="server" />
                                </Buttons></obout:ButtonsGroup>
                                <obout:ButtonsGroup runat="server"><Buttons>
                                    <obout:OrderedList runat="server" />
                                    <obout:BulletedList runat="server" />
                                    <obout:HorizontalSeparator runat="server" />
                                </Buttons></obout:ButtonsGroup>
                                <obout:ButtonsGroup runat="server"><Buttons>
                                    <obout:InsertLink runat="server" RelatedPopupType="CustomPopups.SmallUrlProperties, App_Code" />
                                    <obout:RemoveLink runat="server" />
                                    <obout:InsertHR runat="server" />
                                    <obout:InsertIcon runat="server" />
                                    <obout:InsertSpecialCharacter runat="server" />
                                    <obout:HorizontalSeparator runat="server" />
                                </Buttons></obout:ButtonsGroup>
                                <obout:ButtonsGroup runat="server"><Buttons>
                                    <obout:InsertTable runat="server" />
                                    <obout:InsertImage runat="server" RelatedPopupType="CustomPopups.SmallImageProperties, App_Code" />
                                    <obout:HorizontalSeparator runat="server" />
                                </Buttons></obout:ButtonsGroup>
                                <obout:SpellCheck runat="server" />
                                <obout:HorizontalSeparator runat="server" />
                                <custom:MakeCodeBlock runat="server" />
                                <custom:RemoveCodeBlock runat="server" />
                            </AddButtons>
                        </TopToolbar>
                        <PopupHolder>
                            <Preload>
                                <custom:InsertCodeBlockPopup runat="server" />
                            </Preload>
                        </PopupHolder>
                        <EditPanel AutoFocus="true" ActiveMode="design" Height="400px" >
                            <ContextMenu UsePredefinedItems="false" >
                                <AddItems>
                                    <obout:EditImageItem runat="server" RelatedPopupType="CustomPopups.SmallImageProperties, App_Code" />
                                    <obout:EditLinkItem runat="server" RelatedPopupType="CustomPopups.SmallUrlProperties, App_Code" />
                                    <obout:RemoveLinkItem runat="server" />
                                    <obout:EditTableItem runat="server" />
                                    <obout:EditCellItem runat="server" />
                                    <obout:InsertRowAboveItem runat="server" />
                                    <obout:InsertRowBelowItem runat="server" />
                                    <obout:RemoveRowItem runat="server" />
                                    <obout:RemoveTableItem runat="server" />
                                    <obout:CutItem runat="server" />
                                    <obout:CopyItem runat="server" />
                                    <obout:PasteItem runat="server" />
                                    <obout:PasteTextItem runat="server" />
                                    <obout:PasteWordItem runat="server" />
                                    <obout:SelectAllItem runat="server" />
                                </AddItems>
                            </ContextMenu>
                        </EditPanel>
                        <BottomToolBar PreservePlace="true" ShowDesignButton="false" ShowHtmlTextButton="false" ShowPreviewButton="false" ShowHtmlTextCounter="true" />
                    </obout:Editor>
                    <br />
                    <asp:Button runat="server" Text="Preview" OnClick="Preview_click" />
                </asp:Panel>
                <asp:Panel runat="server" ID="previewPanel" Visible="false">
                    <asp:Label runat="server" ID="preview" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="450px" Width="100%" />
                    <br />
                    <br />
                    <asp:Button runat="server" Text="Back to edit" OnClick="BackToEdit_click" />
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>