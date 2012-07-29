<%@ Page Language="C#" %>

<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.TreeView" tagprefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Server-side Events</title>

    <script language="C#" runat="server">
        protected void OboutTree2_TreeNodeDrop(object sender, Obout.Ajax.UI.TreeView.NodeDropEventArgs e)
        {
            this.Event_log.Text = string.Format("'NodeDropEvent : '{0}' is dropped in '{1}'", e.SourceNode.Text, e.TargetNode.Text);
        }
        protected void OboutTree2_SelectedTreeNodeChanged(object sender, Obout.Ajax.UI.TreeView.NodeEventArgs e)
        {
            this.Event_log.Text = string.Format("'NodeSelectedEvent is fired on '{0}'.", e.Node.Text);
        }
        protected void OboutTree2_TreeNodeEdited(object sender, Obout.Ajax.UI.TreeView.NodeEditingEventArgs e)
        {
            this.Event_log.Text = string.Format("'NodeEditedEvent : '{0}' is renamed as '{1}'.", e.Node.Text, e.NewValue);
        }
        protected void OboutTree2_TreeNodeExpanded(object sender, Obout.Ajax.UI.TreeView.NodeEventArgs e)
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
                    <obout:Tree ID="OboutTree2" EnableDragAndDrop="true" AllowNodeEdit="true" CssClass="vista"
                        OnSelectedTreeNodeChanged="OboutTree2_SelectedTreeNodeChanged" OnTreeNodeDrop="OboutTree2_TreeNodeDrop"
                        OnTreeNodeEdited="OboutTree2_TreeNodeEdited" OnTreeNodeExpanded="OboutTree2_TreeNodeExpanded"
                        runat="server" Width="200px">
                        <Nodes>
                            <obout:Node ExpandMode="ServerSide" Text="Libraries" ImageUrl="img/library.png" Expanded="true">
                                <obout:Node ExpandMode="ServerSide" Text="Documents" ImageUrl="img/document.png">
                                    <obout:Node Text="My Documents" ImageUrl="img/mydocuments.png">
                                    </obout:Node>
                                    <obout:Node Text="Public Documents" ImageUrl="img/folder.png">
                                    </obout:Node>
                                </obout:Node>
                                <obout:Node ExpandMode="ServerSide" Text="Music" ImageUrl="img/music.png" Expanded="true">
                                    <obout:Node Text="My Music" ImageUrl="img/mymusic.png">
                                    </obout:Node>
                                    <obout:Node Text="Public Music" ImageUrl="img/folder.png">
                                    </obout:Node>
                                </obout:Node>
                                <obout:Node ExpandMode="ServerSide" Text="Pictures" ImageUrl="img/picture.png" Expanded="true">
                                    <obout:Node Text="My Pictures" ImageUrl="img/mypicture.png">
                                    </obout:Node>
                                    <obout:Node Text="Public Pictures" ImageUrl="img/folder.png">
                                    </obout:Node>
                                </obout:Node>
                                <obout:Node ExpandMode="ServerSide" Text="Videos" ImageUrl="img/video.png" Expanded="true">
                                    <obout:Node Text="My Videos" ImageUrl="img/my_video.png">
                                    </obout:Node>
                                    <obout:Node Text="Public Videos" ImageUrl="img/folder.png">
                                    </obout:Node>
                                </obout:Node>
                            </obout:Node>
                        </Nodes>
                    </obout:Tree>
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
