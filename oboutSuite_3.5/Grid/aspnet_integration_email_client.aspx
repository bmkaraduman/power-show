<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>

<%@ Page Language="c#" Inherits="OboutInc.oboutAJAXPage" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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


        ShowErrorsAtClient = false;
    }
</script>
<html>
<head runat="server">
    <style>
        .Text
        {
            background-color: white;
            font-size: 12px;
        }
        .inputButton
        {
            border: 1px solid #6B89AF;
            width: 250px;
        }
        body
        {
            font-family: Tahoma;
            font-size: 8pt;
        }
        .pointer
        {
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <script type="text/javascript">
        function clientNodeSelect(sender, args) {
            var id = args.node.id;
            if (id == null || id == "")
                return;
            EmailclientLoad(id);
        }
        function pageLoad(sender, args) {
            var tree = $find("<%=ObTree.ClientID %>");
            var node = tree.getNode("a0_2");
            $find("<%=ObTree.ClientID %>").setSelected(node);
            EmailclientLoad('a0_2');
        }
    </script>
    <br />
    <span class="tdText"><b>ASP.NET Grid - As E-Mail Client</b></span>
    <br />
    <br />
    <div style="height: 53px; background-image: url('images/header.gif'); border-right: 1px solid gray;
        border-left: 1px solid gray;">
        <img src="resources/images/header_buttons.gif" />
    </div>
    <obspl:Splitter CookieDays="0" ID="sp1" runat="server" StyleFolder="../Splitter/styles/default">
        <LeftPanel WidthMin="100" WidthMax="400" WidthDefault="180">
            <Content>
                <div style="padding-left: 10px; padding-top: 10px; padding-right: 10px;">
                    <obout:Tree ID="ObTree" runat="server" OnNodeSelect="clientNodeSelect">
                    </obout:Tree>
                </div>
                </div>
            </Content>
        </LeftPanel>
        <RightPanel>
            <Content>
                <obspl:HorizontalSplitter CookieDays="0" ID="sp2" runat="server" StyleFolder="../Splitter/styles/default">
                    <TopPanel HeightMin="100" HeightMax="600" HeightDefault="250">
                        <Content>
                        </Content>
                    </TopPanel>
                    <BottomPanel>
                        <Content>
                        </Content>
                    </BottomPanel>
                </obspl:HorizontalSplitter>
            </Content>
            <Footer Height="0">
            </Footer>
        </RightPanel>
    </obspl:Splitter>
    </form>
</body>
</html>
<script>


    // load, specified by param, an email category
    function EmailclientLoad(CategoryID) {
        CategoryID = CategoryID.replace("a0_", "");
        CategoryID = CategoryID.replace("a1_", "");

        if (isNaN(CategoryID))
            CategoryID = 0;

        sp2.loadPage("TopContent", "aspnet_integration_email_client_list.aspx?CategoryID=" + CategoryID);
    }
   
</script>
