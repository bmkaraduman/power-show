
<%@ Page Language="VB" %>

<%@ Import Namespace="System.Linq" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Binding With LINQDataSource</title>
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
    <script language="VB" runat="server">   

        Friend Class ProductsByCategory
            Private _id As Integer
            Public Property ID() As Integer
                Get
                    Return _id
                End Get
                Set(ByVal value As Integer)
                    _id = value
                End Set
            End Property
            Private _parentID? As Integer
            Public Property ParentID() As Nullable(Of Integer)
                Get
                    Return _parentID
                End Get
                Set(ByVal value As Nullable(Of Integer))
                    _parentID = value
                End Set
            End Property
            Private _name As String = Nothing
            Public Property Name() As String
                Get
                    Return _name
                End Get
                Set(ByVal value As String)
                    _name = value
                End Set
            End Property
        End Class
		Protected Sub LinqDataSource1_Selecting(ByVal sender As Object, ByVal e As LinqDataSourceSelectEventArgs)
			Dim dc As New NorthwindClassesDataContext()

            e.Result = (From c In dc.Categories Select New ProductsByCategory With {.ID = c.CategoryID, .ParentID = Nothing, .Name = c.CategoryName}).Union(From p In dc.Products Select New ProductsByCategory With {.ID = p.ProductID, .ParentID = p.CategoryID, .Name = p.ProductName})
        End Sub

		Private ObTree As Tree = Nothing
		Private Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)

			ObTree = New Tree() With {.ID = "ObTree", .CssClass = "vista", .DataSourceID = "LinqDataSource1"}

			ObTree.DataBindings.Add(New NodeBinding() With {.DataSourceColumnID = "ID", .DataSourceColumnParentID = "ParentID", .TextField = "Name", .ImageUrl = "~/treeview/img/hamburger-icon.png"})

			Me.TreePlaceHolder.Controls.Add(ObTree)

		End Sub
    
    </script>

    <h2>
        ASP.NET TreeView - Binding With LinqDataSource</h2>
    <asp:LinqDataSource ID="LinqDataSource1" ContextTypeName="NorthWindDataContext" runat="server"
        OnSelecting="LinqDataSource1_Selecting">
    </asp:LinqDataSource>
    <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
    </form>
</body>
</html>
