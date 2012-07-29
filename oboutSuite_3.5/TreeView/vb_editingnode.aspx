<%@ Page Language="VB" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Editing Node Text</title>

    <script language="VB" runat="server"> 
        Private ObTree As Tree = Nothing
        Private Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)

            ObTree = New Tree() With {.ID = "VistaTree", .AllowNodeEdit = True, .OnBeforeNodeEdit = "OnClientBeforeNodeEdit", .OnNodeEdit = "OnClientNodeEdit", .CssClass = "vista"}
            Dim nodeLib As New Node() With {.Text = "Libraries", .AllowEdit = False, .ImageUrl = "img/library.png", .Expanded = True}
            Me.ObTree.Nodes.Add(nodeLib)

            Dim nodeDoc As New Node() With {.Text = "Documents", .ImageUrl = "img/document.png"}
            nodeLib.ChildNodes.Add(nodeDoc)
            nodeDoc.ChildNodes.Add(New Node() With {.Text = "My Documents", .ImageUrl = "img/mydocuments.png"})
            nodeDoc.ChildNodes.Add(New Node() With {.Text = "Public Documents", .ImageUrl = "img/folder.png"})

            Dim nodeMusic As New Node() With {.Text = "Music", .AllowEdit = False, .ImageUrl = "img/music.png", .Expanded = True}
            nodeLib.ChildNodes.Add(nodeMusic)
            nodeMusic.ChildNodes.Add(New Node() With {.Text = "My Music", .ImageUrl = "img/mymusic.png"})
            nodeMusic.ChildNodes.Add(New Node() With {.Text = "Public Music", .ImageUrl = "img/folder.png"})

            Dim nodePict As New Node() With {.Text = "Pictures", .ImageUrl = "img/picture.png", .Expanded = True}
            nodeLib.ChildNodes.Add(nodePict)
            nodePict.ChildNodes.Add(New Node() With {.Text = "My Pictures", .ImageUrl = "img/mypicture.png"})
            nodePict.ChildNodes.Add(New Node() With {.Text = "Public Pictures", .ImageUrl = "img/folder.png"})

            Dim nodeVid As New Node() With {.Text = "Videos", .ImageUrl = "img/video.png", .Expanded = True}
            nodeLib.ChildNodes.Add(nodeVid)
            nodeVid.ChildNodes.Add(New Node() With {.Text = "My Videos", .ImageUrl = "img/my_video.png"})
            nodeVid.ChildNodes.Add(New Node() With {.Text = "Public Videos", .ImageUrl = "img/folder.png"})
            Me.TreePlaceHolder.Controls.Add(ObTree)

        End Sub
        Protected Sub chk_allowEdit_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            Me.ObTree.AllowNodeEdit = chk_allowEdit.Checked
        End Sub
    </script>

    <style type="text/css">
        body
        {
            font-family: "Segoe UI" ,Arial,sans-serif;
            font-size: 12px;
        }
        .tb_sample
        {
            width: 100%;
        }
        .tb_sample td
        {
            width: 50%;
            vertical-align: top;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <br />
		<a class="examples" href="Default.aspx?type=ASPNET">« Back to examples</a>
		<br />
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />

    <script type="text/javascript">
        function OnClientBeforeNodeEdit(sender, args) {
            var chk_conform = document.getElementById("<%=chk_cfm.ClientID %>");
            if (chk_conform.checked) {
                var action = confirm("Are you sure to rename '" + args.text + "'?");
                args.cancel = !action;
            }
        }
        function OnClientNodeEdit(sender, args) {
            var chk_conform = document.getElementById("<%=chk_cfm.ClientID %>");
            if (chk_conform.checked && args.text != args.newText) {
                var action = confirm("Rename '" + args.text + "' to '" + args.newText + "'?");
                args.cancel = !action;
            }
        }      

    </script>

    <h2>
        ASP.NET TreeView - Editing Node Text</h2>
    <br />
    <ul>
        <li>Editing is disabled for the nodes, 'Libraries' and 'Music'.</li>
    </ul>
    <br />
    <table class="tb_sample">
        <tr>
            <td valign="top">
                <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
            </td>
            <td valign="top">
                <asp:CheckBox ID="chk_allowEdit" Checked="true" OnCheckedChanged="chk_allowEdit_CheckedChanged"
                    AutoPostBack="true" Text=" Enable Node Text Editing" runat="server" />
                <br />
                <br />
                <asp:CheckBox ID="chk_cfm" Text=" Conform before node rename" runat="server" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
