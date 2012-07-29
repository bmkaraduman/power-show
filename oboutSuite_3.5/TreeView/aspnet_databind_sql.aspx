<%@ Page Language="C#" %>

<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.TreeView" tagprefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Binding With SqlDataSource</title>
     <style type="text/css">
        body
        {
            font-family: "Segoe UI" ,Arial,sans-serif;
            font-size: 12px;
        }
    </style>

    <script language="C#" runat="server">
        //Handle this event to format the node text
        protected void ObClassicTree_TreeNodeDataBound(object sender, NodeEventArgs e)
        {
            System.Data.DataRowView dv = (e.Node.DataItem as System.Data.DataRowView);
            if (dv != null)
            {
                e.Node.Text = String.Format("{0} {1}", dv["FirstName"].ToString(), dv["LastName"].ToString());
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <br />
		<a class="examples" href="Default.aspx?type=ASPNET">« Back to examples</a>
		<br />
     <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <div>
        <h2>
            ASP.NET TreeView - Binding With SqlDataSource</h2>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString1 %>"
            ProviderName="<%$ ConnectionStrings:NORTHWNDConnectionString1.ProviderName %>"
            SelectCommand="SELECT [EmployeeID],[FirstName], [LastName], [ReportsTo] FROM [Employees]">
        </asp:SqlDataSource>
        <obout:Tree ID="ObClassicTree" CssClass="vista" DataSourceID="SqlDataSource1" runat="server"
            OnTreeNodeDataBound="ObClassicTree_TreeNodeDataBound">
            <DataBindings>
                <obout:NodeBinding DataSourceColumnID="EmployeeID" DataSourceColumnParentID="ReportsTo"
                    Expanded="true" />
            </DataBindings>
        </obout:Tree>
        </Content>
    </div>
    </form>
</body>
</html>
