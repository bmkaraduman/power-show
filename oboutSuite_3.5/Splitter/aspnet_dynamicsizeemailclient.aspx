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

        Node rootNode = new Node() { ClientID = "a0", Text = "Personal Folders", ImageUrl = "../treeview/icons/oMailbox.gif", Expanded = true };
        ObTree.Nodes.Add(rootNode);

        rootNode.ChildNodes.Add(new Node() { ClientID = "a0_0", Text = "Deleted Items", ImageUrl = "../treeview/icons/oRecycle.gif" });
        rootNode.ChildNodes.Add(new Node() { ClientID = "a0_1", Text = "Drafts", ImageUrl = "../treeview/icons/oDrafts.gif" });
        rootNode.ChildNodes.Add(new Node() { ClientID = "a0_2", Text = "Inbox", ImageUrl = "../treeview/icons/oInbox.gif" });
        rootNode.ChildNodes.Add(new Node() { ClientID = "a0_3", Text = "Junk E-mail", ImageUrl = "../treeview/icons/oJunk.gif" });
        rootNode.ChildNodes.Add(new Node() { ClientID = "a0_4", Text = "Outbox", ImageUrl = "../treeview/icons/oOutlook.gif" });
        rootNode.ChildNodes.Add(new Node() { ClientID = "a0_5", Text = "Sent Items", ImageUrl = "../treeview/icons/oSent.gif" });

        Node child1 = new Node() { ClientID = "a0_6", Text = "Search Folders", ImageUrl = "../treeview/icons/oSearch.gif", Expanded = true };
        rootNode.ChildNodes.Add(child1);
        child1.ChildNodes.Add(new Node() { ClientID = "a0_6_0", Text = "For Follow Up", ImageUrl = "../treeview/icons/oSearchF.gif" });
        child1.ChildNodes.Add(new Node() { ClientID = "a0_6_1", Text = "Large Mail", ImageUrl = "../treeview/icons/oSearchF.gif" });
        child1.ChildNodes.Add(new Node() { ClientID = "a0_6_2", Text = "Unread Mail", ImageUrl = "../treeview/icons/oSearchF.gif" });

        Node child2 = new Node() { ClientID = "a1", Text = "mymail.com", ImageUrl = "../treeview/icons/oInboxF.gif" };
        rootNode.ChildNodes.Add(child2);
        child2.ChildNodes.Add(new Node() { ClientID = "a1_0", Text = "Inbox", ImageUrl = "../treeview/icons/oInbox.gif" });
        child2.ChildNodes.Add(new Node() { ClientID = "a1_1", Text = "Junk E-mail", ImageUrl = "../treeview/icons/oJunk.gif" });
        child2.ChildNodes.Add(new Node() { ClientID = "a1_2", Text = "Sent", ImageUrl = "../treeview/icons/oSent.gif" });
        child2.ChildNodes.Add(new Node() { ClientID = "a1_3", Text = "Trash", ImageUrl = "../treeview/icons/oSent.gif" });
    }
</script>
<html>
<head runat="server">
    <title>obout ASP.NET Splitter examples</title>
    <style type="text/css">
        .tdText
        {
            font: 11px Verdana;
            color: #333333;
        }
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
    <form id="Form1" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <script type="text/javascript">
        function clientNodeSelect(sender, args) {
            if (ob_ev("OnNodeSelect")) {
                if (typeof ob_post == "object") {
                    var id = args.node.id;
                    if (id.indexOf("a0_") != -1 || id.indexOf("a1_") != -1) {
                        // load the specified category of emails
                        EmailclientLoad(id);
                    }
                }
                else {
                    alert("Please add obout_Postback control to your page to use the server-side events");
                }
            }
        }
    </script>
    <br />
    <span class="tdText"><b>ASP.NET Splitter - Dynamic size Email Client</b></span>
    <br />
    <br />
    <a style="font-size: 10pt; font-family: Tahoma" href="Default.aspx?type=ASPNET">« Back
        to examples</a>
    <br />
    <br />
    <div style="width: 80%; height: 70%">
        <obspl:Splitter CookieDays="0" ID="sp1" runat="server" StyleFolder="styles/default2">
            <LeftPanel WidthMin="100" WidthMax="400" WidthDefault="180">
                <Header Height="40">
                    <div style="width: 100%; height: 100%; text-align: center;">
                        <br />
                    </div>
                </Header>
                <Content>
                    <div style="padding-left: 10px; padding-top: 10px; padding-right: 10px; font-family: Tahoma;
                        font-size: 8pt;">
                        <obout:Tree ID="ObTree" runat="server" OnNodeSelect="clientNodeSelect">
                        </obout:Tree>
                    </div>
                </Content>
            </LeftPanel>
            <RightPanel>
                <Content>
                    <obspl:HorizontalSplitter CookieDays="0" ID="sp2" runat="server" StyleFolder="styles/default2">
                        <TopPanel HeightMin="100" HeightMax="300" HeightDefault="150">
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
    </div>
    </form>
</body>
</html>
<script>
    // add load event
    function addLoadEvent(func) {
        var oldonload = window.onload;
        if (typeof window.onload != 'function') {
            window.onload = func;
        } else {
            window.onload = function () {
                if (oldonload) {
                    oldonload();
                }
                func();
            }
        }
    }
    // first time loading - default category selected - first email is listed in the details area
    addLoadEvent(function () {
        //document.getElementById('a0_2').onclick();
    });

    // load, specified by param, an email category
    function EmailclientLoad(CategoryID) {
        CategoryID = CategoryID.replace("a0_", "");
        CategoryID = CategoryID.replace("a1_", "");

        if (isNaN(CategoryID))
            CategoryID = 0;

        sp2.loadPage("TopContent", "aspnet_emailclient_list.aspx?CategoryID=" + CategoryID);
    }

    // implement the OnNodeSelect event that will request the information from the server
    // we redeclared the ob_OnNodeSelect function here - the other option would have been to edit
    // the ob_events_xxxx.js file located in the Script folder
    function ob_OnNodeSelect(id) {
        if (ob_ev("OnNodeSelect")) {
            if (typeof ob_post == "object") {
                if (id.indexOf("a0_") != -1 || id.indexOf("a1_") != -1) {
                    // load the specified category of emails
                    EmailclientLoad(id);
                }
            }
            else {
                alert("Please add obout_Postback control to your page to use the server-side events");
            }
        }
    }
</script>
