<%@ Page Language="C#" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Shopping Cart demo with obout Grid</title>

    <script language="C#" runat="server">
        Tree ObTree = null;
        void Page_Init(object sender, EventArgs e)
        {

            ObTree = new Tree()
            {
                ID = "ObTree",
                NodeDropTargets = "GridPanel",
                CssClass = "vista",
                EnableDragAndDrop = true
            };

            Node nodeSuite = new Node()
            {
                ImageUrl = "img/ob_product.png",
                Text = "oboutSuite",
                AllowDrop = false,
                Expanded = true,
                Value = "199"
            };
            this.ObTree.Nodes.Add(nodeSuite);

            nodeSuite.ChildNodes.Add(new Node()
            {
                Text = "TreeView",
                ImageUrl = "img/vista-download-icon.jpg",
                AllowDrop = false,
                Value = "99"
            });
            nodeSuite.ChildNodes.Add(new Node()
            {
                Text = "Grid",
                ImageUrl = "img/vista-download-icon.jpg",
                AllowDrop = false,
                Value = "99"
            });
            nodeSuite.ChildNodes.Add(new Node()
            {
                Text = "Calendar",
                ImageUrl = "img/vista-download-icon.jpg",
                AllowDrop = false,
                Value = "99"
            });
            nodeSuite.ChildNodes.Add(new Node()
            {
                Text = "HTMLEditor",
                ImageUrl = "img/vista-download-icon.jpg",
                AllowDrop = false,
                Value = "99"
            });
            nodeSuite.ChildNodes.Add(new Node()
            {
                Text = "SlideMenu",
                ImageUrl = "img/vista-download-icon.jpg",
                AllowDrop = false,
                Value = "99"
            });
            nodeSuite.ChildNodes.Add(new Node()
            {
                Text = "EasyMenu",
                ImageUrl = "img/vista-download-icon.jpg",
                AllowDrop = false,
                Value = "99"
            });
            nodeSuite.ChildNodes.Add(new Node()
            {
                Text = "ComboBox",
                ImageUrl = "img/vista-download-icon.jpg",
                AllowDrop = false,
                Value = "99"
            });
            nodeSuite.ChildNodes.Add(new Node()
            {
                Text = "Ajax Page",
                ImageUrl = "img/vista-download-icon.jpg",
                AllowDrop = false,
                Value = "0"
            });
            nodeSuite.ChildNodes.Add(new Node()
            {
                Text = "Show",
                ImageUrl = "img/vista-download-icon.jpg",
                AllowDrop = false,
                Value = "0"
            });
            nodeSuite.ChildNodes.Add(new Node()
            {
                Text = "Interface Controls",
                ImageUrl = "img/vista-download-icon.jpg",
                AllowDrop = false,
                Value = "0"
            });

            ObTree.TreeNodeDrop += new NodeDropEventHandler(ObTree_TreeNodeDrop);
            
            this.TreePlaceHolder.Controls.Add(ObTree);

        }
        void Page_load(object sender, EventArgs e)
        {
            grid1.FolderStyle = "~/grid/styles/black_glass";
            grid1.DataSource = this.CheckoutList;
        }
        protected override void OnPreRender(EventArgs e)
        {
            grid1.DataBind();
            base.OnPreRender(e);
        }
        protected void ObTree_TreeNodeDrop(object sender, Obout.Ajax.UI.TreeView.NodeDropEventArgs e)
        {
            System.Collections.Generic.List<ShoppingCartRow> source = CheckoutList;
            ShoppingCartRow item = source.Find(delegate(ShoppingCartRow row)
            {
                return row.ProductName == e.SourceNode.Text;
            });
            if (item == null)
            {
                source.Add(new ShoppingCartRow(e.SourceNode.Text, double.Parse(e.SourceNode.Value), 1));
            }
            else
            {
                item.Quantity++;
            }
            CheckoutList = source;

            grid1.DataSource = this.CheckoutList;
        }
        void DeleteRecord(object sender, GridRecordEventArgs e)
        {
            System.Collections.Generic.List<ShoppingCartRow> source = CheckoutList;
            ShoppingCartRow item = source.Find(delegate(ShoppingCartRow row)
            {
                return row.ProductName == e.Record["ProductName"].ToString();
            });
            source.Remove(item);
            CheckoutList = source;

            grid1.DataSource = this.CheckoutList;
        }
        public string GetTotal(object price, object qty)
        {
            return (Convert.ToDecimal(price) * Convert.ToInt32(qty)).ToString();
        }

        double totalPrice = 0;
        public void RowDataBound(object sender, GridRowEventArgs e)
        {
            if (e.Row.RowType == GridRowType.DataRow)
            {
                totalPrice += (double.Parse(e.Row.Cells[1].Text) * int.Parse(e.Row.Cells[2].Text));
            }
            else if (e.Row.RowType == GridRowType.ColumnFooter)
            {
                e.Row.Cells[2].Text = "Total:";
                e.Row.Cells[3].Text = "$" + totalPrice.ToString();
                totalPrice = 0;
            }
        }


        public System.Collections.Generic.List<ShoppingCartRow> CheckoutList
        {
            get
            {
                if (ViewState["Checkout"] == null)
                    return new System.Collections.Generic.List<ShoppingCartRow>();
                else
                    return ViewState["Checkout"] as System.Collections.Generic.List<ShoppingCartRow>;
            }
            set
            {
                ViewState["Checkout"] = value;
            }
        }
        [Serializable]
        public class ShoppingCartRow
        {
            public ShoppingCartRow(string pname, double pprice, int qty)
            {
                this._productName = pname;
                this._price = pprice;
                this._quantity = qty;
            }
            private string _productName;
            public string ProductName
            {
                get
                {
                    return this._productName;
                }
                set
                {
                    this._productName = value;
                }
            }

            private double _price;
            public double Price
            {
                get
                {
                    return this._price;
                }
                set
                {
                    this._price = value;
                }
            }

            private int _quantity;
            public int Quantity
            {
                get
                {
                    return this._quantity;
                }
                set
                {
                    this._quantity = value;
                }
            }
        }  
   
    </script>

    <style type="text/css">
        .tb_sample
        {
            width: 100%;
        }
        .tb_sample td
        {
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
    <h2>
        ASP.NET TreeView - Shopping Cart demo with obout Grid
    </h2>
    <div class="h5">
        Checkout the products just by drag and drop the products in the grid.</div>
    <br />
    <table class="tb_sample">
        <tr>
            <td>
                <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
            </td>
            <td>
                <asp:Panel ID="GridPanel" runat="server">
                    <obout:Grid ID="grid1" CallbackMode="false" Serialize="false" ShowFooter="false"
                        runat="server" FolderStyle="styles/black_glass" AutoGenerateColumns="false" AllowSorting="false"
                        OnRowDataBound="RowDataBound" OnDeleteCommand="DeleteRecord" ShowColumnsFooter="true">
                        <Columns>
                            <obout:Column ID="Column1" Width="100" DataField="ProductName" ReadOnly="true" HeaderText="Product Name"
                                runat="server" />
                            <obout:Column ID="Column2" Width="100" DataField="Price" HeaderText="UnitPrice" runat="server" />
                            <obout:Column ID="Column3" Width="50" DataField="Quantity" HeaderText="Qty" runat="server" />
                            <obout:Column ID="Column4" Width="100" HeaderText="Price" runat="server">
                                <TemplateSettings TemplateId="TemplateTotalPrice" EditTemplateId="TemplateEditCountry" />
                            </obout:Column>
                            <obout:Column ID="Column5" Width="100" HeaderText="Delete" AllowDelete="true" runat="server" />
                        </Columns>
                        <Templates>
                            <obout:GridTemplate ID="TemplateTotalPrice" runat="server">
                                <Template>
                                    <%# GetTotal(Container.DataItem["Price"],Container.DataItem["Quantity"])%>
                                </Template>
                            </obout:GridTemplate>
                        </Templates>
                    </obout:Grid>
                </asp:Panel>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
