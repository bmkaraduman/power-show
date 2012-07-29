<%@ Page Language="VB" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Binding With XmlDataSource</title>
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

			ObTree = New Tree() With {.ID = "ObTree", .CssClass = "vista", .DataSourceID = "XmlDataSource1"}

			ObTree.DataBindings.Add(New NodeBinding() With {.DataMember = "Book", .ImageUrl = "img/vista_book.png", .TextField = "Title", .Expanded = True})
			ObTree.DataBindings.Add(New NodeBinding() With {.DataMember = "Chapter", .ImageUrl = "img/vista_note.png", .TextField = "Heading"})
			ObTree.DataBindings.Add(New NodeBinding() With {.DataMember = "Section", .ImageUrl = "img/vista_note.png", .TextField = "Heading"})

			Me.TreePlaceHolder.Controls.Add(ObTree)

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
            ASP.NET TreeView - Binding With XmlDataSource</h2>
        <asp:XmlDataSource ID="XmlDataSource1" DataFile="books.xml" XPath="Books/Book" runat="server">
        </asp:XmlDataSource>
        <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
    </div>
    </form>
</body>
</html>
