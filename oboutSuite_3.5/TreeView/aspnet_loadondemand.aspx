<%@ Page Language="C#" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - LoadOnDemand Support</title>

    <script language="C#" runat="server">
        void Page_load(object sender, EventArgs e)
        {
            if (IsPostBack)
                ObClassicTree.DataBind();
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

    <script type="text/javascript">
        function onCheckChange(obj) {
            $find("<%=ObClassicTree.ClientID %>").loadingMessage = obj.checked ? 'Refreshing...' : 'Loading...';
        }
    </script>

    <div>
        <h2>
            ASP.NET TreeView - LoadOnDemand Support</h2>
        <div class="live_example">
        </div>
        <asp:XmlDataSource ID="XmlDataSource1" DataFile="employee.xml" runat="server"></asp:XmlDataSource>
        <p>
            To enable 'LoadOndemand' feature for a node, the node property, '<b>ExpandMode</b>'
            should be set as '<b>ServerSideCallback</b>'</p>
        <table>
            <tr>
                <td>
                    <obout:Tree ID="ObClassicTree" DataSourceID="XmlDataSource1" EnableViewState="false"
                        LoadingMessage="Loading..." CssClass="vista" runat="server" Width="200px">
                        <DataBindings>
                            <obout:NodeBinding DataMember="employee" ExpandMode="ServerSideCallback" TextField="name"
                                ImageUrl="img/engineer-icon.png" />
                        </DataBindings>
                    </obout:Tree>
                </td>
                <td valign="top">
                    <input id="Checkbox1" onchange="onCheckChange(this)" type="checkbox" />
                    Change loading message as 'Refreshing'
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
