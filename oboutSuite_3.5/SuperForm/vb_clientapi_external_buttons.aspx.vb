Imports Obout.SuperForm
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class SuperForm_vb_clientapi_external_buttons
    Inherits System.Web.UI.Page
    Dim SuperForm1 As Obout.SuperForm.SuperForm

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        SuperForm1 = New SuperForm()
        SuperForm1.ID = "SuperForm1"
        SuperForm1.Title = "Order Details"
        SuperForm1.DataSourceID = "SqlDataSource1"
        SuperForm1.AutoGenerateRows = False
        Dim keyNames1() As String = {"OrderID"}
        SuperForm1.DataKeyNames = keyNames1
        SuperForm1.AllowPaging = True
        SuperForm1.AllowDataKeysInsert = False
        SuperForm1.EnableModelValidation = True
        SuperForm1.DefaultMode = DetailsViewMode.Edit
        AddHandler SuperForm1.ModeChanged, AddressOf SuperForm1_ModeChanged

        Dim field1 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field1.DataField = "OrderID"
        field1.HeaderText = "Order ID"
        field1.ReadOnly = True
        field1.InsertVisible = False
        field1.FieldSetID = "FieldSet1"

        Dim field2 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field2.DataField = "ShipName"
        field2.HeaderText = "Ship Name"
        field2.FieldSetID = "FieldSet1"

        Dim field3 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field3.DataField = "ShipCity"
        field3.HeaderText = "Ship City"
        field3.FieldSetID = "FieldSet1"

        Dim field4 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field4.DataField = "ShipCountry"
        field4.HeaderText = "Ship Country"
        field4.FieldSetID = "FieldSet1"

        Dim field5 As Obout.SuperForm.CommandField = New Obout.SuperForm.CommandField()
        field5.ButtonType = ButtonType.Button
        field5.ShowEditButton = True
        field5.ShowDeleteButton = True
        field5.ShowInsertButton = True
        field5.FieldSetID = "FieldSet2"

        Dim fieldSetRow1 As Obout.SuperForm.FieldSetRow = New Obout.SuperForm.FieldSetRow()
        Dim fieldSet1 As Obout.SuperForm.FieldSet = New Obout.SuperForm.FieldSet()
        fieldSet1.ID = "FieldSet1"
        fieldSetRow1.Items.Add(fieldSet1)

        Dim fieldSetRow2 As Obout.SuperForm.FieldSetRow = New Obout.SuperForm.FieldSetRow()
        Dim fieldSet2 As Obout.SuperForm.FieldSet = New Obout.SuperForm.FieldSet()
        fieldSet2.ID = "FieldSet2"
        fieldSet2.HorizontalAlign = HorizontalAlign.NotSet
        fieldSet2.CssClass = "hidden-buttons"
        fieldSetRow2.Items.Add(fieldSet2)

        SuperForm1.FieldSets.Add(fieldSetRow1)
        SuperForm1.FieldSets.Add(fieldSetRow2)

        SuperForm1.Fields.Add(field1)
        SuperForm1.Fields.Add(field2)
        SuperForm1.Fields.Add(field3)
        SuperForm1.Fields.Add(field4)
        SuperForm1.Fields.Add(field5)


        SuperForm1Container.Controls.Add(SuperForm1)

        If Not IsPostBack Then

            UpdateButtonsState()

        End If

    End Sub
    Sub SuperForm1_ModeChanged(ByVal sender As Object, ByVal e As EventArgs)

        UpdateButtonsState()

    End Sub

    Sub UpdateButtonsState()

        Dim showEdit As Boolean = False
        Dim showDelete As Boolean = False
        Dim showNew As Boolean = False
        Dim showUpdate As Boolean = False
        Dim showInsert As Boolean = False
        Dim showCancel As Boolean = False

        If SuperForm1.CurrentMode = DetailsViewMode.ReadOnly Then

            showEdit = True
            showDelete = True
            showNew = True

        ElseIf SuperForm1.CurrentMode = DetailsViewMode.Edit Then

            showUpdate = True
            showCancel = True

        Else

            showInsert = True
            showCancel = True

        End If

        ExternalEdit.Visible = showEdit
        ExternalDelete.Visible = showDelete
        ExternalNew.Visible = showNew
        ExternalUpdate.Visible = showUpdate
        ExternalInsert.Visible = showInsert
        ExternalCancel.Visible = showCancel

    End Sub
End Class
