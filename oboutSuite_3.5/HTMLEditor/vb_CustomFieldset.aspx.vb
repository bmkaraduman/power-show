Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports Obout.Ajax.UI.HTMLEditor
Imports Obout.Ajax.UI.HTMLEditor.ToolbarButton
Imports Obout.Ajax.UI.HTMLEditor.Popups
Imports Obout.Ajax.UI.HTMLEditor.ContextMenu
Imports System.Collections.ObjectModel
Imports System.Globalization


Partial Public Class HTMLEditor_vb_CustomFieldset
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
        ' add separator to the top toolbar
        editor.TopToolbar.AddButtons.Add(New HorizontalSeparator())
        ' add our custom 'Insert Fieldset' button to the top toolbar
        editor.TopToolbar.AddButtons.Add(New InsertFieldset())

        ' Add custom item to the context menu - edit Fieldset properties
        editor.EditPanel.ContextMenu.AddItems.Add(New EditFieldsetItem())
        ' Add custom item to the context menu - remove Fieldset element
        editor.EditPanel.ContextMenu.AddItems.Add(New RemoveFieldsetItem())
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Not Page.IsPostBack Then
            Dim input As StreamReader

            input = New StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII)
            editor.Content = input.ReadToEnd()
            input.Close()
        End If
    End Sub

    ' Custom 'Insert Fieldset' button
    <ParseChildren(True)> _
    <PersistChildren(False)> _
    Public Class InsertFieldset
        Inherits OpenPopupButton
#Region "[ Properties ]"

        ' tooltip if not found in Localization
        Public Overrides ReadOnly Property DefaultToolTip() As String
            Get
                Return "Insert Fieldset"
            End Get
        End Property

        ' associated popup (custom popup declared below)
        Public Overrides Property RelatedPopup() As Popup
            Get
                If MyBase.RelatedPopup Is Nothing Then
                    MyBase.RelatedPopup = New FieldsetProperties()
                End If
                Return MyBase.RelatedPopup
            End Get
            Protected Set(ByVal value As Popup)
                MyBase.RelatedPopup = value
            End Set
        End Property

        ' custom buttons images folder
        Protected Overrides Property ButtonImagesFolder() As String
            Get
                Return "~/App_Obout/HTMLEditor/customButtons/"
            End Get
            Set(ByVal value As String)
                MyBase.ButtonImagesFolder = value
            End Set
        End Property

        ' base name of this button image,
        Protected Overrides ReadOnly Property BaseImageName() As String
            Get
                Return "ed_insertFieldset"
            End Get
        End Property

#End Region
    End Class

    ' custom 'Fieldset properties' popup
    <ParseChildren(True)> _
    Public Class FieldsetProperties
        Inherits OkCancelPopup
#Region "[ Fields ]"

        Private _Width As TextBox = Nothing
        Private WidthUnitToggle As PopupUnitToggle = Nothing
        Private _Height As TextBox = Nothing
        Private HeightUnitToggle As PopupUnitToggle = Nothing
        Private _Padding As TextBox = Nothing
        Private _Margin As TextBox = Nothing

#End Region

#Region "[ Properties ]"

        ' what client-side type to initiate (it is declared in the ASPX file)
        Protected Overrides ReadOnly Property ClientControlType() As String
            Get
                Return "CustomPopup.FieldsetProperties"
            End Get
        End Property

        Protected Overridable ReadOnly Property Padding() As TextBox
            ' Field in the popup
            Get
                If _Padding Is Nothing Then
                    _Padding = New TextBox()
                    _Padding.Style("width") = "30px"
                    _Padding.Style("height") = "15px"
                    _Padding.MaxLength = 4
                End If
                Return _Padding
            End Get
        End Property

        Protected Overridable ReadOnly Property Margin() As TextBox
            ' Field in the popup
            Get
                If _Margin Is Nothing Then
                    _Margin = New TextBox()
                    _Margin.Style("width") = "30px"
                    _Margin.Style("height") = "15px"
                    _Margin.MaxLength = 4
                End If
                Return _Margin
            End Get
        End Property

        Protected Overridable ReadOnly Property FieldsetWidth() As TextBox
            ' Field in the popup
            Get
                If _Width Is Nothing Then
                    _Width = New TextBox()
                    _Width.Style("width") = "30px"
                    _Width.Style("height") = "15px"
                    _Width.MaxLength = 4
                End If
                Return _Width
            End Get
        End Property

        Protected Overridable ReadOnly Property FieldsetHeight() As TextBox
            ' Field in the popup
            Get
                If _Height Is Nothing Then
                    _Height = New TextBox()
                    _Height.Style("width") = "30px"
                    _Height.Style("height") = "15px"
                    _Height.MaxLength = 4
                End If
                Return _Height
            End Get
        End Property

        ' Title of the popup if not found in Localization
        Protected Overrides ReadOnly Property DefaultTitle() As String
            Get
                Return "Fieldset properties"
            End Get
        End Property

        ' this popup is not attached to the button
        Protected Overrides ReadOnly Property AttachedToButton() As Boolean
            Get
                Return False
            End Get
        End Property

