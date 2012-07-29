<%@ Page Language="VB" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Types of Node Selection Mode</title>

    <script language="VB" runat="server"> 
        Private ObTreeSelect As Tree, ObTreeExpand As Tree = Nothing
		Private Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)

			ObTreeSelect = New Tree() With {.ID = "OboutTree1", .CssClass = "vista", .Width = 150}

			Dim root1 As New Node("Node 0")
			ObTreeSelect.Nodes.Add(root1)

			Dim parent1 As New Node("Node 00")
			root1.ChildNodes.Add(parent1)

			parent1.ChildNodes.Add(New Node("Node 000"))

			Dim root2 As New Node("Node 1")
			ObTreeSelect.Nodes.Add(root2)

			Dim parent2 As New Node("Node 10")
			root2.ChildNodes.Add(parent2)

			parent2.ChildNodes.Add(New Node("Node 100"))

			ObTreeExpand = New Tree() With {.ID = "OboutTree2", .CssClass = "vista", .Width = 150}

			Dim root3 As New Node("Node 0") With {.SelectMode=NodeSelectMode.Expand}
			ObTreeExpand.Nodes.Add(root3)

			Dim parent3 As New Node("Node 00") With {.SelectMode = NodeSelectMode.Expand}
			root3.ChildNodes.Add(parent3)

			parent3.ChildNodes.Add(New Node("Node 000"))

			Dim root4 As New Node("Node 1") With {.SelectMode = NodeSelectMode.Expand}
			ObTreeSelect.Nodes.Add(root4)

			Dim parent4 As New Node("Node 10") With {.SelectMode = NodeSelectMode.Expand}
			root4.ChildNodes.Add(parent4)

			parent4.ChildNodes.Add(New Node("Node 100"))

			Me.SelectTreePlaceHolder.Controls.Add(ObTreeSelect)
			Me.ExpandTreePlaceHolder.Controls.Add(ObTreeExpand)

		End Sub
    </script>

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
</head>
<body>
    <form id="form1" runat="server">
    <br />
		<a class="examples" href="Default.aspx?type=ASPNET">« Back to examples</a>
		<br />
     <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <h2>
        ASP.NET TreeView - Types of Node Selection Mode</h2>
    When the SelectMode property is set to,
    <ul>
        <li>Select, this will select the node when you click the node text.</li>
        <li>Expand, this will expand the child nodes instead of node selection when you click
            the node text.</li>
    </ul>
    <table class="td_sample" cellspacing="15">
        <tr class="header">
            <td>
                Select
            </td>
            <td>
                Expand
            </td>
        </tr>
        <tr>
            <td>
                <asp:PlaceHolder ID="SelectTreePlaceHolder" runat="server"></asp:PlaceHolder>
            </td>
            <td>
                <asp:PlaceHolder ID="ExpandTreePlaceHolder" runat="server"></asp:PlaceHolder>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
