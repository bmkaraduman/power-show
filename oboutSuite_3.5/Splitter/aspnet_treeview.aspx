<%@ Register TagPrefix="spl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script language="C#" runat="server">
    void Page_Load(object sender, EventArgs e)
    {
        Node rootNode = new Node() { Text = "I am Root node!", ImageUrl = "../TreeView/icons/xpPanel.gif", Expanded = true };
        ObTree.Nodes.Add(rootNode);

        rootNode.ChildNodes.Add(new Node() { ClientID = "r1", Text = "Obout Inc", Value = "HTMFiles/1.html" });

        Node child1 = new Node() { ClientID = "r2", Text = "Brooklyn Bridge", Expanded = true };
        rootNode.ChildNodes.Add(child1);

        child1.ChildNodes.Add(new Node() { ClientID = "r2_0", Text = "Drawing", Value = "HTMFiles/2_1.html" });
        child1.ChildNodes.Add(new Node() { ClientID = "r2_1", Text = "Picture", Value = "HTMFiles/2_2.html" });

        Node child2 = new Node() { ClientID = "r3", Text = "Pictures" };
        rootNode.ChildNodes.Add(child2);

        child1.ChildNodes.Add(new Node() { ClientID = "r3_0", Text = "Obout Inc", Value = "HTMFiles/3_2.html" });
        child1.ChildNodes.Add(new Node() { ClientID = "r3_1", Text = "My Pictures", Value = "HTMFiles/3_1.html" });
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
        body
        {
            font-family: Verdana;
            font-size: 8pt;
        }
        .text
        {
            background-color: #ebe9ed;
            font-size: 11px;
            text-align: center;
        }
        .textContent
        {
            font-size: 11px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="Form1" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <script type="text/javascript">
        function clientNodeSelect(sender, args) {
            mySpl.loadPage("RightContent", sender.getNodeValue(args.node))
        }
    </script>
    <br />
    <span class="tdText"><b>ASP.NET Splitter - TreeView</b></span>
    <br />
    <br />
    <a style="font-size: 10pt; font-family: Tahoma" href="Default.aspx?type=ASPNET">« Back
        to examples</a>
    <br />
    <br />
    <spl:Splitter CookieDays="0" runat="server" StyleFolder="styles/default" ID="mySpl">
        <LeftPanel WidthMin="100" WidthMax="400">
            <Header Height="50">
                <div style="width: 100%; height: 100%; background-color: #ebe9ed" class="text" align="center">
                    <br />
                </div>
            </Header>
            <Content>
                <div style="margin: 5px;">
                    <obout:Tree ID="ObTree" runat="server" OnNodeSelect="clientNodeSelect">
                    </obout:Tree>
                </div>
                <br />
                <br />
                <br />
                <br />
            </Content>
            <Footer Height="50">
                <div style="width: 100%; height: 100%; background-color: #ebe9ed" class="text" align="center">
                    <br />
                    optional left footer
                </div>
            </Footer>
        </LeftPanel>
        <RightPanel>
            <Header Height="50">
                <div style="width: 100%; height: 100%; background-color: #ebe9ed" class="text" align="center">
                    <br />
                    optional right header
                </div>
            </Header>
            <Content>
                <div style="margin: 5px; background-color: white" class="text">
                    This example requires <a href="http://www.obout.com">obout TreeView</a> component
                    to be installed in default location.</div>
            </Content>
            <Footer Height="50">
                <div style="width: 100%; height: 100%; background-color: #ebe9ed" class="text" align="center">
                    <br />
                    optional right footer
                </div>
            </Footer>
        </RightPanel>
    </spl:Splitter>
    </form>
</body>
</html>
