<%@ Page Language="VB" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
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

    <script language="VB" runat="server">
       		Private ObTree As Tree = Nothing
		Private Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)

			ObTree = New Tree() With {.ID = "ObTree", .CssClass = "vista", .DataSourceID = "SqlDataSource1"}
			ObTree.DataBindings.Add(New NodeBinding() With {.DataSourceColumnID = "EmployeeID", .DataSourceColumnParentID = "ReportsTo", .Expanded = True})
			AddHandler ObTree.TreeNodeDataBound, AddressOf ObClassicTree_TreeNodeDataBound
			Me.TreePlaceHolder.Controls.Add(ObTree)

		End Sub
		'Handle this event to format the node text
		Protected Sub ObClassicTree_TreeNodeDataBound(ByVal sender As Object, ByVal e As NodeEventArgs)
			Dim dv As System.Data.DataRowView = (TryCast(e.Node.DataItem, System.Data.DataRowView))
			If dv IsNot Nothing Then
				e.Node.Text = String.Format("{0} {1}", dv("FirstName").ToString(), dv("LastName").ToString())
			End If
		End Sub
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
        <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
    </div>
    </form>
</body>
</html>
