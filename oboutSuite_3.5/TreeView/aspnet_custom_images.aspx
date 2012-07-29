<%@ Page Language="C#" %>

<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.TreeView" tagprefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Customizing TreeView Images</title>

    <script language="C#" runat="server">
        void Page_load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EnableNodeExpColLeafImages(true);
            }
        }
        void EnableNodeImage(bool flag)
        {
            foreach (Node node in this.ObTree.Nodes)
            {
                if (flag)
                    node.ImageUrl = "img/info.png";
                else
                    node.ImageUrl = string.Empty;
                if (node.ChildNodes.Count > 0)
                {
                    SetNodeImage(node, flag);
                }
            }
        }
        void SetNodeImage(Node node, bool flag)
        {
            foreach (Node chidlNode in node.ChildNodes)
            {
                if (flag)
                    chidlNode.ImageUrl = "img/info.png";
                else
                    chidlNode.ImageUrl = string.Empty;
                if (chidlNode.ChildNodes.Count > 0)
                {
                    SetNodeImage(chidlNode, flag);
                }
            }
        }
        void EnableNodeExpColLeafImages(bool flag)
        {
            if (flag)
            {
                this.ObTree.ExpandImageUrl = "img/exp_msn.gif";
                this.ObTree.CollapseImageUrl = "img/col_msn.gif";
                this.ObTree.LeafNodeImageUrl = "img/leaf_msn.gif";
            }
            else
            {
                this.ObTree.ExpandImageUrl = this.ObTree.CollapseImageUrl = this.ObTree.LeafNodeImageUrl = String.Empty;
            }
        }
        protected void chk_enableImages_CheckedChanged(object sender, EventArgs e)
        {
            EnableNodeExpColLeafImages(chk_enableLeaf.Checked);
            //Use node 'ImageUrl' property to enable the node images
            EnableNodeImage(chk_enableImg.Checked);
        }
   
    </script>

    <style type="text/css">
        body
        {
            font-family: "Segoe UI" ,Arial,sans-serif;
            font-size: 12px;
        }
        .msn_root_node
        {
            font-family: Verdana;
            font-size: 8pt;
            font-weight: bold;
            color: #0A246A;
        }
        .msn_selected .textcont
        {
            color: White;
            background-color: #0A246A;
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
    <div>
        <h2>
            ASP.NET TreeView - Customizing TreeView Images</h2>
        <p>
            You can use custom images to indicate an expandable node, a collapsible node, or
            a leaf node that does not expand or collapse. Also each node can have an image which
            is rendered to the left of the node text.
        </p>
        <table class="tb_sample">
            <tr>
                <td>
                    <obout:Tree ID="ObTree" runat="server" Width="200px" EnableViewState="false">
                        <RootNodeStyle NodeCSS="msn_root_node" />
                        <Nodes>
                            <obout:Node Expanded="true" Text="All Contacts (3/3)" SelectMode="Expand">
                                <obout:Node Text="Nancy Davolio">
                                </obout:Node>
                                <obout:Node Text="Janet Liverling">
                                </obout:Node>
                                <obout:Node Text="Margaret Peacock">
                                </obout:Node>
                            </obout:Node>
                            <obout:Node Expanded="true" Text="Home (1/1)" SelectMode="Expand">
                                <obout:Node Text="Andrew Fuller">
                                </obout:Node>
                            </obout:Node>
                            <obout:Node Expanded="true" Text="Office (2/2)" SelectMode="Expand">
                                <obout:Node Text="Laura Callahan">
                                </obout:Node>
                                <obout:Node Text="Steven Buchanan">
                                </obout:Node>
                            </obout:Node>
                        </Nodes>
                    </obout:Tree>
                </td>
                <td>
                    <asp:CheckBox ID="chk_enableLeaf" Text=" Enable Custom Expanded/Collapsed/Leaf Node Images"
                        AutoPostBack="true" Checked="true" OnCheckedChanged="chk_enableImages_CheckedChanged"
                        runat="server" />
                    <p>
                    </p>
                    <asp:CheckBox ID="chk_enableImg" Text=" Enable Custom Node Image" AutoPostBack="true"
                        OnCheckedChanged="chk_enableImages_CheckedChanged" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
