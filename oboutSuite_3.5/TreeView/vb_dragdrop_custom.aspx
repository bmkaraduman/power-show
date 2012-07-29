<%@ Page Language="VB" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
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

    

    <script language="VB" runat="server"> 
      Private ObTree As Tree = Nothing
		Private Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)

            ObTree = New Tree() With {.ID = "ObClassicTree", .OnNodeDragging = "ClientOnNodeDrag", .CssClass = "vista", .EnableDragAndDrop = True}
			Dim nodeCDrive As New Node() With {.Text = "Local Disk (C:)", .AllowDrop = False, .Expanded = True, .ImageUrl = "img/folder.png"}
			ObTree.Nodes.Add(nodeCDrive)

			Dim nodeDocSetngs As New Node() With {.Text = "Documents and Settings", .AllowDrop = False, .ImageUrl = "img/folder.png"}
			nodeCDrive.ChildNodes.Add(nodeDocSetngs)

			nodeDocSetngs.ChildNodes.Add(New Node() With {.Text = "All Users", .ImageUrl = "img/folder.png"})

			nodeDocSetngs.ChildNodes.Add(New Node() With {.Text = "Guest", .ImageUrl = "img/folder.png"})
			nodeDocSetngs.ChildNodes.Add(New Node() With {.Text = "Home", .ImageUrl = "img/folder.png"})

			Dim nodeSuite As New Node() With {.Text = "oboutSuite", .Expanded = True, .ImageUrl = "img/folder.png"}
			nodeCDrive.ChildNodes.Add(nodeSuite)
         nodeSuite.ChildNodes.Add(New Node() With {.Text = "AJAX Page", .ImageUrl = "img/folder.png"})
			nodeSuite.ChildNodes.Add(New Node() With {.Text = "App_Code", .ImageUrl = "img/folder.png"})
			nodeSuite.ChildNodes.Add(New Node() With {.Text = "App_Data", .ImageUrl = "img/folder.png"})
			nodeSuite.ChildNodes.Add(New Node() With {.Text = "Bin", .ImageUrl = "img/folder.png"})
			nodeSuite.ChildNodes.Add(New Node() With {.Text = "ComboBox", .ImageUrl = "img/folder.png"})
			nodeSuite.ChildNodes.Add(New Node() With {.Text = "Grid", .ImageUrl = "img/folder.png"})
			nodeSuite.ChildNodes.Add(New Node() With {.Text = "TreeView", .ImageUrl = "img/folder.png"})

			Dim nodeProgFiles As New Node() With {.Text = "Program Files", .AllowDrop = False, .ImageUrl = "img/folder.png"}
			nodeCDrive.ChildNodes.Add(nodeProgFiles)

			nodeProgFiles.ChildNodes.Add(New Node() With {.Text = "Common Files", .ImageUrl = "img/folder.png"})
			nodeProgFiles.ChildNodes.Add(New Node() With {.Text = "Internet Explorer", .ImageUrl = "img/folder.png"})
			nodeProgFiles.ChildNodes.Add(New Node() With {.Text = "Microsoft", .ImageUrl = "img/folder.png"})

			Me.TreePlaceHolder.Controls.Add(ObTree)
		End Sub
    </script>

</head>
<body>
    <form id="form1" runat="server"><br />
		<a class="examples" href="Default.aspx?type=ASPNET">« Back to examples</a>
		<br /> <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />

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
        <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
    </div>
    </form>
</body>
</html>
