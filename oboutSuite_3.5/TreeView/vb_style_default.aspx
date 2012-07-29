<%@ Page Language="VB" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Classic Style</title>

    <script language="VB" runat="server"> 
        Private ObTree As Tree = Nothing
		Private Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)

			ObTree = New Tree() With {.ID = "ObTree"}

			Dim nodeProd As New Node() With {.Text = "Products", .Expanded = True}
			ObTree.Nodes.Add(nodeProd)

			Dim nodeASP As New Node() With {.Text = "ASP.NET Controls", .Expanded = True}
			nodeProd.ChildNodes.Add(nodeASP)

			nodeASP.ChildNodes.Add(New Node("Grid"))
			nodeASP.ChildNodes.Add(New Node("TreeView"))
			nodeASP.ChildNodes.Add(New Node("HTML Editor"))

			Dim nodeMVC As New Node() With {.Text = "ASP.NET MVC Controls", .Expanded = True}
			nodeProd.ChildNodes.Add(nodeMVC)

			nodeMVC.ChildNodes.Add(New Node("Interface Controls"))

			Dim nodeComp As New Node() With {.Text = "Company"}
			nodeComp.ChildNodes.Add(New Node("Purchase"))
			nodeComp.ChildNodes.Add(New Node("Client"))
			nodeComp.ChildNodes.Add(New Node("Testimonials"))
			nodeComp.ChildNodes.Add(New Node("Contact us"))
			nodeComp.ChildNodes.Add(New Node("Support"))
			ObTree.Nodes.Add(nodeComp)

			Dim nodeUtil As New Node("Utilities")
			ObTree.Nodes.Add(nodeUtil)

			nodeUtil.ChildNodes.Add(New Node("Site Monitoring"))

			Me.TreePlaceHolder.Controls.Add(ObTree)

		End Sub
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
