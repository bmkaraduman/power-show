<%@ Page Language="C#" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Server-side Events</title>

    <script language="C#" runat="server">
        Tree ObTree = null;
        void Page_Init(object sender, EventArgs e)
        {

            ObTree = new Tree()
            {
                ID = "OboutTree2",
                EnableDragAndDrop = true,
                AllowNodeEdit = true,
                CssClass = "vista",
                Width = 200
            };

            Node nodeLib = new Node()
            {
                ExpandMode = NodeExpandMode.ServerSide,
                Text = "Libraries",
                ImageUrl = "img/library.png",
                Expanded = true
            };
            ObTree.Nodes.Add(nodeLib);

            Node nodeDoc = new Node()
            {
                ExpandMode = NodeExpandMode.ServerSide,
                Text = "Documents",
                ImageUrl = "img/document.png"
            };
            nodeLib.ChildNodes.Add(nodeDoc);

            nodeDoc.ChildNodes.Add(new Node()
            {
                Text = "My Documents",
                ImageUrl = "img/mydocuments.png"
            });

            nodeDoc.ChildNodes.Add(new Node()
            {
                Text = "Public Documents",
                ImageUrl = "img/folder.png"
            });

            Node nodeMusic = new Node()
            {
                ExpandMode = NodeExpandMode.ServerSide,
                Text = "Music",
                ImageUrl = "img/music.png",
                Expanded = true
            };
            nodeLib.ChildNodes.Add(nodeMusic);

            nodeMusic.ChildNodes.Add(new Node()
            {
                Text = "My Music",
                ImageUrl = "img/mymusic.png"
            });

            nodeMusic.ChildNodes.Add(new Node()
            {
                Text = "Public Music",
                ImageUrl = "img/folder.png"
            });

            Node nodePictures = new Node()
            {
                ExpandMode = NodeExpandMode.ServerSide,
                Text = "Pictures",
                ImageUrl = "img/picture.png",
                Expanded = true
            };
            nodeLib.ChildNodes.Add(nodePictures);

            nodePictures.ChildNodes.Add(new Node()
            {
                Text = "My Pictures",
                ImageUrl = "img/mypicture.png"
            });

            nodePictures.ChildNodes.Add(new Node()
            {
                Text = "Public Pictures",
                ImageUrl = "img/folder.png"
            });

            Node nodeVid = new Node()
            {
                ExpandMode = NodeExpandMode.ServerSide,
                Text = "Videos",
                ImageUrl = "img/video.png",
                Expanded = true
            };
            nodeLib.ChildNodes.Add(nodeVid);

            nodeVid.ChildNodes.Add(new Node()
            {
                Text = "My Videos",
                ImageUrl = "img/my_video.png"
            });

            nodeVid.ChildNodes.Add(new Node()
            {
                Text = "Public Videos",
                ImageUrl = "img/folder.png"
            });

            this.TreePlaceHolder.Controls.Add(ObTree);
            ObTree.TreeNodeDrop+=new NodeDropEventHandler(ObTree_TreeNodeDrop);
            ObTree.SelectedTreeNodeChanged+=new NodeEventHandler(ObTree_SelectedTreeNodeChanged);
            ObTree.TreeNodeEdited+=new NodeEditEventHandler(ObTree_TreeNodeEdited);
            ObTree.TreeNodeExpanded+=new NodeEventHandler(ObTree_TreeNodeExpanded);
        }
        protected void ObTree_TreeNodeDrop(object sender, Obout.Ajax.UI.TreeView.NodeDropEventArgs e)
        {
            this.Event_log.Text = string.Format("'NodeDropEvent : '{0}' is dropped in '{1}'", e.SourceNode.Text, e.TargetNode.Text);
        }
        protected void ObTree_SelectedTreeNodeChanged(object sender, Obout.Ajax.UI.TreeView.NodeEventArgs e)
        {
            this.Event_log.Text = string.Format("'NodeSelectedEvent is fired on '{0}'.", e.Node.Text);
        }
        protected void ObTree_TreeNodeEdited(object sender, Obout.Ajax.UI.TreeView.NodeEditingEventArgs e)
        {
            this.Event_log.Text = string.Format("'NodeEditedEvent : '{0}' is renamed as '{1}'.", e.Node.Text, e.NewValue);
        }
        protected void ObTree_TreeNodeExpanded(object sender, Obout.Ajax.UI.TreeView.NodeEventArgs e)
        {
            this.Event_log.Text = string.Format("'NodeExpandedEvent is fired on '{0}'.", e.Node.Text);
        }
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
