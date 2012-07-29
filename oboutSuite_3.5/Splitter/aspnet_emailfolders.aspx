<%@ Page Language="c#" Inherits="OboutInc.oboutAJAXPage" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>
<script language="C#" runat="server">
    void Page_Load(object sender, EventArgs e)
    {


        Node rootNode = new Node() { Expanded = true, Text = "Personal Folders", ClientID = "a0", ImageUrl = "../treeview/icons/oMailbox.gif" };
        ObTree.Nodes.Add(rootNode);

        rootNode.ChildNodes.Add(new Node() { Text = "Deleted Items", ClientID = "a0_0", ImageUrl = "../treeview/icons/oRecycle.gif" });
        rootNode.ChildNodes.Add(new Node() { Text = "Drafts", ClientID = "a0_1", ImageUrl = "../treeview/icons/oDrafts.gif" });
        rootNode.ChildNodes.Add(new Node() { Text = "Inbox", ClientID = "a0_2", ImageUrl = "../treeview/icons/oInbox.gif" });
        rootNode.ChildNodes.Add(new Node() { Text = "Junk E-mail", ClientID = "a0_3", ImageUrl = "../treeview/icons/oJunk.gif" });
        rootNode.ChildNodes.Add(new Node() { Text = "Outbox", ClientID = "a0_4", ImageUrl = "../treeview/icons/oOutlook.gif" });
        rootNode.ChildNodes.Add(new Node() { Text = "Sent Items", ClientID = "a0_5", ImageUrl = "../treeview/icons/oSent.gif" });

        var searchNode = new Node() { Expanded = true, Text = "Search Folders", ClientID = "a0_6", ImageUrl = "../treeview/icons/oSearch.gif" };
        rootNode.ChildNodes.Add(searchNode);

        searchNode.ChildNodes.Add(new Node() { Text = "For Follow Up", ClientID = "a0_6_0", ImageUrl = "../treeview/icons/oSearch.gif" });
        searchNode.ChildNodes.Add(new Node() { Text = "Unread Mail", ClientID = "a0_6_1", ImageUrl = "../treeview/icons/oSearch.gif" });

        var myMailNode = new Node() { Expanded = true, Text = "mymail.com", ClientID = "a1", ImageUrl = "../treeview/icons/oInboxF.gif" };
        rootNode.ChildNodes.Add(myMailNode);

        myMailNode.ChildNodes.Add(new Node() { Text = "Inbox", ClientID = "a1_0", ImageUrl = "../treeview/icons/oInbox.gif" });
        myMailNode.ChildNodes.Add(new Node() { Text = "Junk E-mail", ClientID = "a1_1", ImageUrl = "../treeview/icons/oJunk.gif" });
        myMailNode.ChildNodes.Add(new Node() { Text = "Sent", ClientID = "a1_2", ImageUrl = "../treeview/icons/oSent.gif" });
        myMailNode.ChildNodes.Add(new Node() { Text = "Trash", ClientID = "a1_3", ImageUrl = "../treeview/icons/oSent.gif" });
        myMailNode.ChildNodes.Add(new Node() { Text = "Trash", ClientID = "a1_4", NavigateUrl = "http://www.memobook.com", Target = "_blank" });

    }
</script>
<html>
<head runat="server">
</head>
<body style="padding: 0px; margin: 0px">
    <form id="form1" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <script type="text/javascript">
        function clientNodeSelect(sender, args) {
            var id = args.node.id;
            if (id == null || id == "")
                return;
            window.parent.EmailclientLoad(id);
        }
    </script>
    <div style="padding-left: 10px; padding-top: 10px; padding-right: 10px;">
        <obout:Tree ID="ObTree" runat="server" OnNodeSelect="clientNodeSelect">
                    </obout:Tree>
    </div>
    </form>
</body>
</html>
<script language="javascript">
    function pageLoad() {
        var obTree = $find("<%=ObTree.ClientID%>");
        var node = obTree.getNodeByIndex('0:2');
        obTree.setSelected(node);
    }
</script>
