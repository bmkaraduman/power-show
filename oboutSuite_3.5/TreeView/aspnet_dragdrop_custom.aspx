<%@ Page Language="C#" %>

<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.TreeView" tagprefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Customized Drag and drop</title>
    <style type="text/css">
        body
        {
            font-family: "Segoe UI" ,Arial,sans-serif;
            font-size: 12px;
        }
        .customDrag
        {
            z-index: 9999;
            position: absolute;
            margin-left: 10px;
            margin-top: -102px;
        }
        .message
        {
            background-image: url('img/msg_bg.png');
            border: solid 1px #767676;
            margin-top: 4px;
            margin-left: 10px;
            display: none;
        }
        .message *
        {
            line-height: 16px;
            vertical-align: middle;
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
        function pageLoad(sender, args) {
            Obout.Ajax.UI.TreeView.DragDropHandler._createDragEle = function() {
                var container = Obout.Ajax.UI.TreeView.DragDropHandler.dragVisual = document.createElement("div");

                var img = document.createElement("IMG");
                img.src = "img/dragEle.png";
                img.style.height = "107px";
                img.style.width = "107px";
                setOpacity(img, 5);

                var msg = document.createElement("div");
                msg.className = 'message';
                var msg_img = document.createElement("IMG");
                msg_img.src = "img/allow.png";
                msg.appendChild(msg_img);
                var msg_span = document.createElement("SPAN");
                msg.appendChild(msg_span);

                container.className = Obout.Ajax.UI.TreeView.DragDropHandler.owner.get_element().className;

                Obout.Ajax.UI.TreeView.Helper.addToClassName(container, "customDrag");

                container.style.display = "none";
                container.appendChild(img);
                container.appendChild(msg);
                document.body.appendChild(container);
            }
        }
        function setOpacity(ele, value) {
            ele.style.opacity = value / 10;
            ele.style.filter = 'alpha(opacity=' + value * 10 + ')';
        }
        function ClientOnNodeDrag(sender, args) {
            var msg = Obout.Ajax.UI.TreeView.DragDropHandler.dragVisual.childNodes[1];
            var parent = args.target.parentNode;
            if (parent != null && sender.isNode(parent)) {
                msg.style.display = 'block';
                if (sender.isDropDisabled(parent) || args.sourceNode == parent) {
                    msg.childNodes[0].src = "img/deny.png";
                    msg.childNodes[1].innerHTML = "Cannot move to " + sender.getNodeText(parent);
                }
                else {
                    msg.childNodes[0].src = "img/allow.png";
                    msg.childNodes[1].innerHTML = "Move to " + sender.getNodeText(parent);
                }

            }
            else {
                msg.style.display = 'none';
            }
        }
    </script>
    <h2>
        ASP.NET TreeView -Customized Drag and drop
    </h2>
    <p>
        Visual drag style is customized as like Vista theme. Refer the code snippets for
        more details...</p>
    <div>
        <obout:Tree ID="ObClassicTree" OnNodeDragging="ClientOnNodeDrag" ClientObjectID="obTree1"
            CssClass="vista" EnableDragAndDrop="true" runat="server">
            <Nodes>
                <obout:Node Text="Local Disk (C:)" AllowDrop="false" Expanded="true" ImageUrl="img/folder.png">
                    <obout:Node Text="Documents and Settings" AllowDrop="false" ImageUrl="img/folder.png">
                        <obout:Node Text="All Users" ImageUrl="img/folder.png">
                        </obout:Node>
                        <obout:Node Text="Guest" ImageUrl="img/folder.png">
                        </obout:Node>
                        <obout:Node Text="Home" ImageUrl="img/folder.png">
                        </obout:Node>
                    </obout:Node>
                    <obout:Node Text="oboutSuite" Expanded="true" ImageUrl="img/folder.png">
                        <obout:Node Text="AJAX Page" ImageUrl="img/folder.png">
                        </obout:Node>
                        <obout:Node Text="App_Code" ImageUrl="img/folder.png">
                        </obout:Node>
                        <obout:Node Text="App_Data" ImageUrl="img/folder.png">
                        </obout:Node>
                        <obout:Node Text="Bin" ImageUrl="img/folder.png">
                        </obout:Node>
                        <obout:Node Text="ComboBox" ImageUrl="img/folder.png">
                        </obout:Node>
                        <obout:Node Text="Grid" ImageUrl="img/folder.png">
                        </obout:Node>
                        <obout:Node Text="TreeView" ImageUrl="img/folder.png">
                        </obout:Node>
                    </obout:Node>
                    <obout:Node Text="Program Files" AllowDrop="false" ImageUrl="img/folder.png">
                        <obout:Node Text="Common Files" ImageUrl="img/folder.png">
                        </obout:Node>
                        <obout:Node Text="Internet Explorer" ImageUrl="img/folder.png">
                        </obout:Node>
                        <obout:Node Text="Microsoft" ImageUrl="img/folder.png">
                        </obout:Node>
                    </obout:Node>
                </obout:Node>
            </Nodes>
        </obout:Tree>
    </div>
    </form>
</body>
</html>
