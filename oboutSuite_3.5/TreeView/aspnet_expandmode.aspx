<%@ Page Language="C#" %>

<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.TreeView" tagprefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Types of Expand Mode</title>
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
        ASP.NET TreeView - Types of Expand Mode</h2>
    When the ExpandMode property is set to,
    <ul>
        <li>ClientSide, this will expand the child nodes in the client itself.</li>
        <li>ServerSide, this will trigger a postback to load child nodes on demand.</li>
        <li>ServerSideCallback, this will trigger asyncronous postback to load child nodes on
            demand.</li>
    </ul>
    <table class="td_sample" cellspacing="15">
        <tr class="header">
            <td>
                Client Side
            </td>
            <td>
                Server-Side
            </td>
            <td>
                Server-Side Callback
            </td>
        </tr>
        <tr>
            <td>
                <obout:Tree ID="OboutTree11" CssClass="vista" Width="150px" runat="server">
                    <Nodes>
                        <obout:Node Text="Node 0">
                            <obout:Node Text="Node 00">
                                <obout:Node Text="Node 000">
                                </obout:Node>
                            </obout:Node>
                        </obout:Node>
                        <obout:Node Text="Node 1">
                            <obout:Node Text="Node 10">
                                <obout:Node Text="Node 100">
                                </obout:Node>
                            </obout:Node>
                        </obout:Node>
                    </Nodes>
                </obout:Tree>
            </td>
            <td>
                <obout:Tree ID="OboutTree2" CssClass="vista" Width="150px" runat="server">
                    <Nodes>
                        <obout:Node ExpandMode="ServerSide" Text="Node 0">
                            <obout:Node ExpandMode="ServerSide" Text="Node 00">
                                <obout:Node ExpandMode="ServerSide" Text="Node 000">
                                </obout:Node>
                            </obout:Node>
                        </obout:Node>
                        <obout:Node ExpandMode="ServerSide" Text="Node 1">
                            <obout:Node ExpandMode="ServerSide" Text="Node 10">
                                <obout:Node ExpandMode="ServerSide" Text="Node 100">
                                </obout:Node>
                            </obout:Node>
                        </obout:Node>
                    </Nodes>
                </obout:Tree>
            </td>
            <td>
                <obout:Tree ID="OboutTree3" CssClass="vista" Width="150px" runat="server">
                    <Nodes>
                        <obout:Node ExpandMode="ServerSideCallback" Text="Node 0">
                            <obout:Node ExpandMode="ServerSideCallback" Text="Node 00">
                                <obout:Node ExpandMode="ServerSideCallback" Text="Node 000">
                                </obout:Node>
                            </obout:Node>
                        </obout:Node>
                        <obout:Node ExpandMode="ServerSideCallback" Text="Node 1">
                            <obout:Node ExpandMode="ServerSideCallback" Text="Node 10">
                                <obout:Node ExpandMode="ServerSideCallback" Text="Node 100">
                                </obout:Node>
                            </obout:Node>
                        </obout:Node>
                    </Nodes>
                </obout:Tree>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
