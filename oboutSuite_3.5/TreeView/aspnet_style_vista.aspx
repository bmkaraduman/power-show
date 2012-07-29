<%@ Page Language="C#" %>

<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.TreeView" tagprefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Vista Style</title>
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
    <obout:Tree ID="ObClassicTree" CssClass="vista" runat="server">
        <Nodes>
            <obout:Node Text="Libraries" ImageUrl="img/library.png" Expanded="true">
                <obout:Node Text="Documents" ImageUrl="img/document.png">
                    <obout:Node Text="My Documents" ImageUrl="img/mydocuments.png">
                    </obout:Node>
                    <obout:Node Text="Public Documents" ImageUrl="img/folder.png">
                    </obout:Node>
                </obout:Node>
                <obout:Node Text="Music" ImageUrl="img/music.png" Expanded="true">
                    <obout:Node Text="My Music" ImageUrl="img/mymusic.png">
                    </obout:Node>
                    <obout:Node Text="Public Music" ImageUrl="img/folder.png">
                    </obout:Node>
                </obout:Node>
                <obout:Node Text="Pictures" ImageUrl="img/picture.png" Expanded="true">
                    <obout:Node Text="My Pictures" ImageUrl="img/mypicture.png">
                    </obout:Node>
                    <obout:Node Text="Public Pictures" ImageUrl="img/folder.png">
                    </obout:Node>
                </obout:Node>
                <obout:Node Text="Videos" ImageUrl="img/video.png" Expanded="true">
                    <obout:Node Text="My Videos" ImageUrl="img/my_video.png">
                    </obout:Node>
                    <obout:Node Text="Public Videos" ImageUrl="img/folder.png">
                    </obout:Node>
                </obout:Node>
            </obout:Node>
        </Nodes>
    </obout:Tree>
    </form>
</body>
</html>
