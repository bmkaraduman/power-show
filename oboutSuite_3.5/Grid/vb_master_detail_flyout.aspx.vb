Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_master_detail_flyout
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()
    Dim grid2 As DetailGrid = New DetailGrid()
    Dim grid3 As DetailGrid = New DetailGrid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ' Creating grid1
        grid1.ID = "grid1"
        grid1.AutoGenerateColumns = False
        grid1.DataSourceID = "sds1"
        grid1.FolderStyle = "styles/black_glass"
        grid1.AllowAddingRecords = False

        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback

        ' creating the template for the Company name column (view mode)
        '------------------------------------------------------------------------
        Dim Template1 As Obout.Grid.GridRuntimeTemplate
        Template1 = New GridRuntimeTemplate()
        Template1.ID = "Template1"
        Template1.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(Template1.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateTemplate1
        '------------------------------------------------------------------------

        Dim Template2 As Obout.Grid.GridRuntimeTemplate
        Template2 = New GridRuntimeTemplate()
        Template2.ID = "Template2"
        Template2.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(Template2.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateTemplate2
        '------------------------------------------------------------------------

        Dim Template3 As Obout.Grid.GridRuntimeTemplate
        Template3 = New GridRuntimeTemplate()
        Template3.ID = "Template3"
        Template3.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(Template3.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateTemplate3
        '------------------------------------------------------------------------

        grid1.Templates.Add(Template1)
        grid2.Templates.Add(Template2)
        grid3.Templates.Add(Template3)

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "CustomerID"
        oCol1.HeaderText = "CUSTOMER ID"
        oCol1.Visible = False

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "250"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ContactName"
        oCol3.HeaderText = "CONTACT NAME"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "Country"
        oCol4.HeaderText = "COUNTRY"

        Dim oCol5 As Column = New Column()
        oCol5.HeaderText = "INFO"
        oCol5.Width = "115"
        oCol5.TemplateSettings.TemplateId = "Template1"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        ' Creating grid2
        grid2.ID = "grid2"
        grid2.AutoGenerateColumns = False
        grid2.FolderStyle = "styles/black_glass"
        grid2.AllowAddingRecords = False
        grid2.ShowFooter = True
        grid2.AllowPageSizeSelection = False
        grid2.DataSourceID = "sds2"
        grid2.ForeignKeys = "CustomerID"
        grid2.AllowPaging = False

        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback


        ' creating the columns
        Dim oCol2_1 As Column = New Column()
        oCol2_1.DataField = "CustomerID"
        oCol2_1.HeaderText = "CUSTOMER ID"
        oCol2_1.Visible = False
        oCol2_1.ReadOnly = True

        Dim oCol2_2 As Column = New Column()
        oCol2_2.DataField = "OrderID"
        oCol2_2.HeaderText = "ORDER ID"
        oCol2_2.Visible = False
        oCol2_1.ReadOnly = True

        Dim oCol2_3 As Column = New Column()
        oCol2_3.DataField = "OrderDate"
        oCol2_3.HeaderText = "ORDER DATE"
        oCol2_3.DataFormatString = "{0:MM/dd/yyyy}"
        oCol2_3.Width = "220"

        Dim oCol2_4 As Column = New Column()
        oCol2_4.DataField = "ShippedDate"
        oCol2_4.HeaderText = "SHIPPED DATE"
        oCol2_4.DataFormatString = "{0:MM/dd/yyyy}"

        Dim oCol2_5 As Column = New Column()
        oCol2_5.DataField = "Freight"
        oCol2_5.HeaderText = "FREIGHT"
        oCol2_5.DataFormatString = "{0:C2}"

        Dim oCol2_6 As Column = New Column()
        oCol2_6.HeaderText = "INFO"
        oCol2_6.Width = "115"
        oCol2_6.TemplateSettings.TemplateId = "Template2"

        ' add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_1)
        grid2.Columns.Add(oCol2_2)
        grid2.Columns.Add(oCol2_3)
        grid2.Columns.Add(oCol2_4)
        grid2.Columns.Add(oCol2_5)
        grid2.Columns.Add(oCol2_6)

        grid1.DetailGrids.Add(grid2)


        ' Creating grid3
        grid3.ID = "grid3"
        grid3.AutoGenerateColumns = False
        grid3.FolderStyle = "styles/black_glass"
        grid3.AllowAddingRecords = False
        grid3.ShowFooter = True
        grid3.AllowPageSizeSelection = False
        grid3.DataSourceID = "sds3"
        grid3.ForeignKeys = "OrderID"
        grid3.AllowPaging = False


        ' creating the columns
        Dim oCol3_1 As Column = New Column()
        oCol3_1.DataField = "OrderID"
        oCol3_1.HeaderText = "ORDER ID"
        oCol3_1.Visible = False
        oCol3_1.ReadOnly = True

        Dim oCol3_2 As Column = New Column()
        oCol3_2.DataField = "ProductID"
        oCol3_2.HeaderText = "PRODUCT ID"
        oCol3_2.Visible = False
        oCol3_2.ReadOnly = True

        Dim oCol3_3 As Column = New Column()
        oCol3_3.DataField = "UnitPrice"
        oCol3_3.HeaderText = "UNIT PRICE"
        oCol3_3.DataFormatString = "{0:C2}"
        oCol3_3.Width = "180"

        Dim oCol3_4 As Column = New Column()
        oCol3_4.DataField = "Quantity"
        oCol3_4.HeaderText = "QUANTITY"
        oCol3_4.Width = "185"

        Dim oCol3_5 As Column = New Column()
        oCol3_5.DataField = "Discount"
        oCol3_5.HeaderText = "DISCOUNT"
        oCol3_5.DataFormatString = "{0:F2}%"
        oCol3_5.Width = "175"

        Dim oCol3_6 As Column = New Column()
        oCol3_6.HeaderText = "INFO"
        oCol3_6.Width = "115"
        oCol3_6.TemplateSettings.TemplateId = "Template3"

        ' add the columns to the Columns collection of the grid
        grid3.Columns.Add(oCol3_1)
        grid3.Columns.Add(oCol3_2)
        grid3.Columns.Add(oCol3_3)
        grid3.Columns.Add(oCol3_4)
        grid3.Columns.Add(oCol3_5)
        grid3.Columns.Add(oCol3_6)

        grid2.DetailGrids.Add(grid3)


        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)

    End Sub
    Sub CreateTemplate1(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindTemplate1

    End Sub
    Sub DataBindTemplate1(ByVal sender As Object, ByVal e As EventArgs)

        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<span class=""tdTextLink"" id=""grid_link1_" + oContainer.DataItem("CustomerID") + """ onmouseover=""attachFlyout1ToLink(grid1, this, " + oContainer.PageRecordIndex.ToString() + ") "" onmouseout=""closeFlyout1()"">More info...</span>"

    End Sub
    '------------------------------------------------------------------------

    Sub CreateTemplate2(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindTemplate2

    End Sub

    Sub DataBindTemplate2(ByVal sender As Object, ByVal e As EventArgs)

        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<span class=""tdTextLink"" id=""grid_link2_" + oContainer.DataItem("OrderID") + """ onmouseover=""attachFlyout2ToLink(" + oContainer.GridClientID.ToString() + ", this," + oContainer.PageRecordIndex.ToString() + ") "" onmouseout=""closeFlyout2()"">More info...</span>"

    End Sub
    '------------------------------------------------------------------------
    Sub CreateTemplate3(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindTemplate3

    End Sub

    Sub DataBindTemplate3(ByVal sender As Object, ByVal e As EventArgs)

        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<span class=""tdTextLink"" id=""grid_link3_" + oContainer.DataItem("ProductID") + """ onmouseover=""attachFlyout3ToLink(" + oContainer.GridClientID.ToString() + ", this," + oContainer.PageRecordIndex.ToString() + ") "" onmouseout=""closeFlyout3()"">More info...</span>"

    End Sub

End Class
