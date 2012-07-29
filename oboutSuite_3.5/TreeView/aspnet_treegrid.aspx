<%@ Page Language="C#" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            NorthwindClassesDataContext dataContext = new NorthwindClassesDataContext();
            Tree1.Nodes.Add(new Node(this.GetCategoryHeaderText()));
            foreach (var item in dataContext.Categories)
            {
                Node root = new Node(this.GetCategoryItemText(item));
                root.ChildNodes.Add(new Node(this.GetProductHeaderItemText()));
                foreach (var p in item.Products)
                {

                    root.ChildNodes.Add(new Node(this.GetProductItemText(p)));
                }
                Tree1.Nodes.Add(root);
            }
        }
    }

    private string GetCategoryItemText(Category cat)
    {
        return String.Format("<span class=\"cat\">{0}</span><span class=\"desc\">{1}</span>", cat.CategoryName, cat.Description);
    }

    private string GetCategoryHeaderText()
    {
        return "<span class=\"cat_head\">CategoryName</span><span class=\"desc_head\">Description</span>";
    }

    private string GetProductItemText(Product prod)
    {
        return String.Format("<span class=\"prod\">{0}</span><span class=\"supplier\">{1}</span><span class=\"price\">{2}</span><span class=\"stock\">{3}</span>", prod.ProductName, prod.Supplier.CompanyName, prod.UnitPrice, prod.UnitsInStock);
    }
    private string GetProductHeaderItemText()
    {
        return "<span class=\"prod_head\">ProductName</span><span class=\"supplier_head\">CompanyName</span><span class=\"price_head\">UnitPrice</span><span class=\"stock_head\">UnitsInStock</span>";
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Tree Grid </title>
    <style type="text/css">
        body
        {
            font-family: "Segoe UI" ,Arial,sans-serif;
            font-size: 12px;
        }
        .cat
        {
            width: 150px;
            display: inline-block;
        }
        .desc
        {
            width: 350px;
            display: inline-block;
        }
        .cat_head
        {
            width: 150px;
            display: inline-block;
            font-weight: bold;
            font-size: 12px;
        }
        .desc_head
        {
            width: 250px;
            display: inline-block;
            font-weight: bold;
            font-size: 12px;
        }
        .prod
        {
            width: 180px;
            display: inline-block;
        }
        .supplier
        {
            width: 200px;
            display: inline-block;
        }
        .stock
        {
            width: 100px;
            display: inline-block;
        }
        .price
        {
            width: 100px;
            display: inline-block;
        }
        .prod_head
        {
            width: 180px;
            display: inline-block;
            font-weight: bold;
            font-size: 12px;
        }
        .supplier_head
        {
            width: 200px;
            display: inline-block;
            font-weight: bold;
            font-size: 12px;
        }
        .stock_head
        {
            width: 100px;
            display: inline-block;
            font-weight: bold;
            font-size: 12px;
        }
        .price_head
        {
            width: 100px;
            display: inline-block;
            font-weight: bold;
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
        ASP.NET TreeView - Tree Grid</h2>
    <obout:Tree ID="Tree1" runat="server" EnableViewState="false">
    </obout:Tree>
    </form>
</body>
</html>
