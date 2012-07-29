<%@ Page Language="C#" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Editing Node Text</title>

    <script language="C#" runat="server">
   
        protected void chk_allowEdit_CheckedChanged(object sender, EventArgs e)
        {
            this.VistaTree.AllowNodeEdit = chk_allowEdit.Checked;
        }
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
                <obout:Tree ID="VistaTree" AllowNodeEdit="true" OnBeforeNodeEdit="OnClientBeforeNodeEdit"
                    OnNodeEdit="OnClientNodeEdit" CssClass="vista" runat="server">
                    <Nodes>
                        <obout:Node Text="Libraries" AllowEdit="false" ImageUrl="img/library.png" Expanded="true">
                            <obout:Node Text="Documents" ImageUrl="img/document.png">
                                <obout:Node Text="My Documents" ImageUrl="img/mydocuments.png">
                                </obout:Node>
                                <obout:Node Text="Public Documents" ImageUrl="img/folder.png">
                                </obout:Node>
                            </obout:Node>
                            <obout:Node Text="Music" AllowEdit="false" ImageUrl="img/music.png" Expanded="true">
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
