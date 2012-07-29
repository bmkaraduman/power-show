<%@ Page Language="VB" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat=server>
    <title>Example Page - Client Events Sample</title>

    <script language="VB" runat="server">
        Private obClassicTree As Tree = Nothing
        Private Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
            obClassicTree = New Tree() With { _
             .ID = "ObClassicTree", _
             .EnableDragAndDrop = True, _
             .AllowNodeEdit = True, _
             .OnBeforeNodeEdit = "clientOnBeforeNodeEdit", _
             .OnNodeEdit = "clientOnNodeEdit", _
             .OnNodeCollapse = "clientOnNodeCollapse", _
             .OnNodeExpand = "clientOnNodeExpand", _
             .OnNodeDragging = "clientOnNodeDragging", _
             .OnNodeDragStart = "clientOnNodeDragStart", _
             .OnNodeDrop = "clientOnNodeDrop", _
             .OnNodeMouseOut = "clientOnNodeMouseOut", _
             .OnNodeMouseOver = "clientOnNodeMouseOver", _
             .OnNodeSelect = "clientOnNodeSelect", _
             .CssClass = "vista", _
             .Width = 200 _
            }
            Dim nodeLib As New Node() With { _
             .Text = "Libraries", _
             .Expanded = True, _
             .ImageUrl = "img/library.png" _
            }

            Dim nodeDoc As New Node() With { _
             .Text = "Documents", _
             .ImageUrl = "img/document.png" _
            }
            nodeDoc.ChildNodes.Add(New Node() With { _
             .Text = "My Documents", _
             .ImageUrl = "img/mydocuments.png" _
            })
            nodeDoc.ChildNodes.Add(New Node() With { _
             .Text = "Public Documents", _
             .ImageUrl = "img/folder.png" _
            })

            nodeLib.ChildNodes.Add(nodeDoc)

            Dim nodeMus As New Node() With { _
             .Text = "Music", _
             .ImageUrl = "img/music.png", _
             .Expanded = True _
            }
            nodeMus.ChildNodes.Add(New Node() With { _
             .Text = "My Music", _
             .ImageUrl = "img/mymusic.png" _
            })
            nodeMus.ChildNodes.Add(New Node() With { _
             .Text = "Public Music", _
             .ImageUrl = "img/folder.png" _
            })
            nodeLib.ChildNodes.Add(nodeMus)

            Dim nodePic As New Node() With { _
             .Text = "Pictures", _
             .ImageUrl = "img/picture.png", _
             .Expanded = True _
            }
            nodePic.ChildNodes.Add(New Node() With { _
             .Text = "My Pictures", _
             .ImageUrl = "img/mypicture.png" _
            })
            nodePic.ChildNodes.Add(New Node() With { _
             .Text = "Public Pictures", _
             .ImageUrl = "img/folder.png" _
            })
            nodeLib.ChildNodes.Add(nodePic)

            Dim nodeVid As New Node() With { _
             .Text = "Videos", _
             .ImageUrl = "img/video.png", _
             .Expanded = True _
            }
            nodeVid.ChildNodes.Add(New Node() With { _
             .Text = "My Videos", _
             .ImageUrl = "img/my_video.png" _
            })
            nodeVid.ChildNodes.Add(New Node() With { _
             .Text = "Public Videos", _
             .ImageUrl = "img/folder.png" _
            })
            nodeLib.ChildNodes.Add(nodeVid)

            Me.obClassicTree.Nodes.Add(nodeLib)

            Me.TreePlaceHolder.Controls.Add(obClassicTree)
        End Sub
        Private Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
            'Bind the treeview
            obClassicTree.DataBind()
            'Expand first root node!
            obClassicTree.Nodes(0).Expanded = True
        End Sub

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
            background: url("img/log.png") no-repeat;
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
            var chk = document.getElementById('<%=Me.chk_OnBeforeNodeEdit.ClientID %>');
            if (chk.checked) {
                addLogEntry("'OnBeforeNodeEdit' event is fired on '" + sender.getNodeText(args.node) + "'");
            }
        }
        //Event will get fired on after editing a node
        function clientOnNodeEdit(sender, args) {
            var chk = document.getElementById('<%=Me.chk_OnNodeEdit.ClientID %>');
            if (chk.checked) {
                addLogEntry("'OnNodeEdit' : '" + args.text + "' is renamed as '" + args.newText + "'");
            }
        }
        //Event will get fired while node is collapsed
        function clientOnNodeCollapse(sender, args) {
            var chk = document.getElementById('<%=Me.chk_OnNodeCollapse.ClientID %>');
            if (chk.checked) {
                addLogEntry("'OnNodeCollapse' event is fired on '" + sender.getNodeText(args.node) + "'");
            }
        }
        //Event will get fired while node is expanded
        function clientOnNodeExpand(sender, args) {
            var chk = document.getElementById('<%=Me.chk_OnNodeExpand.ClientID %>');
            if (chk.checked) {
                addLogEntry("'OnNodeExpand' event is fired on '" + sender.getNodeText(args.node) + "'");
            }
        }
        //Event will get fired while a node is dragging
        function clientOnNodeDragging(sender, args) {
            var chk = document.getElementById('<%=Me.chk_OnNodeDragging.ClientID %>');
            if (chk.checked) {
                addLogEntry("'OnNodeDragging' event is fired on '" + sender.getNodeText(args.sourceNode) + ". Mouse at (" + args._event.clientX + ',' + args._event.clientY + ")'");
            }
        }
        //Event will get fired on before a node is dragged
        function clientOnNodeDragStart(sender, args) {
            var chk = document.getElementById('<%=Me.chk_OnNodeDragStart.ClientID %>');
            if (chk.checked) {
                addLogEntry("'OnNodeDragStart' event is fired on '" + sender.getNodeText(args.sourceNode) + "'");

            }
        }
        //Event will get fired while a node is dropped
        function clientOnNodeDrop(sender, args) {
            var chk = document.getElementById('<%=Me.chk_OnNodeDrop.ClientID %>');
            if (chk.checked) {
                if (sender.isNode(args.target)) {
                    addLogEntry("'OnNodeDrop' event is fired. Source Node : '" + sender.getNodeText(args.sourceNode) + "',  Target Node : '" + sender.getNodeText(args.target) + "'");
                }
            }
            args.cancel = !confirm("Are you sure to continue?If yes, Postback will occur and the log will be cleared!");

        }
        //Event will get fired while a mouse is hovered on a node
        function clientOnNodeMouseOut(sender, args) {
            var chk = document.getElementById('<%=Me.chk_OnNodeMouseOut.ClientID %>');
            if (chk.checked) {
                addLogEntry("'OnNodeMouseOut' event is fired on '" + sender.getNodeText(args.node) + "'");
            }
        }
        //Event will get fired while a node is selected
        function clientOnNodeMouseOver(sender, args) {
            var chk = document.getElementById('<%=Me.chk_OnNodeMouseOver.ClientID %>');
            if (chk.checked) {
                addLogEntry("'OnNodeMouseOver' event is fired on '" + sender.getNodeText(args.node) + "'");
            }
        }
        //Event will get fired while a mouse is hovered out on a node
        function clientOnNodeSelect(sender, args) {
            var chk = document.getElementById('<%=Me.chk_OnNodeSelect.ClientID %>');
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
