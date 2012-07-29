<%@ Page Language="C#" %>

<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.TreeView" tagprefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - External Drag & drop </title>

    <script language="C#" runat="server">
   
        protected void ObTree_TreeNodeDrop(object sender, Obout.Ajax.UI.TreeView.NodeDropEventArgs e)
        {
            serverImage.ImageUrl = String.Format("{0}", e.SourceNode.Value);
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
        function onClientNodeDrop(sender, args) {
            if (args.target == null) {
                return;
            }
            var handled = false;
            switch (args.target.id) {
                case "dropImg":
                    handled = true;
                    args.target.src = sender.getNodeValue(args.sourceNode);
                    break;
                case "dropTextBox":
                    args.target.value = args.sourceNode.innerText ? args.sourceNode.innerText : args.sourceNode.textContent;
                    handled = true;
                    break;
                case "dropTextArea":
                    args.target.value += 'Name :' + (args.sourceNode.innerText ? args.sourceNode.innerText : args.sourceNode.textContent) + '; Url :' + sender.getNodeValue(args.sourceNode) + '\n';
                    handled = true;
                    break;
            }
            RemoveCSS();
            args.cancel = handled;
        }
        var currentTarget = null;
        function onClientNodeDrag(sender, args) {
            RemoveCSS();
            if (args.target.tagName == "INPUT" || args.target.tagName == "TEXTAREA") {
                currentTarget = args.target;
                args.target.style.backgroundColor = 'silver';
            }
            else if (args.target.tagName == "IMG") {
                currentTarget = args.target;
                setOpacity(args.target, 5);
            }
        }
        function RemoveCSS() {
            if (currentTarget != null) {
                if (currentTarget.tagName == "INPUT" || currentTarget.tagName == "TEXTAREA") {
                    currentTarget.style.backgroundColor = 'white';
                }
                else if (currentTarget.tagName == "IMG") {
                    setOpacity(currentTarget, 10);
                }
            }
        }
        function setOpacity(ele, value) {
            ele.style.opacity = value / 10;
            ele.style.filter = 'alpha(opacity=' + value * 10 + ')';
        }

      
    </script>
    <h2>
        ASP.NET TreeView - Drag and drop in external controls
    </h2>
    <p>
        Drag and drop the nodes over HTML and Server control...</p>
    <obout:Tree ID="ObTree" BorderWidth="1" ClientObjectID="obTree1" OnTreeNodeDrop="ObTree_TreeNodeDrop"
        OnNodeDrop="onClientNodeDrop" OnNodeDragging="onClientNodeDrag" NodeDropTargets="Panel;dropTextBox;dropTextArea;dropImg"
        EnableDragAndDrop="true" runat="server" Width="250px">
        <Nodes>
            <obout:Node Text="Images" Expanded="true">
                <obout:Node Text="Nature 1" Value="img/nature/nature1.jpg">
                </obout:Node>
                <obout:Node Text="Nature 2" Value="img/nature/nature2.jpg">
                </obout:Node>
                <obout:Node Text="Nature 3" Value="img/nature/nature3.jpg">
                </obout:Node>
                <obout:Node Text="Nature 4" Value="img/nature/nature4.jpg">
                </obout:Node>
            </obout:Node>
        </Nodes>
    </obout:Tree>
    <table class="tb_sample">
        <tr>
            <td>
                <b>Server Controls</b><hr />
                Panel<br />
                <asp:Panel ID="Panel" runat="server">
                    <asp:Image ID="serverImage" ImageUrl="img/Nature/noimage.jpg" runat="server" />
                </asp:Panel>
            </td>
            <td>
                <b>HTML controls</b>
                <hr />
                TextBox
                <br />
                <input id="dropTextBox" type="text" />
                <br />
                <br />
                TextArea
                <br />
                <textarea id="dropTextArea" cols="20" rows="7" style="width: 100%;"></textarea>
                <br />
                <br />
                Image
                <br />
                <img id="dropImg" alt="image" src="img/Nature/noimage.jpg" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
