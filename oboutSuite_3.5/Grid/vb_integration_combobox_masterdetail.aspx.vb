Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid
Imports Obout.ComboBox

Partial Class Grid_vb_integration_combobox_masterdetail
    Inherits System.Web.UI.Page
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "Grid1"
        grid1.DataSourceID = "SqlDataSource1"
        grid1.AutoGenerateColumns = False

        Dim ViewEmployeeTemplate As Obout.Grid.GridRuntimeTemplate
        ViewEmployeeTemplate = New GridRuntimeTemplate()
        ViewEmployeeTemplate.ID = "ViewEmployeeTemplate"
        ViewEmployeeTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(ViewEmployeeTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateViewEmployeeTemplate
        '------------------------------------------------------------------------
        Dim EditEmployeeTemplate As Obout.Grid.GridRuntimeTemplate
        EditEmployeeTemplate = New GridRuntimeTemplate()
        EditEmployeeTemplate.ID = "EditEmployeeTemplate"
        EditEmployeeTemplate.ControlID = "EmployeesCombo"
        EditEmployeeTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(EditEmployeeTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateEditEmployeeTemplate
        '------------------------------------------------------------------------

        grid1.Templates.Add(ViewEmployeeTemplate)
        grid1.Templates.Add(EditEmployeeTemplate)

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
        oCol4.DataField = "ShipCountry"
        oCol4.HeaderText = "SHIP COUNTRY"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "EmployeeName"
        oCol5.Visible = False

        Dim oCol6 As Column = New Column()
        oCol6.DataField = "PositionID"
        oCol6.Visible = False

        Dim oCol7 As Column = New Column()
        oCol7.DataField = "EmployeeID"
        oCol7.HeaderText = "EMPLOYEE"
        oCol7.TemplateSettings.TemplateId = "ViewEmployeeTemplate"
        oCol7.TemplateSettings.EditTemplateId = "EditEmployeeTemplate"

        Dim oCol8 As Column = New Column()
        oCol8.AllowDelete = True
        oCol8.AllowEdit = True

        grid1.ClientSideEvents.OnBeforeClientEdit = "Grid1_Edit"
        grid1.ClientSideEvents.ExposeSender = True

        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)
        grid1.Columns.Add(oCol7)
        grid1.Columns.Add(oCol8)

        phGrid1.Controls.Add(grid1)

    End Sub
    Sub CreateViewEmployeeTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindViewEmployeeTemplate

    End Sub
    Sub DataBindViewEmployeeTemplate(ByVal sender As Object, ByVal e As EventArgs)

        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = oContainer.DataItem("EmployeeName").ToString()

    End Sub
    '------------------------------------------------------------------------
    Sub CreateEditEmployeeTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim ph1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(ph1)

        Dim comboBox As ComboBox = New ComboBox()
        comboBox.ID = "PositionsCombo"
        comboBox.Width = Unit.Percentage(100)
        comboBox.Height = Unit.Pixel(150)
        comboBox.AutoClose = False
        comboBox.EmptyText = "Select an employee ..."
        comboBox.AppendDataBoundItems = False
        comboBox.DataSourceID = "sds1"
        comboBox.DataValueField = "PositionID"
        comboBox.DataTextField = "PositionName"

        comboBox.HeaderTemplate = New HeaderTemplate("POSITIONS")

        Dim EmployeesCombo As ComboBox = New ComboBox()
        EmployeesCombo.ID = "EmployeesCombo"
        EmployeesCombo.Width = Unit.Pixel(200)
        EmployeesCombo.Height = Unit.Pixel(150)
        EmployeesCombo.EnableLoadOnDemand = True
        AddHandler EmployeesCombo.LoadingItems, AddressOf Detail_LoadingItems
        EmployeesCombo.EmptyText = "Select an employee ..."
        EmployeesCombo.DataSourceID = "sds2"
        EmployeesCombo.DataTextField = "EmployeeName"
        EmployeesCombo.DataValueField = "EmployeeID"

        EmployeesCombo.HeaderTemplate = New HeaderTemplate("EMPLOYEES")

        comboBox.Details.Add(EmployeesCombo)

        ph1.Controls.Add(comboBox)
    End Sub

    Sub Detail_LoadingItems(ByVal sender As Object, ByVal e As ComboBoxLoadingItemsEventArgs)

        If Not String.IsNullOrEmpty(e.Text) Then

            Dim tryout As Integer = 0
            If Integer.TryParse(e.Text, tryout) Then
                sds2.SelectParameters(0).DefaultValue = e.Text
            End If

        End If
    End Sub

    Public Class HeaderTemplate
        Implements ITemplate

        Private _headerText As String = ""
        Public Sub New(ByVal headerText As String)
            _headerText = headerText
        End Sub
        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim header1 As Literal = New Literal()
            header1.Text = "<div class=""header"">" + _headerText + "</div>"
            container.Controls.Add(header1)
        End Sub
    End Class
End Class

