<%@ Page Language="C#" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Types of Expand Mode</title>
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

    <script language="C#" runat="server"> 
        Tree ObTree_Client, ObTree_Server, ObTree_Callback = null;
        void Page_Init(object sender, EventArgs e)
        {

            ObTree_Client = new Tree()
                       {
                           ID = "ObTreeClient",
                           CssClass = "vista",
                           Width = 150
                       };

            Node root1 = new Node("Node 0");
            ObTree_Client.Nodes.Add(root1);

            Node parent1 = new Node("Node 00");
            root1.ChildNodes.Add(parent1);

            parent1.ChildNodes.Add(new Node("Node 000"));


            ObTree_Server = new Tree()
            {
                ID = "ObTreeServer",
                CssClass = "vista",
                Width = 150
            };

            Node root2 = new Node("Node 0") { ExpandMode = NodeExpandMode.ServerSide };
            ObTree_Server.Nodes.Add(root2);

            Node parent2 = new Node("Node 00") { ExpandMode = NodeExpandMode.ServerSide };
            root1.ChildNodes.Add(parent2);

            parent2.ChildNodes.Add(new Node("Node 000") { ExpandMode = NodeExpandMode.ServerSide });

            ObTree_Callback = new Tree()
            {
                ID = "ObTreeCallback",
                CssClass = "vista",
                Width = 150
            };

            Node root3 = new Node("Node 0") { ExpandMode = NodeExpandMode.ServerSideCallback };
            ObTree_Callback.Nodes.Add(root3);

            Node parent3 = new Node("Node 00") { ExpandMode = NodeExpandMode.ServerSideCallback };
            root3.ChildNodes.Add(parent3);

            parent3.ChildNodes.Add(new Node("Node 000") { ExpandMode = NodeExpandMode.ServerSideCallback });

            this.ClientTreePlaceHolder.Controls.Add(ObTree_Client);
            this.ServerTreePlaceHolder.Controls.Add(ObTree_Server);
            this.CallbackTreePlaceHolder.Controls.Add(ObTree_Callback);

        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <br />
		<a class="examples" href="Default.aspx?type=ASPNET">« Back to examples</a>
		<br />
     <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <h2>
        ASP.NET TreeView - Types of Expand Mode</h2>
    When the ExpandMode property is set to,
    <ul>
        <li>ClientSide, this will expand the child nodes in the client itself.</li>
        <li>ServerSide, this will trigger a postback to load child nodes on demand.</li>
        <li>ServerSideCallback, this will trigger asyncronous postback to load child nodes on
            demand.</li>
    </ul>
    <table class="td_sample" cellspacing="15">
        <tr class="header">
            <td>
                Client Side
            </td>
            <td>
                Server-Side
            </td>
            <td>
                Server-Side Callback
            </td>
        </tr>
        <tr>
            <td>
                <asp:PlaceHolder ID="ClientTreePlaceHolder" runat="server"></asp:PlaceHolder>
            </td>
            <td>
                <asp:PlaceHolder ID="ServerTreePlaceHolder" runat="server"></asp:PlaceHolder>
            </td>
            <td>
                <asp:PlaceHolder ID="CallbackTreePlaceHolder" runat="server"></asp:PlaceHolder>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
