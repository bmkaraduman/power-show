<%@ Page Language="C#" %>

<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.TreeView" tagprefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - No Lines</title>

    <script language="C#" runat="server">
   
        protected void chk_showlines_CheckedChanged(object sender, EventArgs e)
        {
            this.ObTree.ShowLines = chk_showlines.Checked;
        }
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
                <obout:Tree ID="ObTree" runat="server" Width="200px" ShowLines="false">
                    <Nodes>
                        <obout:Node Text="Desktop" Expanded="true" ImageUrl="img/WinXP/desktop.gif">
                            <obout:Node Text="My Documents" ImageUrl="img/WinXP/myDocuments.gif">
                            </obout:Node>
                            <obout:Node Text="My Computer" Expanded="true" ImageUrl="img/WinXP/2PCRemote.gif">
                                <obout:Node Text="Local Disk (C:)" ImageUrl="img/WinXP/15hardDisk.gif">
                                </obout:Node>
                                <obout:Node Text="Local Disk (D:)" ImageUrl="img/WinXP/15hardDisk.gif">
                                </obout:Node>
                                <obout:Node Text="DVD-RAM Drive (E:)" ImageUrl="img/WinXP/14CD.gif">
                                </obout:Node>
                                <obout:Node Text="Guest's Documents" ImageUrl="img/WinXP/folder.gif">
                                </obout:Node>
                            </obout:Node>
                            <obout:Node Text="My Network Places" ImageUrl="img/WinXP/6myNetworkPlaces.gif">
                            </obout:Node>
                            <obout:Node Text="Recycle Bin" ImageUrl="img/WinXP/13Recycle.gif">
                            </obout:Node>
                        </obout:Node>
                    </Nodes>
                </obout:Tree>
                </div>
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
