Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_customization_extra_heading
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.DataSourceID = "SqlDataSource1"
        grid1.FolderStyle = "styles/black_glass"
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False

        Dim HeadingTemplate As GridRuntimeTemplate = New GridRuntimeTemplate()
        HeadingTemplate.ID = "HeadingTemplate1"
        HeadingTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(HeadingTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateHeadingTemplate
        '------------------------------------------------------------------------

        grid1.Templates.Add(HeadingTemplate)

        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.Visible = False

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "SHIP NAME"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "SHIP CITY"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = ""
        oCol5.HeaderText = "SHIP COUNTRY"

        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        grid1.TemplateSettings.HeadingTemplateId = "HeadingTemplate1"

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)

    End Sub

    Sub CreateHeadingTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindHeadingTemplate

    End Sub
    Sub DataBindHeadingTemplate(ByVal sender As Object, ByVal e As EventArgs)

        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "Orders List"

    End Sub
End Class
