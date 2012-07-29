<%@ Page Language="C#" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - MSDN Style</title>
    <style type="text/css">
        body
        {
            font-family: "Segoe UI" ,Arial,sans-serif;
            font-size: 12px;
        }
    </style>

    <script language="C#" runat="server"> 
        Tree ObTree = null;
        void Page_Init(object sender, EventArgs e)
        {

            ObTree = new Tree()
                       {
                           ID = "ObClassicTree",
                           CssClass = "msdn"
                       };

            Node nodeMSDN = new Node()
            {
                Text = "Welcome to the MSDN Library",
                ExpandMode = NodeExpandMode.ServerSideCallback
            };

            ObTree.Nodes.Add(nodeMSDN);

            nodeMSDN.ChildNodes.Add(new Node("How to Use the MSDN Library Table of Contents"));

            Node nodeTools = new Node()
            {
                Text = "Development tools and languages",
                ExpandMode = NodeExpandMode.ServerSideCallback
            };
            ObTree.Nodes.Add(nodeTools);

            Node nodeVS2005 = new Node()
            {
                Text = "Visual Studio 2005",
                ExpandMode = NodeExpandMode.ServerSideCallback
            };
            nodeTools.ChildNodes.Add(nodeVS2005);

            nodeVS2005.ChildNodes.Add(new Node("Product Documentation"));

            Node nodeTech = new Node()
            {
                Text = "Technical Articles",
                ExpandMode = NodeExpandMode.ServerSideCallback
            };

            nodeVS2005.ChildNodes.Add(nodeTech);

            nodeTech.ChildNodes.Add(new Node("Visual Basic"));
            nodeTech.ChildNodes.Add(new Node("Visual C++"));
            nodeTech.ChildNodes.Add(new Node("C#"));
            nodeTech.ChildNodes.Add(new Node("Visual Studio"));

            Node nodeNET = new Node()
            {
                Text = "Visual Studio .NET",
                ExpandMode = NodeExpandMode.ServerSideCallback
            };
            nodeTools.ChildNodes.Add(nodeNET);

            nodeNET.ChildNodes.Add(new Node("Introducing Visual Studio .NET"));
            nodeNET.ChildNodes.Add(new Node("Getting Assistance"));
            nodeNET.ChildNodes.Add(new Node("Samples and Walkthroughs"));
            nodeNET.ChildNodes.Add(new Node("Developing with Visual Studio .NET"));
            nodeNET.ChildNodes.Add(new Node("Visual Basic and Visual C#"));
            nodeNET.ChildNodes.Add(new Node("Visual J#"));
            nodeNET.ChildNodes.Add(new Node("Visual C++"));
            nodeNET.ChildNodes.Add(new Node("JScript"));
            nodeNET.ChildNodes.Add(new Node("Articles and Columns"));
            nodeNET.ChildNodes.Add(new Node("Book Excerpts"));
            nodeNET.ChildNodes.Add(new Node("Periodicals"));

            nodeTools.ChildNodes.Add(new Node(".NET Framework SDK (see .NET Development)"));

            Node nodeVS6 = new Node()
            {
                ExpandMode = NodeExpandMode.ServerSideCallback,
                Text = "Visual Studio 6.0"
            };
            nodeTools.ChildNodes.Add(nodeVS6);

            nodeVS6.ChildNodes.Add(new Node("Visual Basic 6.0"));
            nodeVS6.ChildNodes.Add(new Node("Visual Basic for Applications"));
            nodeVS6.ChildNodes.Add(new Node("Visual C and C++ 6.0"));
            nodeVS6.ChildNodes.Add(new Node("Visual InterDev 6.0"));
            nodeVS6.ChildNodes.Add(new Node("Visual J++ 6.0"));
            nodeVS6.ChildNodes.Add(new Node("Visual SourceSafe 6.0"));
            nodeVS6.ChildNodes.Add(new Node("Visual Studio 6.0"));

            Node nodeFox = new Node()
            {
                ExpandMode = NodeExpandMode.ServerSideCallback,
                Text = "Visual FoxPro"
            };
            nodeTools.ChildNodes.Add(nodeFox);

            nodeFox.ChildNodes.Add(new Node("Visual FoxPro 9.0"));
            nodeFox.ChildNodes.Add(new Node("Visual FoxPro 8.0"));
            nodeFox.ChildNodes.Add(new Node("Visual FoxPro 7.0"));
            nodeFox.ChildNodes.Add(new Node("Visual FoxPro 6.0"));
            nodeFox.ChildNodes.Add(new Node("Visual FoxPro Periodicals"));

            Node nodeMobile = new Node()
            {
                Text = "Mobile and Embedded Development",
                ExpandMode = NodeExpandMode.ServerSideCallback                
            };
            ObTree.Nodes.Add(nodeMobile);

            Node nodeCompact = new Node()
            {
                Text = ".NET Compact Framework",
                ExpandMode = NodeExpandMode.ServerSideCallback
            };

            nodeMobile.ChildNodes.Add(nodeCompact);
            nodeCompact.ChildNodes.Add(new Node("Product Documentation"));
            nodeCompact.ChildNodes.Add(new Node("Technical Articles"));
            nodeCompact.ChildNodes.Add(new Node("How-To Articles"));

            Node nodeEmbed = new Node()
            {
                Text = "Embedded Operating System Development",
                ExpandMode = NodeExpandMode.ServerSideCallback
            };

            nodeMobile.ChildNodes.Add(nodeEmbed);
            nodeEmbed.ChildNodes.Add(new Node("Windows CE"));
            nodeEmbed.ChildNodes.Add(new Node("Windows XP Embedded"));
            nodeEmbed.ChildNodes.Add(new Node("Windows NT Embedded"));
            nodeEmbed.ChildNodes.Add(new Node("Server Appliance Kit"));
            nodeEmbed.ChildNodes.Add(new Node("Columns"));
            nodeEmbed.ChildNodes.Add(new Node("Downloads"));

            Node nodeMWeb = new Node()
            {
                Text = "Mobile Web Development",
                ExpandMode = NodeExpandMode.ServerSideCallback
            };

            nodeMobile.ChildNodes.Add(nodeMWeb);
            nodeMWeb.ChildNodes.Add(new Node("Documentation"));
            nodeMWeb.ChildNodes.Add(new Node("Technical Articles"));
            nodeMWeb.ChildNodes.Add(new Node("Downloads"));

            Node nodeWinMob = new Node()
            {
                Text = "Windows Mobile",
                ExpandMode = NodeExpandMode.ServerSideCallback
            };

            nodeMobile.ChildNodes.Add(nodeWinMob);

            nodeWinMob.ChildNodes.Add(new Node("Getting Started"));
            nodeWinMob.ChildNodes.Add(new Node("Product Documentation"));
            nodeWinMob.ChildNodes.Add(new Node("Technical Articles"));
            nodeWinMob.ChildNodes.Add(new Node("Book Excerpts"));
            nodeWinMob.ChildNodes.Add(new Node("Columns"));
            nodeWinMob.ChildNodes.Add(new Node("Windows Mobile 2003 second Edition"));
            nodeWinMob.ChildNodes.Add(new Node("Windows Mobile 2003"));
            nodeWinMob.ChildNodes.Add(new Node("Pocket PC and Smartphone 2002"));
            nodeWinMob.ChildNodes.Add(new Node("Pocket PC 2000"));

            Node nodeWinAuto = new Node()
            {
                Text = "Windows Automotive",
                ExpandMode = NodeExpandMode.ServerSideCallback
            };

            nodeMobile.ChildNodes.Add(nodeWinAuto);

            Node nodeAuto2 = new Node()
            {
                Text = "Windows Automotive 4.2",
                ExpandMode = NodeExpandMode.ServerSideCallback
            };
            nodeWinAuto.ChildNodes.Add(nodeAuto2);

            nodeAuto2.ChildNodes.Add(new Node("Welcome to Windows Automotive"));
            nodeAuto2.ChildNodes.Add(new Node("Using Windows Automotive"));

            nodeMobile.ChildNodes.Add(new Node("Code Samples"));
            
            this.TreePlaceHolder.Controls.Add(ObTree);

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
        ASP.NET TreeView - MSDN Style</h2>
    <table border="0">
        <tr>
            <td valign="top" class="h5" width="230px">
                Change style with one property
            </td>
            <td class="tdText" style="color: #0033cc;">
                OboutTree1.CssClass = "msdn"<br />
                &nbsp;
            </td>
        </tr>
    </table>
    <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
    </form>
</body>
</html>
