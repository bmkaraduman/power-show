<%@ Page Language="VB" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Shopping Cart demo with obout Grid</title>

    <script language="VB" runat="server">
        Private ObTree As Tree = Nothing
        Private Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)

            ObTree = New Tree() With {.ID = "ObTree", .NodeDropTargets = "GridPanel", .CssClass = "vista", .EnableDragAndDrop = True}

            Dim nodeSuite As New Node() With {.ImageUrl = "img/ob_product.png", .Text = "oboutSuite", .AllowDrop = False, .Expanded = True, .Value = "199"}
            Me.ObTree.Nodes.Add(nodeSuite)

            nodeSuite.ChildNodes.Add(New Node() With {.Text = "TreeView", .ImageUrl = "img/vista-download-icon.jpg", .AllowDrop = False, .Value = "99"})
            nodeSuite.ChildNodes.Add(New Node() With {.Text = "Grid", .ImageUrl = "img/vista-download-icon.jpg", .AllowDrop = False, .Value = "99"})
            nodeSuite.ChildNodes.Add(New Node() With {.Text = "Calendar", .ImageUrl = "img/vista-download-icon.jpg", .AllowDrop = False, .Value = "99"})
            nodeSuite.ChildNodes.Add(New Node() With {.Text = "HTMLEditor", .ImageUrl = "img/vista-download-icon.jpg", .AllowDrop = False, .Value = "99"})
            nodeSuite.ChildNodes.Add(New Node() With {.Text = "SlideMenu", .ImageUrl = "img/vista-download-icon.jpg", .AllowDrop = False, .Value = "99"})
            nodeSuite.ChildNodes.Add(New Node() With {.Text = "EasyMenu", .ImageUrl = "img/vista-download-icon.jpg", .AllowDrop = False, .Value = "99"})
            nodeSuite.ChildNodes.Add(New Node() With {.Text = "ComboBox", .ImageUrl = "img/vista-download-icon.jpg", .AllowDrop = False, .Value = "99"})
            nodeSuite.ChildNodes.Add(New Node() With {.Text = "Ajax Page", .ImageUrl = "img/vista-download-icon.jpg", .AllowDrop = False, .Value = "0"})
            nodeSuite.ChildNodes.Add(New Node() With {.Text = "Show", .ImageUrl = "img/vista-download-icon.jpg", .AllowDrop = False, .Value = "0"})
            nodeSuite.ChildNodes.Add(New Node() With {.Text = "Interface Controls", .ImageUrl = "img/vista-download-icon.jpg", .AllowDrop = False, .Value = "0"})

            AddHandler ObTree.TreeNodeDrop, AddressOf ObTree_TreeNodeDrop

            Me.TreePlaceHolder.Controls.Add(ObTree)

        End Sub
        Private Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
            grid1.FolderStyle = "~/grid/styles/black_glass"
            grid1.DataSource = Me.CheckoutList
        End Sub
        Protected Overrides Sub OnPreRender(ByVal e As EventArgs)
            grid1.DataBind()
            MyBase.OnPreRender(e)
        End Sub
        Protected Sub ObTree_TreeNodeDrop(ByVal sender As Object, ByVal e As Obout.Ajax.UI.TreeView.NodeDropEventArgs)
            Dim source As System.Collections.Generic.List(Of ShoppingCartRow) = CheckoutList
            Dim item As ShoppingCartRow = source.Find(Function(row As ShoppingCartRow) row.ProductName = e.SourceNode.Text)
            If item Is Nothing Then
                source.Add(New ShoppingCartRow(e.SourceNode.Text, Double.Parse(e.SourceNode.Value), 1))
            Else
                item.Quantity += 1
            End If
            CheckoutList = source

            grid1.DataSource = Me.CheckoutList
        End Sub
        Private Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
            Dim source As System.Collections.Generic.List(Of ShoppingCartRow) = CheckoutList
            Dim item As ShoppingCartRow = source.Find(Function(row As ShoppingCartRow) row.ProductName = e.Record("ProductName").ToString())
            source.Remove(item)
            CheckoutList = source

            grid1.DataSource = Me.CheckoutList
        End Sub
        Public Function GetTotal(ByVal price As Object, ByVal qty As Object) As String
            Return (Convert.ToDecimal(price) * Convert.ToInt32(qty)).ToString()
        End Function

        Private totalPrice As Double = 0
        Public Sub RowDataBound(ByVal sender As Object, ByVal e As GridRowEventArgs)
            If e.Row.RowType = GridRowType.DataRow Then
                totalPrice += (Double.Parse(e.Row.Cells(1).Text) * Integer.Parse(e.Row.Cells(2).Text))
            ElseIf e.Row.RowType = GridRowType.ColumnFooter Then
                e.Row.Cells(2).Text = "Total:"
                e.Row.Cells(3).Text = "$" & totalPrice.ToString()
                totalPrice = 0
            End If
        End Sub


        Public Property CheckoutList() As System.Collections.Generic.List(Of ShoppingCartRow)
            Get
                If ViewState("Checkout") Is Nothing Then
                    Return New System.Collections.Generic.List(Of ShoppingCartRow)()
                Else
                    Return TryCast(ViewState("Checkout"), System.Collections.Generic.List(Of ShoppingCartRow))
                End If
            End Get
            Set(ByVal value As System.Collections.Generic.List(Of ShoppingCartRow))
                ViewState("Checkout") = value
            End Set
        End Property
        <Serializable()> _
        Public Class ShoppingCartRow
            Public Sub New(ByVal pname As String, ByVal pprice As Double, ByVal qty As Integer)
                Me._productName = pname
                Me._price = pprice
                Me._quantity = qty
            End Sub
            Private _productName As String
            Public Property ProductName() As String
                Get
                    Return Me._productName
                End Get
                Set(ByVal value As String)
                    Me._productName = value
                End Set
            End Property

            Private _price As Double
            Public Property Price() As Double
                Get
                    Return Me._price
                End Get
                Set(ByVal value As Double)
                    Me._price = value
                End Set
            End Property

            Private _quantity As Integer
            Public Property Quantity() As Integer
                Get
                    Return Me._quantity
                End Get
                Set(ByVal value As Integer)
                    Me._quantity = value
                End Set
            End Property
        End Class
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
                                    <%#GetTotal(Container.DataItem("Price"),Container.DataItem("Quantity"))%>
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
