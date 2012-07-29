<%@ Page Language="VB" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Customizing TreeView Images</title>

    <script language="VB" runat="server">
        Private ObTree As Tree = Nothing
        Private Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
            ObTree = New Tree() With {.ID = "ObTree", .Width = 200, .EnableViewState = False}

            ObTree.RootNodeStyle.NodeCSS = "msn_root_node"

            Dim nodeCont As New Node() With {.Expanded = True, .Text = "All Contacts (3/3)", .SelectMode = NodeSelectMode.Expand}

            nodeCont.ChildNodes.Add(New Node() With {.Text = "Nancy Davolio"})
            nodeCont.ChildNodes.Add(New Node() With {.Text = "Janet Liverling"})
            nodeCont.ChildNodes.Add(New Node() With {.Text = "Margaret Peacock"})

            ObTree.Nodes.Add(nodeCont)

            Dim nodeHome As New Node() With {.Expanded = True, .Text = "Home (1/1)", .SelectMode = NodeSelectMode.Expand}

            nodeHome.ChildNodes.Add(New Node() With {.Text = "Andrew Fuller"})

            ObTree.Nodes.Add(nodeHome)

            Dim nodeOff As New Node() With {.Expanded = True, .Text = "Office (2/2)", .SelectMode = NodeSelectMode.Expand}

            nodeOff.ChildNodes.Add(New Node() With {.Text = "Laura Callahan"})
            nodeOff.ChildNodes.Add(New Node() With {.Text = "Steven Buchanan"})

            ObTree.Nodes.Add(nodeOff)

            Me.TreePlaceHolder.Controls.Add(ObTree)
        End Sub
        Private Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
            If Not IsPostBack Then
                EnableNodeExpColLeafImages(True)
            End If
        End Sub
        Private Sub EnableNodeImage(ByVal flag As Boolean)
            For Each node As Node In ObTree.Nodes
                If flag Then
                    node.ImageUrl = "img/info.png"
                Else
                    node.ImageUrl = String.Empty
                End If
                If node.ChildNodes.Count > 0 Then
                    SetNodeImage(node, flag)
                End If
            Next node
        End Sub
        Private Sub SetNodeImage(ByVal node As Node, ByVal flag As Boolean)
            For Each chidlNode As Node In node.ChildNodes
                If flag Then
                    chidlNode.ImageUrl = "img/info.png"
                Else
                    chidlNode.ImageUrl = String.Empty
                End If
                If chidlNode.ChildNodes.Count > 0 Then
                    SetNodeImage(chidlNode, flag)
                End If
            Next chidlNode
        End Sub
        Private Sub EnableNodeExpColLeafImages(ByVal flag As Boolean)
            If flag Then
                Me.ObTree.ExpandImageUrl = "img/exp_msn.gif"
                Me.ObTree.CollapseImageUrl = "img/col_msn.gif"
                Me.ObTree.LeafNodeImageUrl = "img/leaf_msn.gif"
            Else
                Me.ObTree.LeafNodeImageUrl = String.Empty
                Me.ObTree.CollapseImageUrl = Me.ObTree.LeafNodeImageUrl
                Me.ObTree.ExpandImageUrl = Me.ObTree.CollapseImageUrl
            End If
        End Sub
        Protected Sub chk_enableImages_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            EnableNodeExpColLeafImages(chk_enableLeaf.Checked)
            'Use node 'ImageUrl' property to enable the node images
            EnableNodeImage(chk_enableImg.Checked)
        End Sub
    </script>

    <style type="text/css">
        body
        {
            font-family: "Segoe UI" ,Arial,sans-serif;
            font-size: 12px;
        }
        .msn_root_node
        {
            font-family: Verdana;
            font-size: 8pt;
            font-weight: bold;
            color: #0A246A;
        }
        .msn_selected .textcont
        {
            color: White;
            background-color: #0A246A;
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
    <div>
        <h2>
            ASP.NET TreeView - Customizing TreeView Images</h2>
        <p>
            You can use custom images to indicate an expandable node, a collapsible node, or
            a leaf node that does not expand or collapse. Also each node can have an image which
            is rendered to the left of the node text.
        </p>
        <table class="tb_sample">
            <tr>
                <td>
                    <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
                </td>
                <td>
                    <asp:CheckBox ID="chk_enableLeaf" Text=" Enable Custom Expanded/Collapsed/Leaf Node Images"
                        AutoPostBack="true" Checked="true" OnCheckedChanged="chk_enableImages_CheckedChanged"
                        runat="server" />
                    <p>
                    </p>
                    <asp:CheckBox ID="chk_enableImg" Text=" Enable Custom Node Image" AutoPostBack="true"
                        OnCheckedChanged="chk_enableImages_CheckedChanged" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
