<%@ Page Language="C#" %>

<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="Obout.Ajax.UI.TreeView" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Performance</title>
    <script language="C#" runat="server">        
        void Page_load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.LoadDirectory(Request.PhysicalApplicationPath, this.OboutTree);
            }
        }
        private void LoadDirectory(string path, object parent)
        {
            DirectoryInfo dir = new DirectoryInfo(path);
            foreach (var subDir in dir.GetDirectories())
            {
                Node newNode = new Node()
                {
                    Text = subDir.Name,
                    Value = subDir.FullName,
                    ExpandMode = Obout.Ajax.UI.TreeView.NodeExpandMode.ServerSideCallback,
                    ImageUrl = "img/folder.png"
                };
                if (parent is Node)
                    (parent as Node).ChildNodes.Add(newNode);
                else if (parent is Tree)
                    (parent as Tree).Nodes.Add(newNode);
            }
            foreach (var file in dir.GetFiles("*.aspx"))
            {
                Node newNode = new Node()
                {
                    Text = file.Name,
                    Value = file.FullName,
                    ExpandMode = Obout.Ajax.UI.TreeView.NodeExpandMode.ClientSide,
                    ImageUrl = "img/document.png"
                };
                if (parent is Node)
                    (parent as Node).ChildNodes.Add(newNode);
                else if (parent is Tree)
                    (parent as Tree).Nodes.Add(newNode);
            }

        }

        protected void OboutTree1_TreeNodeExpanded(object sender, Obout.Ajax.UI.TreeView.NodeEventArgs e)
        {
            this.LoadDirectory(e.Node.Value, e.Node);
        }
    </script>
    <style type="text/css">
        body
        {
            font-family: "Segoe UI" ,Arial,sans-serif;
            font-size: 12px;
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
        ASP.NET TreeView - File Browser Sample</h2>
    <table width="95%">
        <tr>
            <td>
                <obout:Tree ID="OboutTree" runat="server" ClientObjectID="_OboutTree" CssClass="vista"
                    OnTreeNodeExpanded="OboutTree1_TreeNodeExpanded" Width="300px">
                </obout:Tree>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
