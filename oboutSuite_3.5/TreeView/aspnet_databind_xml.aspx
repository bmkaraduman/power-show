<%@ Page Language="C#" %>

<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.TreeView" tagprefix="obout" %>
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
        <asp:XmlDataSource ID="XmlDataSource1" DataFile="books.xml" XPath="Books/Book"
            runat="server"></asp:XmlDataSource>
        <obout:Tree ID="ObClassicTree" CssClass="vista" DataSourceID="XmlDataSource1" runat="server">
            <DataBindings>
                <obout:NodeBinding DataMember="Book" ImageUrl="img/vista_book.png" TextField="Title"
                    Expanded="true" />
                <obout:NodeBinding DataMember="Chapter" ImageUrl="img/vista_note.png"
                    TextField="Heading" />
                <obout:NodeBinding DataMember="Section" ImageUrl="img/vista_note.png"
                    TextField="Heading" />
            </DataBindings>
        </obout:Tree>
    </div>
    </form>
</body>
</html>
