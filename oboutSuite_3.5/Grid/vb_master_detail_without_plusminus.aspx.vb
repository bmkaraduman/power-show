Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_master_detail_without_plusminus
    Inherits System.Web.UI.Page
    Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim grid2 As Obout.Grid.DetailGrid = New DetailGrid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.AutoGenerateColumns = False
        grid1.PageSize = 5
        grid1.AllowAddingRecords = False
        grid1.DataSourceID = "sds1"
        grid1.AllowPageSizeSelection = False

        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback
        grid1.TemplateSettings.RowEditTemplateId = "tplRowEditMaster"

        Dim TemplateExpand As Obout.Grid.GridRuntimeTemplate
        TemplateExpand = New GridRuntimeTemplate()
        TemplateExpand.ID = "TemplateExpand"
        TemplateExpand.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(TemplateExpand.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateExpandTemplate
        '------------------------------------------------------------------------

        grid1.Templates.Add(TemplateExpand)

        Dim oCol0 As Column = New Column()
        oCol0.HeaderText = ""
        oCol0.Width = "110"
        oCol0.TemplateSettings.TemplateId = "TemplateExpand"

        Dim oCol1 As Column = New Column()
        oCol1.DataField = "CustomerID"
        oCol1.HeaderText = "CUSTOMER ID"
        oCol1.Visible = False

        Dim oCol2 As New Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "200"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ContactName"
        oCol3.HeaderText = "CONTACT NAME"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "Country"
        oCol4.HeaderText = "COUNTRY"
        oCol4.Width = "125"


        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol0)
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)


        grid2.ID = "Grid2"
        grid2.AutoGenerateColumns = False
        grid2.EnableTypeValidation = False
        grid2.AllowAddingRecords = False
        grid2.ShowFooter = True
        grid2.PageSize = 5
        grid2.DataSourceID = "sds2"
        grid2.ForeignKeys = "CustomerID"
        grid2.AllowPageSizeSelection = False

        grid2.ClientSideEvents.ExposeSender = True
        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback

      
        ' creating the columns
        Dim oCol2_1 As Column = New Column()
        oCol2_1.DataField = "CustomerID"
        oCol2_1.HeaderText = "CUSTOMER ID"
        oCol2_1.Visible = False
        oCol2_1.ReadOnly = False

        Dim oCol2_2 As Column = New Column()
        oCol2_2.DataField = "OrderID"
        oCol2_2.HeaderText = "ORDER ID"
        oCol2_2.Visible = False
        oCol2_2.ReadOnly = False

        Dim oCol2_3 As Column = New Column()
        oCol2_3.DataField = "ShipName"
        oCol2_3.HeaderText = "NAME"
        oCol2_3.Width = "250"

        Dim oCol2_4 As Column = New Column()
        oCol2_4.DataField = "ShipCity"
        oCol2_4.HeaderText = "CITY"
        oCol2_4.Width = "170"

        Dim oCol2_5 As Column = New Column()
        oCol2_5.DataField = "ShipCountry"
        oCol2_5.HeaderText = "COUNTRY"
        oCol2_5.DataFormatString = "{0:C2}"
        oCol2_5.Width = "150"


        ' add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_1)
        grid2.Columns.Add(oCol2_2)
        grid2.Columns.Add(oCol2_3)
        grid2.Columns.Add(oCol2_4)
        grid2.Columns.Add(oCol2_5)

        grid1.DetailGrids.Add(grid2)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)

    End Sub

    Sub CreateExpandTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
       
        Dim expand As Literal = New Literal()
        Dim oContainer As Obout.Grid.TemplateContainer = CType(expand.NamingContainer, Obout.Grid.TemplateContainer)
        expand.Text = "<a href=""javascript: //"" onclick=""showDetails(event, this);"" class=""visible"">View Details</a><a href=""javascript: //"" onclick=""hideDetails(event, this);"" class=""hidden"">Close Details</a>"

        e.Container.Controls.Add(expand)
    End Sub

End Class
