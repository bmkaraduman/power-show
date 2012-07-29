<%@ Page Language="C#" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Vista Style</title>

    <script language="C#" runat="server"> 
        Tree ObTree = null;
        void Page_Init(object sender, EventArgs e)
        {

            ObTree = new Tree()
                       {
                           ID = "ObTree",
                           CssClass="vista"
                       };
            Node nodeLib = new Node()
            {
                Text = "Libraries",
                Expanded = true,
                ImageUrl = "img/library.png"
            };
            ObTree.Nodes.Add(nodeLib);

            Node nodeDoc = new Node()
            {
                Text = "Documents",
                ImageUrl = "img/document.png"
            };
            nodeDoc.ChildNodes.Add(new Node()
            {
                Text = "My Documents",
                ImageUrl = "img/mydocuments.png"
            });
            nodeDoc.ChildNodes.Add(new Node()
            {
                Text = "Public Documents",
                ImageUrl = "img/folder.png"
            });

            nodeLib.ChildNodes.Add(nodeDoc);

            Node nodeMus = new Node()
            {
                Text = "Music",
                ImageUrl = "img/music.png",
                Expanded = true
            };
            nodeMus.ChildNodes.Add(new Node()
            {
                Text = "My Music",
                ImageUrl = "img/mymusic.png"
            });
            nodeMus.ChildNodes.Add(new Node()
            {
                Text = "Public Music",
                ImageUrl = "img/folder.png"
            });
            nodeLib.ChildNodes.Add(nodeMus);

            Node nodePic = new Node()
            {
                Text = "Pictures",
                ImageUrl = "img/picture.png",
                Expanded = true
            };
            nodePic.ChildNodes.Add(new Node()
            {
                Text = "My Pictures",
                ImageUrl = "img/mypicture.png"
            });
            nodePic.ChildNodes.Add(new Node()
            {
                Text = "Public Pictures",
                ImageUrl = "img/folder.png"
            });
            nodeLib.ChildNodes.Add(nodePic);

            Node nodeVid = new Node()
            {
                Text = "Videos",
                ImageUrl = "img/video.png",
                Expanded = true
            };
            nodeVid.ChildNodes.Add(new Node()
            {
                Text = "My Videos",
                ImageUrl = "img/my_video.png"
            });
            nodeVid.ChildNodes.Add(new Node()
            {
                Text = "Public Videos",
                ImageUrl = "img/folder.png"
            });
            nodeLib.ChildNodes.Add(nodeVid);
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
