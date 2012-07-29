<%@ Page Language="C#" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat=server>
    <title>Example Page - Drag and drop core features</title>

    <script language="C#" runat="server">   
        protected void chk_allowDragDrop_CheckedChanged(object sender, EventArgs e)
        {
            this.ObClassicTree.EnableDragAndDrop = chk_allowDragDrop.Checked;
        }
    </script>

    <style type="text/css">
        body
        {
            font-family: "Segoe UI" ,Arial,sans-serif;
            font-size: 12px;
        }
        .tb_sample
        {
            width: 100%;
        }
        .tb_sample td
        {
            width: 50%;
            vertical-align: top;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <br />
		<a class="examples" href="Default.aspx?type=ASPNET">« Back to examples</a>
		<br />
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />

    <script type="text/javascript">
        function OnClientNodeDrop(sender, args) {
            var chk_conform = document.getElementById("<%=chk_conformNodeDrop.ClientID %>");
            if (chk_conform.checked) {
                var action = confirm("Move '" + getNodeText(args.sourceNode) + "' to '" + getNodeText(args.target) + "'?");
                args.cancel = !action;
            }
        }
        function getNodeText(node) {
            return node.innerText != undefined ? node.innerText : node.textContent;
        }
      

    </script>

    <h2>
        ASP.NET TreeView - Drag and drop core features
    </h2>
    <asp:BulletedList ID="Bulletedlist1" runat="server">
        <asp:ListItem Text="">Dragging is disabled for the node, 'Recycle Bin'.</asp:ListItem>
        <asp:ListItem Text="">Dropping is disabled for the node, 'My Computer'.</asp:ListItem>
        <asp:ListItem Text="">Drag and dropping is disabled for the node, 'Desktop'</asp:ListItem>
    </asp:BulletedList>
    <table class="tb_sample">
        <tr>
            <td>
                <obout:Tree ID="ObClassicTree" ClientObjectID="obTree1" EnableDragAndDrop="true"
                    OnNodeDrop="OnClientNodeDrop" runat="server">
                    <Nodes>
                        <obout:Node Text="Desktop" AllowDrag="false" AllowDrop="false" Expanded="true" ImageUrl="img/WinXP/desktop.gif">
                            <obout:Node Text="My Documents" ImageUrl="img/WinXP/myDocuments.gif">
                            </obout:Node>
                            <obout:Node Text="My Computer" AllowDrop="false" Expanded="true" ImageUrl="img/WinXP/2PCRemote.gif">
                                <obout:Node Text="Local Disk (C:)" Expanded="true" ImageUrl="img/WinXP/15hardDisk.gif">
                                    <obout:Node Text="Documents and Settings" ImageUrl="img/WinXP/folder.gif">
                                        <obout:Node Text="All Users" ImageUrl="img/WinXP/folder.gif">
                                        </obout:Node>
                                        <obout:Node Text="Guest" ImageUrl="img/WinXP/folder.gif">
                                        </obout:Node>
                                    </obout:Node>
                                    <obout:Node Text="Program Files" ImageUrl="img/WinXP/folder.gif">
                                        <obout:Node Text="Common Files" ImageUrl="img/WinXP/folder.gif">
                                        </obout:Node>
                                        <obout:Node Text="MSDN" ImageUrl="img/WinXP/folder.gif">
                                        </obout:Node>
                                    </obout:Node>
                                </obout:Node>
                                <obout:Node Text="DVD-RAM Drive (E:)" ImageUrl="img/WinXP/14CD.gif">
                                </obout:Node>
                                <obout:Node Text="Guest's Documents" ImageUrl="img/WinXP/folder.gif">
                                </obout:Node>
                            </obout:Node>
                            <obout:Node Text="My Network Places" ImageUrl="img/WinXP/6myNetworkPlaces.gif">
                            </obout:Node>
                            <obout:Node Text="Recycle Bin" AllowDrag="false" ImageUrl="img/WinXP/13Recycle.gif">
                            </obout:Node>
                        </obout:Node>
                    </Nodes>
                </obout:Tree>
                </div> </ContentTemplate>
            </td>
            <td>
                <asp:CheckBox AutoPostBack="true" Checked="true" ID="chk_allowDragDrop" Text=" Enable drag and drop"
                    runat="server" OnCheckedChanged="chk_allowDragDrop_CheckedChanged" />
                <br />
                <br />
                <asp:CheckBox Checked="true" ID="chk_conformNodeDrop" Text=" Conform before node drop"
                    runat="server" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
