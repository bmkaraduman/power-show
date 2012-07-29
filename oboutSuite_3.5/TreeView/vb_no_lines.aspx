<%@ Page Language="VB" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - No Lines</title>

    <script language="VB" runat="server">
        Private ObTree As Tree = Nothing
		Private Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)

			ObTree = New Tree() With {.ID = "ObTree", .Width = 200, .ShowLines = False}

			Dim nodeDesk As New Node() With {.Text = "Desktop", .Expanded = True, .ImageUrl = "img/WinXP/desktop.gif"}
			Me.ObTree.Nodes.Add(nodeDesk)

			nodeDesk.ChildNodes.Add(New Node() With {.Text = "My Documents", .ImageUrl = "img/WinXP/myDocuments.gif"})

			Dim nodeMyComp As New Node() With {.Text = "My Computer", .Expanded = True, .ImageUrl = "img/WinXP/2PCRemote.gif"}
			nodeDesk.ChildNodes.Add(nodeMyComp)

			nodeMyComp.ChildNodes.Add(New Node() With {.Text = "Local Disk (C:)", .ImageUrl = "img/WinXP/15hardDisk.gif"})

			nodeMyComp.ChildNodes.Add(New Node() With {.Text = "Local Disk (D:)", .ImageUrl = "img/WinXP/15hardDisk.gif"})

			nodeMyComp.ChildNodes.Add(New Node() With {.Text = "DVD-RAM Drive (E:)", .ImageUrl = "img/WinXP/14CD.gif"})

			nodeMyComp.ChildNodes.Add(New Node() With {.Text = "Guest's Documents", .ImageUrl = "img/WinXP/folder.gif"})

			nodeDesk.ChildNodes.Add(New Node() With {.Text = "My Network Places", .ImageUrl = "img/WinXP/6myNetworkPlaces.gif"})
			nodeDesk.ChildNodes.Add(New Node() With {.Text = "Recycle Bin", .ImageUrl = "img/WinXP/13Recycle.gif"})

			Me.TreePlaceHolder.Controls.Add(ObTree)

		End Sub
		Protected Sub chk_showlines_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
			Me.ObTree.ShowLines = chk_showlines.Checked
		End Sub
    </script>

    <style type="text/css">
        .tb_sample
        {
            width: 50%;
        }
        .tb_sample td
        {
            width: 50%;
            vertical-align: top;
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
        ASP.NET TreeView - No Lines
    </h2>
    <div class="h5">
        Check the checkbox to display the lines connecting nodes</div>
    <br />
    <table class="tb_sample">
        <tr>
            <td>
                <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
            </td>
            <td>
                <asp:CheckBox AutoPostBack="true" ID="chk_showlines" Text=" Show Lines" runat="server"
                    OnCheckedChanged="chk_showlines_CheckedChanged" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
