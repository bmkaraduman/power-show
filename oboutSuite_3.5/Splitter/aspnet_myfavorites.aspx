<%@ Page Language="C#" %>

<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_NET" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script language="C#" runat="server">
    void Page_Load(object sender, EventArgs e)
    {

        Node rootNode = new Node() { Text = "My Favorites!", ImageUrl = "../Treeview/icons/folder.gif", Expanded = true };
        ObTree.Nodes.Add(rootNode);

        Node child1 = new Node() { Text = "Microsoft",Expanded=true, ImageUrl = "../Treeview/icons/category.gif", Value = "http://www.microsoft.com" };
        rootNode.ChildNodes.Add(child1);

        child1.ChildNodes.Add(new Node() { Text = "About Microsoft", ImageUrl = "../Treeview/icons/category.gif", Value = "http://www.microsoft.com/about/default.mspx" });
        child1.ChildNodes.Add(new Node() { Text = "Download Center", ImageUrl = "../Treeview/icons/category.gif", Value = "http://www.microsoft.com/downloads/Search.aspx?displaylang=en" });
        child1.ChildNodes.Add(new Node() { Text = "Windows Mobile", ImageUrl = "../Treeview/icons/category.gif", Value = "http://www.microsoft.com/downloads/Browse.aspx?displaylang=en&productID=7C1FA894-B2C5-41BE-8D97-E145DD2A883B" });
        child1.ChildNodes.Add(new Node() { Text = "Office", ImageUrl = "../Treeview/icons/category.gif", Value = "http://www.microsoft.com/downloads/Browse.aspx?displaylang=en&productID=4289AE77-4CBA-4A75-86F3-9FF96F68E491" });
        child1.ChildNodes.Add(new Node() { Text = "MSN", ImageUrl = "../Treeview/icons/category.gif", Value = "http://www.microsoft.com/downloads/Browse.aspx?displaylang=en&productID=BEAE32B8-4A67-4F78-BF4E-C114F922F1EA" });
        child1.ChildNodes.Add(new Node() { Text = "Developer Tools", ImageUrl = "../Treeview/icons/category.gif", Value = "http://www.microsoft.com/downloads/Browse.aspx?displaylang=en&productID=C0037913-9E11-4A2D-8FD1-0BA441296CBC" });

        Node child2 = new Node() { Text = "ebay", ImageUrl = "../Treeview/icons/category.gif", Value = "http://www.ebay.com" };
        rootNode.ChildNodes.Add(child2);

        child2.ChildNodes.Add(new Node() { Text = "Antiques", ImageUrl = "../Treeview/icons/category.gif", Value = "http://antiques.ebay.com" });
        child2.ChildNodes.Add(new Node() { Text = "Books", ImageUrl = "../Treeview/icons/category.gif", Value = "http://books.ebay.com" });
        child2.ChildNodes.Add(new Node() { Text = "Accessories", ImageUrl = "../Treeview/icons/category.gif", Value = "http://clothing.ebay.com" });

      
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
    </style>
</head>
<body>
    <form id="Form1" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <script type="text/javascript">
        function clientNodeSelect(sender, args) {
            Splitter1.loadPage("RightContent", sender.getNodeValue(args.node))
        }
    </script>
    <br />
    <span class="tdText"><b>ASP.NET Splitter - My Favorites </b></span>
    <br />
    <br />
    <a style="font-size: 10pt; font-family: Tahoma" href="Default.aspx?type=ASPNET">« Back
        to examples</a>
    <br />
    <br />
    <obspl:Splitter StyleFolder="styles/default" CollapsePanel="left" ID="Splitter1"
        runat="server">
        <LeftPanel WidthMin="190" WidthMax="300" WidthDefault="250">
            <Header Height="50">
                <div style="width: 100%; height: 100%; padding-left: 10px">
                    <br />
                </div>
            </Header>
            <Content>
                <div style="margin: 5px">
                    <obout:Tree ID="ObTree" runat="server" OnNodeSelect="clientNodeSelect">
                    </obout:Tree>
                </div>
            </Content>
        </LeftPanel>
        <RightPanel>
            <Content Url="http://www.microsoft.com/">
                right content <a href="javascript:execute()">execute</a>
            </Content>
        </RightPanel>
    </obspl:Splitter>
    </form>
</body>
</html>