#End Region

#Region "[ Methods ]"

        ' fill the content of the popup
        Protected Overrides Sub OkCancelFillContent()
            Dim table As New Table()
            Dim holder As HtmlGenericControl
            table.Attributes.Add("border", "0")
            table.Attributes.Add("cellspacing", "0")
            table.Attributes.Add("cellpadding", "2")

            Dim row As TableRow
            Dim cell As TableCell

            Dim tableInner As Table
            Dim rowInner As TableRow
            Dim cellInner As TableCell

            Dim tableInner2 As Table
            Dim rowInner2 As TableRow
            Dim cellInner2 As TableCell

            row = New TableRow()
            table.Rows.Add(row)

            cell = New TableCell()
            row.Cells.Add(cell)
            cell.HorizontalAlign = HorizontalAlign.Left
            cell.VerticalAlign = VerticalAlign.Top

            tableInner = New Table()
            tableInner.Attributes.Add("border", "0")
            tableInner.Attributes.Add("cellspacing", "0")
            tableInner.Attributes.Add("cellpadding", "2")
            cell.Controls.Add(tableInner)

            If FieldsetWidth IsNot Nothing Then
                ' the property is not overridden to 'null'
                rowInner = New TableRow()
                tableInner.Rows.Add(rowInner)

                cellInner = New TableCell()
                rowInner.Cells.Add(cellInner)
                holder = New HtmlGenericControl("span")
                cellInner.Controls.Add(holder)
                holder.Controls.Add(New LiteralControl(GetField("Width", "Width")))
                ' check for localization
                cellInner.Controls.Add(New LiteralControl(": "))
                cellInner.HorizontalAlign = HorizontalAlign.Left
                cellInner.VerticalAlign = VerticalAlign.Middle

                cellInner = New TableCell()
                cellInner.HorizontalAlign = HorizontalAlign.Left
                cellInner.VerticalAlign = VerticalAlign.Middle
                cellInner.Style(HtmlTextWriterStyle.WhiteSpace) = "nowrap"
                rowInner.Cells.Add(cellInner)

                tableInner2 = New Table()
                tableInner2.Attributes.Add("border", "0")
                tableInner2.Attributes.Add("cellspacing", "0")
                tableInner2.Attributes.Add("cellpadding", "0")
                cellInner.Controls.Add(tableInner2)
                rowInner2 = New TableRow()
                tableInner2.Rows.Add(rowInner2)

                cellInner2 = New TableCell()
                cellInner2.HorizontalAlign = HorizontalAlign.Left
                cellInner2.VerticalAlign = VerticalAlign.Middle
                cellInner2.Style(HtmlTextWriterStyle.WhiteSpace) = "nowrap"
                rowInner2.Cells.Add(cellInner2)
                FieldsetWidth.Style(HtmlTextWriterStyle.VerticalAlign) = "middle"
                cellInner2.Controls.Add(FieldsetWidth)

                cellInner2 = New TableCell()
                cellInner2.HorizontalAlign = HorizontalAlign.Left
                cellInner2.VerticalAlign = VerticalAlign.Middle
                cellInner2.Style(HtmlTextWriterStyle.WhiteSpace) = "nowrap"
                rowInner2.Cells.Add(cellInner2)
                WidthUnitToggle = New PopupUnitToggle()
                ' "px/%" toggle button
                WidthUnitToggle.Name = "widthUnitToggle"
                cellInner2.Controls.Add(WidthUnitToggle)
            End If
            If Margin IsNot Nothing Then
                ' the property is not overridden to 'null'
                rowInner = New TableRow()
                tableInner.Rows.Add(rowInner)

                cellInner = New TableCell()
                rowInner.Cells.Add(cellInner)
                holder = New HtmlGenericControl("span")
                cellInner.Controls.Add(holder)
                holder.Controls.Add(New LiteralControl(GetField("Margin", "Margin")))
                ' check for localization
                cellInner.HorizontalAlign = HorizontalAlign.Left
                cellInner.VerticalAlign = VerticalAlign.Middle
                cellInner.Controls.Add(New LiteralControl(": "))

                cellInner = New TableCell()
                cellInner.HorizontalAlign = HorizontalAlign.Left
                cellInner.VerticalAlign = VerticalAlign.Middle
                cellInner.Style(HtmlTextWriterStyle.WhiteSpace) = "nowrap"
                rowInner.Cells.Add(cellInner)
                Margin.Style(HtmlTextWriterStyle.VerticalAlign) = "middle"
                cellInner.Controls.Add(Margin)
                cellInner.Controls.Add(New LiteralControl("&nbsp;px"))
            End If

            cell = New TableCell()
            row.Cells.Add(cell)
            cell.HorizontalAlign = HorizontalAlign.Left
            cell.VerticalAlign = VerticalAlign.Top

            tableInner = New Table()
            tableInner.Attributes.Add("border", "0")
            tableInner.Attributes.Add("cellspacing", "0")
            tableInner.Attributes.Add("cellpadding", "2")
            cell.Controls.Add(tableInner)

            If FieldsetHeight IsNot Nothing Then
                ' the property is not overridden to 'null'
                rowInner = New TableRow()
                tableInner.Rows.Add(rowInner)

                cellInner = New TableCell()
                rowInner.Cells.Add(cellInner)
                holder = New HtmlGenericControl("span")
                cellInner.Controls.Add(holder)
                holder.Controls.Add(New LiteralControl(GetField("Height", "Height")))
                ' check for localization
                cellInner.Controls.Add(New LiteralControl(": "))
                cellInner.HorizontalAlign = HorizontalAlign.Left
                cellInner.VerticalAlign = VerticalAlign.Middle

                cellInner = New TableCell()
                cellInner.HorizontalAlign = HorizontalAlign.Left
                cellInner.VerticalAlign = VerticalAlign.Middle
                cellInner.Style(HtmlTextWriterStyle.WhiteSpace) = "nowrap"
                rowInner.Cells.Add(cellInner)

                tableInner2 = New Table()
                tableInner2.Attributes.Add("border", "0")
                tableInner2.Attributes.Add("cellspacing", "0")
                tableInner2.Attributes.Add("cellpadding", "0")
                cellInner.Controls.Add(tableInner2)
                rowInner2 = New TableRow()
                tableInner2.Rows.Add(rowInner2)

                cellInner2 = New TableCell()
                cellInner2.HorizontalAlign = HorizontalAlign.Left
                cellInner2.VerticalAlign = VerticalAlign.Middle
                cellInner2.Style(HtmlTextWriterStyle.WhiteSpace) = "nowrap"
                rowInner2.Cells.Add(cellInner2)
                FieldsetHeight.Style(HtmlTextWriterStyle.VerticalAlign) = "middle"
                cellInner2.Controls.Add(FieldsetHeight)

                cellInner2 = New TableCell()
                cellInner2.HorizontalAlign = HorizontalAlign.Left
                cellInner2.VerticalAlign = VerticalAlign.Middle
                cellInner2.Style(HtmlTextWriterStyle.WhiteSpace) = "nowrap"
                rowInner2.Cells.Add(cellInner2)
                HeightUnitToggle = New PopupUnitToggle()
                ' "px/%" toggle button
                HeightUnitToggle.Name = "heightUnitToggle"
                cellInner2.Controls.Add(HeightUnitToggle)
            End If
            If Padding IsNot Nothing Then
                ' the property is not overridden to 'null'
                rowInner = New TableRow()
                tableInner.Rows.Add(rowInner)

                cellInner = New TableCell()
                rowInner.Cells.Add(cellInner)
                holder = New HtmlGenericControl("span")
                cellInner.Controls.Add(holder)
                holder.Controls.Add(New LiteralControl(GetField("Padding", "Padding")))
                ' check for localization
                cellInner.HorizontalAlign = HorizontalAlign.Left
                cellInner.VerticalAlign = VerticalAlign.Middle
                cellInner.Controls.Add(New LiteralControl(": "))

                cellInner = New TableCell()
                cellInner.HorizontalAlign = HorizontalAlign.Left
                cellInner.VerticalAlign = VerticalAlign.Middle
                cellInner.Style(HtmlTextWriterStyle.WhiteSpace) = "nowrap"
                rowInner.Cells.Add(cellInner)
                Padding.Style(HtmlTextWriterStyle.VerticalAlign) = "middle"
                cellInner.Controls.Add(Padding)
                cellInner.Controls.Add(New LiteralControl("&nbsp;px"))
            End If

            Content.Add(table)
        End Sub

        ' override the base method
        Protected Overrides Sub OnPreRender(ByVal e As EventArgs)
            ' Ensure that fields in popup have 'ID' attribute

            If FieldsetWidth IsNot Nothing Then
                If FieldsetWidth.ClientID.Length > 0 Then
                    FieldsetWidth.Attributes.Add("id", FieldsetWidth.ClientID)
                End If
            End If
            If FieldsetHeight IsNot Nothing Then
                If FieldsetHeight.ClientID.Length > 0 Then
                    FieldsetHeight.Attributes.Add("id", FieldsetHeight.ClientID)
                End If
            End If
            If Padding IsNot Nothing Then
                If Padding.ClientID.Length > 0 Then
                    Padding.Attributes.Add("id", Padding.ClientID)
                End If
            End If
            If Margin IsNot Nothing Then
                If Margin.ClientID.Length > 0 Then
                    Margin.Attributes.Add("id", Margin.ClientID)
                End If
            End If

            MyBase.OnPreRender(e)
        End Sub

        ' override the base method
        Protected Overrides Sub DescribeComponent(ByVal descriptor As ScriptComponentDescriptor)
            ' Register fields and handlers for use in client-side

            If FieldsetWidth IsNot Nothing Then
                If FieldsetWidth.ClientID.Length > 0 Then
                    RegisteredFields.Add(New RegisteredField("width", FieldsetWidth))
                End If
            End If
            If FieldsetHeight IsNot Nothing Then
                If FieldsetHeight.ClientID.Length > 0 Then
                    RegisteredFields.Add(New RegisteredField("height", FieldsetHeight))
                End If
            End If
            If WidthUnitToggle IsNot Nothing Then
                RegisteredHandlers.Add(New RegisteredField("widthUnitToggle", WidthUnitToggle))
            End If
            If HeightUnitToggle IsNot Nothing Then
                RegisteredHandlers.Add(New RegisteredField("heightUnitToggle", HeightUnitToggle))
            End If
            If Padding IsNot Nothing Then
                If Padding.ClientID.Length > 0 Then
                    RegisteredFields.Add(New RegisteredField("padding", Padding))
                End If
            End If
            If Margin IsNot Nothing Then
                If Margin.ClientID.Length > 0 Then
                    RegisteredFields.Add(New RegisteredField("margin", Margin))
                End If
            End If

            MyBase.DescribeComponent(descriptor)
        End Sub

