<%@ Page Language="VB" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Vista Style</title>

    <script language="VB" runat="server"> 
        Private ObTree As Tree = Nothing
		Private Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)

			ObTree = New Tree() With {.ID = "ObTree", .CssClass="vista"}
			Dim nodeLib As New Node() With {.Text = "Libraries", .Expanded = True, .ImageUrl = "img/library.png"}
			ObTree.Nodes.Add(nodeLib)

			Dim nodeDoc As New Node() With {.Text = "Documents", .ImageUrl = "img/document.png"}
			nodeDoc.ChildNodes.Add(New Node() With {.Text = "My Documents", .ImageUrl = "img/mydocuments.png"})
			nodeDoc.ChildNodes.Add(New Node() With {.Text = "Public Documents", .ImageUrl = "img/folder.png"})

			nodeLib.ChildNodes.Add(nodeDoc)

			Dim nodeMus As New Node() With {.Text = "Music", .ImageUrl = "img/music.png", .Expanded = True}
			nodeMus.ChildNodes.Add(New Node() With {.Text = "My Music", .ImageUrl = "img/mymusic.png"})
			nodeMus.ChildNodes.Add(New Node() With {.Text = "Public Music", .ImageUrl = "img/folder.png"})
			nodeLib.ChildNodes.Add(nodeMus)

			Dim nodePic As New Node() With {.Text = "Pictures", .ImageUrl = "img/picture.png", .Expanded = True}
			nodePic.ChildNodes.Add(New Node() With {.Text = "My Pictures", .ImageUrl = "img/mypicture.png"})
			nodePic.ChildNodes.Add(New Node() With {.Text = "Public Pictures", .ImageUrl = "img/folder.png"})
			nodeLib.ChildNodes.Add(nodePic)

			Dim nodeVid As New Node() With {.Text = "Videos", .ImageUrl = "img/video.png", .Expanded = True}
			nodeVid.ChildNodes.Add(New Node() With {.Text = "My Videos", .ImageUrl = "img/my_video.png"})
			nodeVid.ChildNodes.Add(New Node() With {.Text = "Public Videos", .ImageUrl = "img/folder.png"})
			nodeLib.ChildNodes.Add(nodeVid)
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
        ASP.NET TreeView - Vista Style</h2>
    <div class="live_example">
    </div>
    <table border="0">
        <tr>
            <td valign="top" class="h5" width="230px">
                Change style with one property
            </td>
            <td class="tdText" style="color: #0033cc;">
                OboutTree1.CssClass = "vista"<br />
                &nbsp;
            </td>
        </tr>
    </table>
    <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
    </form>
</body>
</html>
