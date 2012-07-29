<%@ Page Language="C#" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Types of Node Selection Mode</title>

    <script language="C#" runat="server"> 
        Tree ObTreeSelect, ObTreeExpand = null;
        void Page_Init(object sender, EventArgs e)
        {

            ObTreeSelect = new Tree()
                       {
                           ID = "OboutTree1",
                           CssClass = "vista",
                           Width = 150
                       };

            Node root1 = new Node("Node 0");
            ObTreeSelect.Nodes.Add(root1);

            Node parent1 = new Node("Node 00");
            root1.ChildNodes.Add(parent1);

            parent1.ChildNodes.Add(new Node("Node 000"));

            Node root2 = new Node("Node 1");
            ObTreeSelect.Nodes.Add(root2);

            Node parent2 = new Node("Node 10");
            root2.ChildNodes.Add(parent2);

            parent2.ChildNodes.Add(new Node("Node 100"));

            ObTreeExpand = new Tree()
            {
                ID = "OboutTree2",
                CssClass = "vista",
                Width = 150
            };

            Node root3 = new Node("Node 0") {SelectMode=NodeSelectMode.Expand};
            ObTreeExpand.Nodes.Add(root3);

            Node parent3 = new Node("Node 00") { SelectMode = NodeSelectMode.Expand };
            root3.ChildNodes.Add(parent3);

            parent3.ChildNodes.Add(new Node("Node 000"));

            Node root4 = new Node("Node 1") { SelectMode = NodeSelectMode.Expand };
            ObTreeSelect.Nodes.Add(root4);

            Node parent4 = new Node("Node 10") { SelectMode = NodeSelectMode.Expand };
            root4.ChildNodes.Add(parent4);

            parent4.ChildNodes.Add(new Node("Node 100"));

            this.SelectTreePlaceHolder.Controls.Add(ObTreeSelect);
            this.ExpandTreePlaceHolder.Controls.Add(ObTreeExpand);

        }
    </script>

    <style type="text/css">
        .td_sample
        {
            width: 100%;
        }
        .td_sample td
        {
            vertical-align: top;
        }
        .td_sample tr.header
        {
            background-color: #AAC0CF;
            font-weight: bold;
            text-align: center;
        }
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
        ASP.NET TreeView - Types of Node Selection Mode</h2>
    When the SelectMode property is set to,
    <ul>
        <li>Select, this will select the node when you click the node text.</li>
        <li>Expand, this will expand the child nodes instead of node selection when you click
            the node text.</li>
    </ul>
    <table class="td_sample" cellspacing="15">
        <tr class="header">
            <td>
                Select
            </td>
            <td>
                Expand
            </td>
        </tr>
        <tr>
            <td>
                <asp:PlaceHolder ID="SelectTreePlaceHolder" runat="server"></asp:PlaceHolder>
            </td>
            <td>
                <asp:PlaceHolder ID="ExpandTreePlaceHolder" runat="server"></asp:PlaceHolder>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