#End Region
    End Class

    ' custom 'Edit Fieldset properties' item for context menu
    <ParseChildren(False)> _
    Public Class EditFieldsetItem
        Inherits DesignModePopupItem
#Region "[ Properties ]"

        ' element tag name
        Public NotOverridable Overrides ReadOnly Property ElementTagName() As String
            Get
                Return "fieldset"
            End Get
        End Property

        ' image for the item
        Protected Overrides ReadOnly Property ImageSrc() As String
            Get
                Return Me.LocalResolveUrl("~/App_Obout/HTMLEditor/customButtons/ed_insertFieldset_n.gif")
            End Get
        End Property

        ' associated popup (custom popup declared above)
        Public Overrides Property RelatedPopup() As Popup
            Get
                If MyBase.RelatedPopup Is Nothing Then
                    MyBase.RelatedPopup = New FieldsetProperties()
                End If
                Return MyBase.RelatedPopup
            End Get
            Protected Set(ByVal value As Popup)
                MyBase.RelatedPopup = value
            End Set
        End Property

        ' item text if not found in Localization
        Public Overrides ReadOnly Property DefaultToolTip() As String
            Get
                Return "Edit Fieldset"
            End Get
        End Property

#End Region
    End Class

    ' custom 'Remove Fieldset' item for context menu
    <ParseChildren(False)> _
    Public Class RemoveFieldsetItem
        Inherits DesignModeItem
#Region "[ Properties ]"

        ' what client-side type to initiate (it is declared in the ASPX file)
        Protected Overrides ReadOnly Property ClientControlType() As String
            Get
                Return "CustomContextMenu.RemoveFieldsetItem"
            End Get
        End Property

        ' element tag name
        Public NotOverridable Overrides ReadOnly Property ElementTagName() As String
            Get
                Return "fieldset"
            End Get
        End Property

        ' image for the item
        Protected Overrides ReadOnly Property ImageSrc() As String
            Get
                Return Me.LocalResolveUrl("~/App_Obout/HTMLEditor/customButtons/ed_removeFieldset.gif")
            End Get
        End Property

        ' item text if not found in Localization
        Public Overrides ReadOnly Property DefaultToolTip() As String
            Get
                Return "Remove Fieldset"
            End Get
        End Property

#End Region
    End Class
End Class