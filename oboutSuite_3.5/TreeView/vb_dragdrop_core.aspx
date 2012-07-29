<%@ Page Language="VB" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Drag and drop core features</title>

    <script language="VB" runat="server">  
        Private ObTree As Tree = Nothing
        Private Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)

            ObTree = New Tree() With {.ID = "ObTree", .EnableDragAndDrop = True, .OnNodeDrop = "OnClientNodeDrop"}

            Dim nodeDesktop As New Node() With {.AllowDrag = False, .AllowDrop = False, .Expanded = True, .ImageUrl = "img/WinXP/desktop.gif", .Text = "Desktop"}
            ObTree.Nodes.Add(nodeDesktop)

            nodeDesktop.ChildNodes.Add(New Node() With {.Text = "My Documents", .ImageUrl = "img/WinXP/myDocuments.gif"})

            Dim nodeMyComp As New Node() With {.Text = "My Computer", .AllowDrop = False, .Expanded = True, .ImageUrl = "img/WinXP/2PCRemote.gif"}
            nodeDesktop.ChildNodes.Add(nodeMyComp)

            Dim nodeCDrive As New Node() With {.Text = "Local Disk (C:)", .Expanded = True, .ImageUrl = "img/WinXP/15hardDisk.gif"}
            nodeMyComp.ChildNodes.Add(nodeCDrive)

            Dim nodedocSetting As New Node() With {.Text = "Documents and Settings", .ImageUrl = "img/WinXP/folder.gif"}
            nodeCDrive.ChildNodes.Add(nodedocSetting)

            nodeCDrive.ChildNodes.Add(New Node() With {.Text = "All Users", .ImageUrl = "img/WinXP/folder.gif"})
            nodeCDrive.ChildNodes.Add(New Node() With {.Text = "Guest", .ImageUrl = "img/WinXP/folder.gif"})
            Dim nodeProgFiles As New Node() With {.Text = "Program Files", .ImageUrl = "img/WinXP/folder.gif"}
            nodeCDrive.ChildNodes.Add(nodeProgFiles)

            nodeProgFiles.ChildNodes.Add(New Node() With {.Text = "Common Files", .ImageUrl = "img/WinXP/folder.gif"})
            nodeProgFiles.ChildNodes.Add(New Node() With {.Text = "MSDN", .ImageUrl = "img/WinXP/folder.gif"})

            nodeMyComp.ChildNodes.Add(New Node() With {.Text = "DVD-RAM Drive (E:)", .ImageUrl = "img/WinXP/14CD.gif"})

            nodeMyComp.ChildNodes.Add(New Node() With {.Text = "Guest's Documents", .ImageUrl = "img/WinXP/folder.gif"})

            nodeDesktop.ChildNodes.Add(New Node() With {.Text = "My Network Places", .ImageUrl = "img/WinXP/6myNetworkPlaces.gif"})

            nodeDesktop.ChildNodes.Add(New Node() With {.Text = "Recycle Bin", .AllowDrag = False, .ImageUrl = "img/WinXP/13Recycle.gif"})

            Me.TreePlaceHolder.Controls.Add(ObTree)
        End Sub
        Protected Sub chk_allowDragDrop_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            Me.ObTree.EnableDragAndDrop = chk_allowDragDrop.Checked
        End Sub
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
                <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
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
