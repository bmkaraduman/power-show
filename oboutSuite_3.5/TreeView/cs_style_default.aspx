<%@ Page Language="C#" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Classic Style</title>

    <script language="C#" runat="server"> 
        Tree ObTree = null;
        void Page_Init(object sender, EventArgs e)
        {

            ObTree = new Tree()
                       {
                           ID = "ObTree"
                       };

            Node nodeProd = new Node()
            {
                Text = "Products",
                Expanded = true
            };
            ObTree.Nodes.Add(nodeProd);

            Node nodeASP = new Node()
            {
                Text = "ASP.NET Controls",
                Expanded = true
            };
            nodeProd.ChildNodes.Add(nodeASP);

            nodeASP.ChildNodes.Add(new Node("Grid"));
            nodeASP.ChildNodes.Add(new Node("TreeView"));
            nodeASP.ChildNodes.Add(new Node("HTML Editor"));

            Node nodeMVC = new Node()
            {
                Text = "ASP.NET MVC Controls",
                Expanded = true
            };
            nodeProd.ChildNodes.Add(nodeMVC);

            nodeMVC.ChildNodes.Add(new Node("Interface Controls"));

            Node nodeComp = new Node()
            {
                Text = "Company"
            };
            nodeComp.ChildNodes.Add(new Node("Purchase"));
            nodeComp.ChildNodes.Add(new Node("Client"));
            nodeComp.ChildNodes.Add(new Node("Testimonials"));
            nodeComp.ChildNodes.Add(new Node("Contact us"));
            nodeComp.ChildNodes.Add(new Node("Support"));
            ObTree.Nodes.Add(nodeComp);

            Node nodeUtil = new Node("Utilities");
            ObTree.Nodes.Add(nodeUtil);

            nodeUtil.ChildNodes.Add(new Node("Site Monitoring"));
            
            this.TreePlaceHolder.Controls.Add(ObTree);

        }
    </script>

    <style type="text/css">
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
        ASP.NET TreeView - Classic Style</h2>
    <table border="0">
        <tr>
            <td valign="top" class="h5" width="230px">
                By default, TreeView is applied with this style.
            </td>
            <td class="tdText" style="color: #0033cc;">
                OboutTree1.CssClass = "" or OboutTree1.CssClass = "default"<br />
                &nbsp;
            </td>
        </tr>
    </table>
    <b></b>
    <br />
    <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
    </form>
</body>
</html>
