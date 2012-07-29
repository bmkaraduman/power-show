<%@ Page Language="C#" %>

<%@ Import Namespace="System.Linq" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Binding With LINQDataSource</title> <style type="text/css">
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
    <script language="C#" runat="server">   

        class ProductsByCategory
        {
            public int ID { get; set; }
            public int? ParentID { get; set; }
            public string Name { get; set; }
        }
        protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            NorthwindClassesDataContext dc = new NorthwindClassesDataContext();

            e.Result = (from c in dc.Categories
                        select new ProductsByCategory { ID = c.CategoryID, ParentID = null, Name = c.CategoryName })
                        .Union(from p in dc.Products
                               select new ProductsByCategory { ID = p.ProductID, ParentID = p.CategoryID, Name = p.ProductName });
        }

        Tree ObTree = null;
        void Page_Init(object sender, EventArgs e)
        {

            ObTree = new Tree()
            {
                ID = "ObTree",
                CssClass = "vista",
                DataSourceID = "LinqDataSource1"
            };

            ObTree.DataBindings.Add(new NodeBinding()
            {
                DataSourceColumnID = "ID",
                DataSourceColumnParentID = "ParentID",
                TextField = "Name",
                ImageUrl = "~/treeview/img/hamburger-icon.png"
            });

            this.TreePlaceHolder.Controls.Add(ObTree);

        }
    
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
