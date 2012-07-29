<%@ Page Language="C#" %>

<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.TreeView" tagprefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Performance</title>

    <script language="C#" runat="server">
        void Page_load(object sender, EventArgs e)
        {
            PopulateTree();
        }
        private void PopulateTree()
        {
            for (int i = 0; i <= 10; i++)
            {
                Obout.Ajax.UI.TreeView.Node newNode = new Obout.Ajax.UI.TreeView.Node();
                newNode.Text = string.Format("Node {0}", i.ToString());
                newNode.Value = i.ToString();
                newNode.ExpandMode = Obout.Ajax.UI.TreeView.NodeExpandMode.ServerSideCallback;
                this.OboutTree.Nodes.Add(newNode);
            }
        }
        protected void OboutTree1_TreeNodeExpanded(object sender, Obout.Ajax.UI.TreeView.NodeEventArgs e)
        {
            for (int i = 0; i <= 50; i++)
            {
                Obout.Ajax.UI.TreeView.Node newNode = new Obout.Ajax.UI.TreeView.Node();
                newNode.Text = string.Format("{0} {1}", e.Node.Text, i.ToString());
                newNode.Value = i.ToString();
                newNode.ExpandMode = Obout.Ajax.UI.TreeView.NodeExpandMode.ServerSideCallback;
                e.Node.ChildNodes.Add(newNode);
            }
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
        ASP.NET TreeView - Performance Sample</h2>
    <table width="95%">
        <tr>
            <td>
                <h3>
                    Control Performance:</h3>
                <br />
                <obout:Tree ID="OboutTree" runat="server" ClientObjectID="_OboutTree" CssClass="vista"
                    EnableTheming="True" NodeDropTargets="" OnTreeNodeExpanded="OboutTree1_TreeNodeExpanded"
                    Height="300px" Width="200px" EnableViewState="False">
                </obout:Tree>
            </td>
            <td valign="top">
                <p>
                    Tips to get best performance with the control.
                </p>
                <ul>
                    <li><b>Disable Viewstate</b> : If 'EnableViewState' property is set to true, then control
                        needs to carry the previous state on each request. So set this property to 'False'
                        if the state maintanence is not requirred.</li>
                    <li><b>Populate nodes on-demand</b>: Use the Property, 'ExpandMode' of a node to 'ServerSideCallBack'
                        to load the nodes dynamically.</li>
                    <li><b>Avoid using custom Images</b> : Try to avoid using the Custom Images like "ExpandImageUrl","CollapseImageUrl"
                        because this will increase the size of control element markup.</li>
                </ul>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
