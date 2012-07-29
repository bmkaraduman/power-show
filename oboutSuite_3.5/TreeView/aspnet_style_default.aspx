<%@ Page Language="C#" %>

<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.TreeView" tagprefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Classic Style</title>
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
        ASP.NET TreeView - Classic Style</h2>
    <table border="0">
        <tr>
            <td valign="top" class="h5" width="230px">
                By default, TreeView is applied with this style.
            </td>
            <td class="tdText" style="color: #0033cc;">
                OboutTree1.CssClass = "" or OboutTree1.CssClass = "default"<br />
                &nbsp;
            </td>
        </tr>
    </table>
    <b></b>
    <br />
    <obout:Tree ID="ObClassicTree" runat="server">
        <Nodes>
            <obout:Node Text="Products" Expanded="true">
                <obout:Node Text="ASP.NET Controls" Expanded="true">
                    <obout:Node Text="Grid">
                    </obout:Node>
                    <obout:Node Text="TreeView">
                    </obout:Node>
                    <obout:Node Text="HTML Editor">
                    </obout:Node>
                </obout:Node>
                <obout:Node Text="ASP.NET MVC Controls" Expanded="true">
                    <obout:Node Text="Interface Controls">
                    </obout:Node>
                </obout:Node>
            </obout:Node>
            <obout:Node Text="Company">
                <obout:Node Text="Purchase">
                </obout:Node>
                <obout:Node Text="Client">
                </obout:Node>
                <obout:Node Text="Testimonials">
                </obout:Node>
                <obout:Node Text="Contact us">
                </obout:Node>
                <obout:Node Text="Support">
                </obout:Node>
            </obout:Node>
            <obout:Node Text="Utilities">
                <obout:Node Text="Site Monitoring">
                </obout:Node>
            </obout:Node>
        </Nodes>
    </obout:Tree>
    </form>
</body>
</html>
