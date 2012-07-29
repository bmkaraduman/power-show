<%@ Page Language="C#" %>

<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.TreeView" tagprefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Types of Node Selection Mode</title>
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
                        <obout:Node SelectMode="Expand" Text="Node 0">
                            <obout:Node SelectMode="Expand" Text="Node 00">
                                <obout:Node SelectMode="Expand" Text="Node 000">
                                </obout:Node>
                            </obout:Node>
                        </obout:Node>
                        <obout:Node SelectMode="Expand" Text="Node 1">
                            <obout:Node SelectMode="Expand" Text="Node 10">
                                <obout:Node SelectMode="Expand" Text="Node 100">
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
