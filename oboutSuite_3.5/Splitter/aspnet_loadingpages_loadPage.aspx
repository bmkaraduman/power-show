<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>

<%@ Page Language="C#" Debug="true" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script language="C#" runat="server">
    void Page_Load(object sender, EventArgs e)
    {

        Node rootNode = new Node() { Text = "I am Root node!", ImageUrl = "../TreeView/icons/xpPanel.gif" };
        ObTree.Nodes.Add(rootNode);

        rootNode.ChildNodes.Add(new Node() { ClientID = "r1", Text = "Obout Inc", Value = "HTMFiles/1.html" });

        Node child1 = new Node() { ClientID = "r2", Text = "Brooklyn Bridge" };
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
<head runat=server>
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
            splDV.loadPage("RightContent", sender.getNodeValue(args.node))
        }
    </script>
    <br />
    <span class="tdText"><b>ASP.NET Splitter - Open URL on click </b></span>
    <br />
    <br />
    <a style="font-size: 10pt; font-family: Tahoma" href="Default.aspx?type=ASPNET">« Back
        to examples</a>
    <br />
    <br />
    <obspl:Splitter StyleFolder="styles/default" ID="splDV" runat="server" CookieDays="0">
        <LeftPanel WidthMin="100" WidthMax="400">
            <Header Height="50">
                <div style="width: 100%; height: 100%; background-color: #ebe9ed" class="tdText"
                    align="center">
                    <br />
                </div>
            </Header>
            <Content>
                <div style="margin: 5px;">
                    <obout:Tree ID="ObTree" runat="server" OnNodeSelect="clientNodeSelect">
                    </obout:Tree>
                    <br />
                    <br />
                    <a href='javascript:splDV.loadPage("RightContent", "http://www.obout.com")'>Load obout.com</a><br />
                    <a href='javascript:splDV.loadPage("RightContent", "http://www.msn.com")'>Load msn.com</a>
                </div>
            </Content>
            <Footer Height="50">
                <div style="width: 100%; height: 100%; background-color: #ebe9ed" class="tdText"
                    align="center">
                    <br />
                    optional left footer
                </div>
            </Footer>
        </LeftPanel>
        <RightPanel>
            <Header Height="50">
                <div style="width: 100%; height: 100%; background-color: #ebe9ed" class="tdText"
                    align="center">
                    <br />
                    optional right header
                </div>
            </Header>
            <Content>
                <div style="width: 100%; height: 100%;" class="tdText" align="center">
                    <br />
                    right content
                </div>
            </Content>
            <Footer Height="50">
                <div style="width: 100%; height: 100%; background-color: #ebe9ed" class="tdText"
                    align="center">
                    <br />
                    optional right footer
                </div>
            </Footer>
        </RightPanel>
    </obspl:Splitter>
    </form>
</body>
</html>
