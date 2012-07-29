<%@ Page Language="C#" %>

<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.TreeView" tagprefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Drag and drop between Trees</title>

    <script language="C#" runat="server">    
        protected void ObTree_TreeNodeDrop(object sender, Obout.Ajax.UI.TreeView.NodeDropEventArgs e)
        {
            if (chk_enableCopyNodes.Checked)
            {
                Node newNode = new Node(e.SourceNode.Text);
                newNode.ImageUrl = e.SourceNode.ImageUrl;
                e.TargetNode.ChildNodes.Add(newNode);
                e.TargetNode.Expanded = true;
                e.Handled = true;
            }
        }  
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
                <obout:Tree ID="StoreTree" EnableDragAndDrop="true" OnTreeNodeDrop="ObTree_TreeNodeDrop"
                    NodeDropTargets="MyFavourites" DataSourceID="XmlDataSource1" runat="server">
                    <DataBindings>
                        <obout:NodeBinding ImageUrl="img/vista_book.png" AllowDrop="false" AllowDrag="false"
                            DataMember="category" TextField="text" />
                        <obout:NodeBinding ImageUrl="img/vista_note.png" AllowDrop="false" DataMember="item"
                            TextField="text" />
                    </DataBindings>
                </obout:Tree>
            </div>
            <div style="float: right;">
                <obout:Tree ID="MyFavourites" runat="server" Width="200px">
                    <Nodes>
                        <obout:Node Text="MyFavourites">
                        </obout:Node>
                    </Nodes>
                </obout:Tree>
                </ContentTemplate>
            </div>
            <div style="clear: both;">
            </div>
        </div>
    </div>
    </form>
</body>
</html>
