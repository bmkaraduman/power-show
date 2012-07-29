<%@ Page Language="VB" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Drag and drop between Trees</title>

    <script language="VB" runat="server">   
        Private StoreTree As Tree, FavTree As Tree = Nothing
		Private Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)

			StoreTree = New Tree() With {.ID = "StoreTree", .EnableDragAndDrop = True, .NodeDropTargets = "MyFavourites", .DataSourceID = "XmlDataSource1"}
			StoreTree.DataBindings.Add(New NodeBinding() With {.ImageUrl = "img/vista_book.png", .AllowDrop = False, .AllowDrag = False, .DataMember = "category", .TextField = "text"})
			StoreTree.DataBindings.Add(New NodeBinding() With {.ImageUrl = "img/vista_note.png", .AllowDrop = False, .DataMember = "item", .TextField = "text"})

			AddHandler StoreTree.TreeNodeDrop, AddressOf ObTree_TreeNodeDrop

			FavTree = New Tree() With {.ID = "MyFavourites"}
			FavTree.Nodes.Add(New Node("MyFavourites"))

			Me.StoreTreePlaceHolder.Controls.Add(StoreTree)
			Me.FavorTreePlaceHolder.Controls.Add(FavTree)
		End Sub
		Protected Sub ObTree_TreeNodeDrop(ByVal sender As Object, ByVal e As Obout.Ajax.UI.TreeView.NodeDropEventArgs)
			If chk_enableCopyNodes.Checked Then
				Dim newNode As New Node(e.SourceNode.Text)
				newNode.ImageUrl = e.SourceNode.ImageUrl
				e.TargetNode.ChildNodes.Add(newNode)
				e.TargetNode.Expanded = True
				e.Handled = True
			End If
		End Sub
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
    <div>
        <h2>
            ASP.NET TreeView - Drag and drop between the Trees
        </h2>
        <asp:XmlDataSource ID="XmlDataSource1" DataFile="Treebooks.xml" XPath="categories/category"
            runat="server"></asp:XmlDataSource>
        <div style="padding: 8px 0 8px 4px;">
            <asp:CheckBox ID="chk_enableCopyNodes" Text=" Copy nodes while drop" runat="server" />
        </div>
        <div id="container" style="width: 40%">
            <div style="float: left;">
                <asp:PlaceHolder ID="StoreTreePlaceHolder" runat="server"></asp:PlaceHolder>
            </div>
            <div style="float: right;">
                <asp:PlaceHolder ID="FavorTreePlaceHolder" runat="server"></asp:PlaceHolder>
                </ContentTemplate>
            </div>
            <div style="clear: both;">
            </div>
        </div>
    </div>
    </form>
</body>
</html>
