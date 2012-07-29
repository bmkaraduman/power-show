<%@ Page Language="VB" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Server-side Events</title>

    <script language="VB" runat="server">
        Private ObTree As Tree = Nothing
        Private Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)

            ObTree = New Tree() With {.ID = "OboutTree2", .EnableDragAndDrop = True, .AllowNodeEdit = True, .CssClass = "vista", .Width = 200}

            Dim nodeLib As New Node() With {.ExpandMode = NodeExpandMode.ServerSide, .Text = "Libraries", .ImageUrl = "img/library.png", .Expanded = True}
            ObTree.Nodes.Add(nodeLib)

            Dim nodeDoc As New Node() With {.ExpandMode = NodeExpandMode.ServerSide, .Text = "Documents", .ImageUrl = "img/document.png"}
            nodeLib.ChildNodes.Add(nodeDoc)

            nodeDoc.ChildNodes.Add(New Node() With {.Text = "My Documents", .ImageUrl = "img/mydocuments.png"})

            nodeDoc.ChildNodes.Add(New Node() With {.Text = "Public Documents", .ImageUrl = "img/folder.png"})

            Dim nodeMusic As New Node() With {.ExpandMode = NodeExpandMode.ServerSide, .Text = "Music", .ImageUrl = "img/music.png", .Expanded = True}
            nodeLib.ChildNodes.Add(nodeMusic)

            nodeMusic.ChildNodes.Add(New Node() With {.Text = "My Music", .ImageUrl = "img/mymusic.png"})

            nodeMusic.ChildNodes.Add(New Node() With {.Text = "Public Music", .ImageUrl = "img/folder.png"})

            Dim nodePictures As New Node() With {.ExpandMode = NodeExpandMode.ServerSide, .Text = "Pictures", .ImageUrl = "img/picture.png", .Expanded = True}
            nodeLib.ChildNodes.Add(nodePictures)

            nodePictures.ChildNodes.Add(New Node() With {.Text = "My Pictures", .ImageUrl = "img/mypicture.png"})

            nodePictures.ChildNodes.Add(New Node() With {.Text = "Public Pictures", .ImageUrl = "img/folder.png"})

            Dim nodeVid As New Node() With {.ExpandMode = NodeExpandMode.ServerSide, .Text = "Videos", .ImageUrl = "img/video.png", .Expanded = True}
            nodeLib.ChildNodes.Add(nodeVid)

            nodeVid.ChildNodes.Add(New Node() With {.Text = "My Videos", .ImageUrl = "img/my_video.png"})

            nodeVid.ChildNodes.Add(New Node() With {.Text = "Public Videos", .ImageUrl = "img/folder.png"})

            Me.TreePlaceHolder.Controls.Add(ObTree)
            AddHandler ObTree.TreeNodeDrop, AddressOf ObTree_TreeNodeDrop
            AddHandler ObTree.SelectedTreeNodeChanged, AddressOf ObTree_SelectedTreeNodeChanged
            AddHandler ObTree.TreeNodeEdited, AddressOf ObTree_TreeNodeEdited
            AddHandler ObTree.TreeNodeExpanded, AddressOf ObTree_TreeNodeExpanded
        End Sub
        Protected Sub ObTree_TreeNodeDrop(ByVal sender As Object, ByVal e As Obout.Ajax.UI.TreeView.NodeDropEventArgs)
            Me.Event_log.Text = String.Format("'NodeDropEvent : '{0}' is dropped in '{1}'", e.SourceNode.Text, e.TargetNode.Text)
        End Sub
        Protected Sub ObTree_SelectedTreeNodeChanged(ByVal sender As Object, ByVal e As Obout.Ajax.UI.TreeView.NodeEventArgs)
            Me.Event_log.Text = String.Format("'NodeSelectedEvent is fired on '{0}'.", e.Node.Text)
        End Sub
        Protected Sub ObTree_TreeNodeEdited(ByVal sender As Object, ByVal e As Obout.Ajax.UI.TreeView.NodeEditingEventArgs)
            Me.Event_log.Text = String.Format("'NodeEditedEvent : '{0}' is renamed as '{1}'.", e.Node.Text, e.NewValue)
        End Sub
        Protected Sub ObTree_TreeNodeExpanded(ByVal sender As Object, ByVal e As Obout.Ajax.UI.TreeView.NodeEventArgs)
            Me.Event_log.Text = String.Format("'NodeExpandedEvent is fired on '{0}'.", e.Node.Text)
        End Sub
    </script>

    <style type="text/css">
        body
        {
            font-family: "Segoe UI" ,Arial,sans-serif;
            font-size: 12px;
        }
        #td_chk
        {
            vertical-align: top;
            width: 100%;
        }
        #eventLbl
        {
            width: 100%;
            background-color: #AAC0CF;
            padding: 1px;
            font-weight: bold;
        }
        #eventLog
        {
            border: 1px solid #AAC0CF;
            bottom: 0;
            display: block;
            top: 0;
            margin: 0;
            overflow: auto;
            position: absolute;
            width: 100%;
        }
        #eventCont
        {
            height: 150px;
            position: relative;
        }
        #eventLog span
        {
            background: url("img/log.png") no-repeat;
            border-bottom: 1px solid #AAC0CF;
            display: block;
            margin: 0;
            padding: 1px 1px 1px 22px;
        }
        .hide
        {
            opacity: 0.4;
            filter: alpha(opacity=40);
        }
        #popupImg
        {
            position: absolute;
            text-align: center;
            display: none;
        }
        #popupImg img
        {
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -12px;
            margin-left: -12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <br />
		<a class="examples" href="Default.aspx?type=ASPNET">« Back to examples</a>
		<br />
     <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <h2>
        ASP.NET TreeView - Server-side Events</h2>
    <div class="live_example">
    </div>
    <table width="80%">
        <tr>
            <td valign="top">
                <div>
                    <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
                </div>
            </td>
            <td id="td_chk">
                <b>Server Side Event Log:</b><br />
                <asp:Label ID="Event_log" Font-Size="12px" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
