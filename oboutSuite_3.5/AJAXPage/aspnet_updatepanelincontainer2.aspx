<%@ Page Language="C#" AspCompat="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage" %>

<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<script language="C#" runat="server">
    void Page_Load(object sender, EventArgs e)
    {
        Node rootNode = new Node() { Text = "obout.com (a0)", Expanded = true };
        ObTree.Nodes.Add(rootNode);

        Node child1 = new Node() { Text = "ASP TreeView (a1)", Expanded = true };
        rootNode.ChildNodes.Add(child1);

        child1.ChildNodes.Add(new Node() { Text = "Fast (a2)" });
        child1.ChildNodes.Add(new Node() { Text = "Easy (a3)" });

        rootNode.ChildNodes.Add(new Node() { Text = "Links & Notes since 1998 (a4)", ImageUrl = "../Treeview/icons/BookY.gif" });
        rootNode.ChildNodes.Add(new Node() { Text = "MemoBook.com (a5)", ImageUrl = "../Treeview/icons/ball_glass_blueS.gif" });        
    }
	
</script>
<html>
<head runat="server">
    <style>
        .title
        {
            font-size: X-Large;
            padding: 20px;
            border-bottom: 2px solid gray;
            width: 100%;
        }
    </style>
</head>
<body>
    <form runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <table border="0">
        <tr>
            <td valign="top" width="630" colspan="4">
                <span class="title">Callback Panel - UpdatePanelInContainer</span><br />
                <br />
                <br />
            </td>
        </tr>
    </table>
    <table style="width: 700px">
        <tr>
            <td style="width: 50%" valign="top">
                <b style="font-size: 12px">CallbackPanel</b>
                <oajax:CallbackPanel runat="server" ID="postbackPanelTreeView">
                    <Content Style="height: 100px; border: gray 1px solid; background-color: #EFEFEF;">
                         <obout:Tree ID="ObTree" runat="server" >
                                        </obout:Tree>
                    </Content>
                </oajax:CallbackPanel>
            </td>
            <td valign="top">
                <b style="font-size: 12px">div container</b>
                <div id="treeviewContainer" style="border: 1px solid red; height: 100px;">
                    <br />
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
                <input type="button" id="button4" onclick="ob_post.UpdatePanelInContainer('postbackPanelTreeView', 'treeviewContainer');"
                    value="Update this Panel in container"></input>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <a style="font-family: Tahoma; font-size: 12px" href="Default.aspx?type=ASPNET">« Back
        to examples</a>
    </form>
</body>
</html>
