<%@ Page Language="C#" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        if (this.Menu1.SelectedValue == "0")
        {
            this.tabView.ActiveViewIndex = 0;
            this.Tree1.AutoPostBackOnNodeSelect = false;
        }
        else
        {
            this.tabView.ActiveViewIndex = 1;
            this.Tree1.AutoPostBackOnNodeSelect = true;
            UpdateLog();
        }
    }

    private void UpdateLog()
    {
        serverlogger.InnerHtml = string.Empty;
        foreach (Node node in this.Tree1.SelectedNodes)
        {
            serverlogger.InnerHtml += node.Text + "</br>";
        }
    }

    protected void Tree1_SelectedTreeNodeChanged(object sender, NodeEventArgs e)
    {
        UpdateLog();
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Multiple Node Selection</title>
    <style type="text/css">
        body
        {
            font-family: "Segoe UI" ,Arial,sans-serif;
            font-size: 12px;
        }
    </style>
    <script type="text/javascript">
        function onNodeSelect(sender, args) {
            var logger = $get("lstSelectedNodes");
            if (logger == null)
                return;
            logger.innerHTML = "";
            //get whether ctrl or shift is pressed
            if (args.isMultipleSelect) {
                for (var i = 0; i < sender.selectedNodes.length; i++) {
                    logger.innerHTML += sender.getNodeText(sender.selectedNodes[i]) + '<br/>';
                }
            }
            logger.innerHTML += sender.getNodeText(args.node);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <br />
    <a class="examples" href="Default.aspx?type=ASPNET">« Back to examples</a>
    <br />
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <h2>
        ASP.NET TreeView - Multiple Node Selection</h2>
    <table border="0">
        <tr>
            <td colspan="2">
                <ul>
                    <li>Use 'Ctrl' key to select a multiple nodes</li>
                    <li>Use 'Shift' key to select range of nodes</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td valign="top" class="h5" width="230px">
                <obout:Tree ID="Tree1" TabIndex="1" runat="server" EnableMultiNodeSelection="true"
                    CssClass="vista" OnNodeSelect="onNodeSelect" 
                    onselectedtreenodechanged="Tree1_SelectedTreeNodeChanged">
                    <Nodes>
                        <obout:Node Text="Personal Folders" Expanded="true" ImageUrl="img/Outlook/root.png">
                            <obout:Node Text="Deleted Items" ImageUrl="img/Outlook/folder.png">
                            </obout:Node>
                            <obout:Node Text="Drafts" ImageUrl="img/Outlook/deleted.png">
                            </obout:Node>
                            <obout:Node ClientID="" Text="Inbox (4)" CssClass="txtBold" ImageUrl="img/Outlook/inbox.png">
                            </obout:Node>
                            <obout:Node ClientID="" Text="Junk E -mail (3)" CssClass="txtBold" ImageUrl="img/Outlook/folder.png">
                            </obout:Node>
                            <obout:Node ClientID="" Text="Outbox" ImageUrl="img/Outlook/outbox.png">
                            </obout:Node>
                            <obout:Node ClientID="" Text="RSS Feeds" ImageUrl="img/Outlook/rss.png">
                                <obout:Node ClientID="" Text="Microsoft at Home" ImageUrl="img/Outlook/folder.png">
                                </obout:Node>
                                <obout:Node ClientID="" Text="Microsoft at Work" ImageUrl="img/Outlook/folder.png">
                                </obout:Node>
                                <obout:Node ClientID="" Text="MSNBC News" ImageUrl="img/Outlook/folder.png">
                                </obout:Node>
                            </obout:Node>
                            <obout:Node ClientID="" Text="Sent Items" ImageUrl="img/Outlook/sent.png">
                            </obout:Node>
                            <obout:Node ClientID="" Text="Search Folders" CssClass="txtItalic" ImageUrl="img/Outlook/search.png">
                                <obout:Node ClientID="" Text="Categorized Mail" CssClass="txtItalic" ImageUrl="img/Outlook/search.png">
                                </obout:Node>
                                <obout:Node ClientID="" Text="Large Mail" CssClass="txtItalic" ImageUrl="img/Outlook/search.png">
                                </obout:Node>
                                <obout:Node ClientID="" Text="Unread Mail" CssClass="txtItalic" ImageUrl="img/Outlook/search.png">
                                </obout:Node>
                            </obout:Node>
                        </obout:Node>
                    </Nodes>
                </obout:Tree>
            </td>
            <td class="tdText" valign="top">
                <asp:Menu ID="Menu1" runat="server" BackColor="#F7F6F3" DynamicHorizontalOffset="2"
                    Orientation="Horizontal" ForeColor="Black" StaticSubMenuIndent="10px" OnMenuItemClick="Menu1_MenuItemClick">
                    <DynamicHoverStyle BackColor="#7C6F57" ForeColor="White" />
                    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <DynamicMenuStyle BackColor="#F7F6F3" />
                    <DynamicSelectedStyle BackColor="#5D7B9D" ForeColor="Wheat" />
                    <Items>
                        <asp:MenuItem Text="Client Side" Value="0" Selected="true"></asp:MenuItem>
                        <asp:MenuItem Text="Server side" Value="1"></asp:MenuItem>
                    </Items>
                    <StaticHoverStyle BackColor="#7C6F57" ForeColor="White" />
                    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <StaticSelectedStyle BackColor="#5D7B9D" />
                </asp:Menu>
                <asp:MultiView ID="tabView" runat="server" ActiveViewIndex="0">
                    <asp:View runat="server">
                        <asp:Panel runat="server" style="padding-left:5px"  ScrollBars="Auto" BorderColor="#5D7B9D" BorderWidth="1px"
                            Width="400px" Height="200px">
                            <p>
                                <b>Selected Nodes</b> :
                            </p>
                            <div id="lstSelectedNodes" style="margin-left: 10px">
                            </div>
                        </asp:Panel>
                    </asp:View>
                    <asp:View runat="server">
                        <asp:Panel runat="server" style="padding-left:5px"  ScrollBars="Auto" BorderColor="#5D7B9D" BorderWidth="1px"
                            Width="400px" Height="200px">
                            <p>
                                <b>Selected Nodes</b> :
                            </p>
                            <div id="serverlogger" style="margin-left: 10px" runat="server" text="">
                            </div>
                        </asp:Panel>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
