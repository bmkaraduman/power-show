<%@ Page Language="C#" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Client Events Sample</title>

    <script language="C#" runat="server">
        Tree obClassicTree = null;
        void Page_Init(object sender, EventArgs e)
        {
            obClassicTree = new Tree()
            {
                ID = "ObClassicTree",
                EnableDragAndDrop = true,
                AllowNodeEdit = true,
                OnBeforeNodeEdit = "clientOnBeforeNodeEdit",
                OnNodeEdit = "clientOnNodeEdit",
                OnNodeCollapse = "clientOnNodeCollapse",
                OnNodeExpand = "clientOnNodeExpand",
                OnNodeDragging = "clientOnNodeDragging",
                OnNodeDragStart = "clientOnNodeDragStart",
                OnNodeDrop = "clientOnNodeDrop",
                OnNodeMouseOut = "clientOnNodeMouseOut",
                OnNodeMouseOver = "clientOnNodeMouseOver",
                OnNodeSelect = "clientOnNodeSelect",
                CssClass = "vista",
                Width = 200
            };
            Node nodeLib = new Node()
            {
                Text = "Libraries",
                Expanded = true,
                ImageUrl = "img/library.png"
            };

            Node nodeDoc = new Node()
            {
                Text = "Documents",
                ImageUrl = "img/document.png"
            };
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

            nodeLib.ChildNodes.Add(nodeDoc);

            Node nodeMus = new Node()
            {
                Text = "Music",
                ImageUrl = "img/music.png",
                Expanded = true
            };
            nodeMus.ChildNodes.Add(new Node()
            {
                Text = "My Music",
                ImageUrl = "img/mymusic.png"
            });
            nodeMus.ChildNodes.Add(new Node()
            {
                Text = "Public Music",
                ImageUrl = "img/folder.png"
            });
            nodeLib.ChildNodes.Add(nodeMus);

            Node nodePic = new Node()
            {
                Text = "Pictures",
                ImageUrl = "img/picture.png",
                Expanded = true
            };
            nodePic.ChildNodes.Add(new Node()
            {
                Text = "My Pictures",
                ImageUrl = "img/mypicture.png"
            });
            nodePic.ChildNodes.Add(new Node()
            {
                Text = "Public Pictures",
                ImageUrl = "img/folder.png"
            });
            nodeLib.ChildNodes.Add(nodePic);

            Node nodeVid = new Node()
            {
                Text = "Videos",
                ImageUrl = "img/video.png",
                Expanded = true
            };
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
            nodeLib.ChildNodes.Add(nodeVid);

            this.obClassicTree.Nodes.Add(nodeLib);

            this.TreePlaceHolder.Controls.Add(obClassicTree);
        }
        void Page_load(object sender, EventArgs e)
        {
            //Bind the treeview
            obClassicTree.DataBind();
            //Expand first root node!
            obClassicTree.Nodes[0].Expanded = true;
        }	
    </script>

    <style type="text/css">
        body
        {
            font-family: "Segoe UI" ,Arial,sans-serif;
            font-size: 12px;
        }
        #td_chk input
        {
            margin: 5px;
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
            background: url( "img/log.png" ) no-repeat;
            border-bottom: 1px solid #AAC0CF;
            display: block;
            margin: 0;
            padding: 1px 1px 1px 22px;
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
        //Event will get fired on before editing a node
        function clientOnBeforeNodeEdit(sender, args) {
            var chk = document.getElementById('<%=this.chk_OnBeforeNodeEdit.ClientID %>');
            if (chk.checked) {
                addLogEntry("'OnBeforeNodeEdit' event is fired on '" + sender.getNodeText(args.node) + "'");
            }
        }
        //Event will get fired on after editing a node
        function clientOnNodeEdit(sender, args) {
            var chk = document.getElementById('<%=this.chk_OnNodeEdit.ClientID %>');
            if (chk.checked) {
                addLogEntry("'OnNodeEdit' : '" + args.text + "' is renamed as '" + args.newText + "'");
            }
        }
        //Event will get fired while node is collapsed
        function clientOnNodeCollapse(sender, args) {
            var chk = document.getElementById('<%=this.chk_OnNodeCollapse.ClientID %>');
            if (chk.checked) {
                addLogEntry("'OnNodeCollapse' event is fired on '" + sender.getNodeText(args.node) + "'");
            }
        }
        //Event will get fired while node is expanded
        function clientOnNodeExpand(sender, args) {
            var chk = document.getElementById('<%=this.chk_OnNodeExpand.ClientID %>');
            if (chk.checked) {
                addLogEntry("'OnNodeExpand' event is fired on '" + sender.getNodeText(args.node) + "'");
            }
        }
        //Event will get fired while a node is dragging
        function clientOnNodeDragging(sender, args) {
            var chk = document.getElementById('<%=this.chk_OnNodeDragging.ClientID %>');
            if (chk.checked) {
                addLogEntry("'OnNodeDragging' event is fired on '" + sender.getNodeText(args.sourceNode) + ". Mouse at (" + args._event.clientX + ',' + args._event.clientY + ")'");
            }
        }
        //Event will get fired on before a node is dragged
        function clientOnNodeDragStart(sender, args) {
            var chk = document.getElementById('<%=this.chk_OnNodeDragStart.ClientID %>');
            if (chk.checked) {
                addLogEntry("'OnNodeDragStart' event is fired on '" + sender.getNodeText(args.sourceNode) + "'");

            }
        }
        //Event will get fired while a node is dropped
        function clientOnNodeDrop(sender, args) {
            var chk = document.getElementById('<%=this.chk_OnNodeDrop.ClientID %>');
            if (chk.checked) {
                if (sender.isNode(args.target)) {
                    addLogEntry("'OnNodeDrop' event is fired. Source Node : '" + sender.getNodeText(args.sourceNode) + "',  Target Node : '" + sender.getNodeText(args.target) + "'");
                }
            }
            args.cancel = !confirm("Are you sure to continue?If yes, Postback will occur and the log will be cleared!");

        }
        //Event will get fired while a mouse is hovered on a node
        function clientOnNodeMouseOut(sender, args) {
            var chk = document.getElementById('<%=this.chk_OnNodeMouseOut.ClientID %>');
            if (chk.checked) {
                addLogEntry("'OnNodeMouseOut' event is fired on '" + sender.getNodeText(args.node) + "'");
            }
        }
        //Event will get fired while a node is selected
        function clientOnNodeMouseOver(sender, args) {
            var chk = document.getElementById('<%=this.chk_OnNodeMouseOver.ClientID %>');
            if (chk.checked) {
                addLogEntry("'OnNodeMouseOver' event is fired on '" + sender.getNodeText(args.node) + "'");
            }
        }
        //Event will get fired while a mouse is hovered out on a node
        function clientOnNodeSelect(sender, args) {
            var chk = document.getElementById('<%=this.chk_OnNodeSelect.ClientID %>');
            if (chk.checked) {
                addLogEntry("'OnNodeSelect' event is fired on '" + sender.getNodeText(args.node) + "'");
            }
        }
        function addLogEntry(msg) {
            document.getElementById('eventLog').innerHTML += "<span>" + msg + "</span";
        }
        function clearLog() {
            document.getElementById('eventLog').innerHTML = "";
        }
    </script>

    <div>
        <h2>
            ASP.NET TreeView - Client-side Events</h2>
        <table width="80%">
            <tr>
                <td valign="top">
                    <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
                </td>
                <td id="td_chk" valign="top">
                    <asp:CheckBox ID="chk_OnBeforeNodeEdit" Checked="true" Text=" OnBeforeNodeEdit" runat="server" />
                    <br />
                    <asp:CheckBox ID="chk_OnNodeEdit" Checked="true" Text=" OnNodeEdit" runat="server" />
                    <br />
                    <asp:CheckBox ID="chk_OnNodeExpand" Checked="true" Text=" OnNodeExpand" runat="server" />
                    <br />
                    <asp:CheckBox ID="chk_OnNodeCollapse" Checked="true" Text=" OnNodeCollapse" runat="server" />
                    <br />
                    <asp:CheckBox ID="chk_OnNodeDragStart" Checked="true" Text=" OnNodeDragStart" runat="server" />
                    <br />
                    <asp:CheckBox ID="chk_OnNodeDragging" Checked="true" Text=" OnNodeDragging" runat="server" />
                    <br />
                    <asp:CheckBox ID="chk_OnNodeDrop" Checked="true" Text=" OnNodeDrop" runat="server" />
                    <br />
                    <asp:CheckBox ID="chk_OnNodeSelect" Checked="true" Text=" OnNodeSelect" runat="server" />
                    <br />
                    <asp:CheckBox ID="chk_OnNodeMouseOver" Checked="true" Text=" OnNodeMouseOver" runat="server" />
                    <br />
                    <asp:CheckBox ID="chk_OnNodeMouseOut" Checked="true" Text=" OnNodeMouseOut" runat="server" />
                </td>
            </tr>
        </table>
        <br />
        <div id="eventLbl">
            &nbsp;&nbsp; Event Log :</div>
        <div id="eventCont">
            <div id="eventLog">
            </div>
        </div>
        <div style="text-align: right">
            <input id="Button1" type="button" value="Clear log" onclick="clearLog()" /></div>
    </div>
    </form>
</body>
</html>
