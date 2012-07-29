Imports Obout.SuperForm
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Imports Obout.Interface
Imports Obout.Grid.Grid
Imports Obout.Grid

Partial Class Grid_vb_validation_superform
    Inherits System.Web.UI.Page
    Dim SuperForm1 As Obout.SuperForm.SuperForm
    Dim Grid1 As Obout.Grid.Grid

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        Grid1 = New Obout.Grid.Grid()
        Grid1.ID = "Grid1"
        Grid1.Serialize = False
        Grid1.AutoGenerateColumns = False
        Grid1.DataSourceID = "SqlDataSource1"

        Grid1.ClientSideEvents.OnBeforeClientUpdate = "Grid1_BeforeUpdate"
        Grid1.ClientSideEvents.OnBeforeClientInsert = "Grid1_BeforeInsert"
        Grid1.ClientSideEvents.OnClientEdit = "validate"

        'creating the Templates

        '------------------------------------------------------------------------
        Dim tplRowEdit As Obout.Grid.GridRuntimeTemplate = New Obout.Grid.GridRuntimeTemplate()
        tplRowEdit.ID = "tplRowEdit"
        tplRowEdit.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(tplRowEdit.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreatetplRowEdit
        '------------------------------------------------------------------------

        ' adding the templates to the Templates collection
        Grid1.Templates.Add(tplRowEdit)


        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = True
        oCol1.Visible = False
        oCol1.HeaderText = "ID"
        oCol1.Width = "150"
        oCol1.TemplateSettings.RowEditTemplateControlId = "OrderID"
        oCol1.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "200"
        oCol2.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipName"
        oCol2.TemplateSettings.RowEditTemplateControlPropertyName = "value"


        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipAddress"
        oCol3.HeaderText = "ADDRESS"
        oCol3.Visible = False
        oCol3.Width = "125"
        oCol3.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipAddress"
        oCol3.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipCity"
        oCol4.HeaderText = "CITY"
        oCol4.Width = "150"
        oCol4.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipCity"
        oCol4.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipRegion"
        oCol5.HeaderText = "REGION"
        oCol5.Visible = False
        oCol5.Width = "150"
        oCol5.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipRegion"
        oCol5.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = "ShipPostalCode"
        oCol6.HeaderText = "POSTAL CODE"
        oCol6.Width = "150"
        oCol6.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipPostalCode"
        oCol6.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol7 As Column = New Column()
        oCol7.DataField = "ShipCountry"
        oCol7.HeaderText = "COUNTRY"
        oCol7.Width = "125"
        oCol7.Wrap = False
        oCol7.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipCountry"
        oCol7.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol8 As Column = New Column()
        oCol8.DataField = "OrderDate"
        oCol8.HeaderText = "ORDER DATE"
        oCol8.Width = "125"
        oCol8.DataFormatString = "{0:MM/dd/yyyy}"
        oCol8.ApplyFormatInEditMode = True
        oCol8.TemplateSettings.RowEditTemplateControlId = "SuperForm1_OrderDate"
        oCol8.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol9 As Column = New Column()
        oCol9.DataField = "RequiredDate"
        oCol9.HeaderText = "REQUIRED DATE"
        oCol9.Width = "200"
        oCol9.Visible = False
        oCol9.DataFormatString = "{0:MM/dd/yyyy}"
        oCol9.ApplyFormatInEditMode = True
        oCol9.TemplateSettings.RowEditTemplateControlId = "SuperForm1_RequiredDate"
        oCol9.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol10 As Column = New Column()
        oCol10.DataField = "ShippedDate"
        oCol10.HeaderText = "SHIPPED DATE"
        oCol10.Width = "200"
        oCol10.Visible = False
        oCol10.DataFormatString = "{0:MM/dd/yyyy}"
        oCol10.ApplyFormatInEditMode = True
        oCol10.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShippedDate"
        oCol10.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol11 As Column = New Column()
        oCol11.DataField = "ShipVia"
        oCol11.HeaderText = "SHIP VIA"
        oCol11.Width = "200"
        oCol11.Visible = False
        oCol11.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipVia"
        oCol11.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol12 As Column = New Column()
        oCol12.DataField = "Sent"
        oCol12.HeaderText = "SENT"
        oCol12.Width = "175"
        oCol12.Visible = False
        oCol12.TemplateSettings.RowEditTemplateControlId = "SuperForm1_Sent"
        oCol12.TemplateSettings.RowEditTemplateControlPropertyName = "checked"

        Dim oCol13 As Column = New Column()
        oCol13.DataField = "AdditionalInformation"
        oCol13.HeaderText = "ADDITIONAL INFORMATION"
        oCol13.Width = "200"
        oCol13.Visible = False
        oCol13.TemplateSettings.RowEditTemplateControlId = "SuperForm1_AdditionalInformation"
        oCol13.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol14 As Column = New Column()
        oCol14.HeaderText = "EDIT"
        oCol14.Width = "150"
        oCol14.AllowEdit = True
        oCol14.AllowDelete = True

        Grid1.TemplateSettings.RowEditTemplateId = "tplRowEdit"

        ' add the columns to the Columns collection of the grid
        Grid1.Columns.Add(oCol1)
        Grid1.Columns.Add(oCol2)
        Grid1.Columns.Add(oCol3)
        Grid1.Columns.Add(oCol4)
        Grid1.Columns.Add(oCol5)
        Grid1.Columns.Add(oCol6)
        Grid1.Columns.Add(oCol7)
        Grid1.Columns.Add(oCol8)
        Grid1.Columns.Add(oCol9)
        Grid1.Columns.Add(oCol10)
        Grid1.Columns.Add(oCol11)
        Grid1.Columns.Add(oCol12)
        Grid1.Columns.Add(oCol13)
        Grid1.Columns.Add(oCol14)

        ' add the grid to the controls collection of the PlaceHolder
        Grid1Container.Controls.Add(Grid1)

    End Sub

    Sub CreatetplRowEdit(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim ph1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(ph1)

        Dim inputText As Literal = New Literal()
        inputText.Text = "<input type=""hidden"" id=""OrderID"" />"

        Dim validateGroup1 As ValidationSummary = New ValidationSummary()
        validateGroup1.ID = "ValidationSummary1"
        validateGroup1.ValidationGroup = "Group1"

        ph1.Controls.Add(inputText)
        ph1.Controls.Add(validateGroup1)

        SuperForm1 = New SuperForm()
        SuperForm1.ID = "SuperForm1"
        SuperForm1.AutoGenerateRows = False
        SuperForm1.AutoGenerateInsertButton = False
        SuperForm1.AutoGenerateEditButton = False
        SuperForm1.AutoGenerateDeleteButton = False
        SuperForm1.ValidationGroup = "Group1"
        SuperForm1.Width = Unit.Percentage(99)
        Dim keyNames1() As String = {"OrderID"}
        SuperForm1.DataKeyNames = keyNames1
        SuperForm1.DefaultMode = DetailsViewMode.Insert

        Dim requiredFieldValidator1 As RequiredFieldValidator = New RequiredFieldValidator()
        requiredFieldValidator1.ID = "RequiredFieldValidator1"
        requiredFieldValidator1.Display = ValidatorDisplay.Dynamic
        requiredFieldValidator1.ErrorMessage = "Ship Name is mandatory"
        requiredFieldValidator1.Text = "*"
        requiredFieldValidator1.ValidationGroup = "Group1"

        Dim requiredFieldValidator2 As RequiredFieldValidator = New RequiredFieldValidator()
        requiredFieldValidator2.ID = "RequiredFieldValidator2"
        requiredFieldValidator2.Display = ValidatorDisplay.Dynamic
        requiredFieldValidator2.ErrorMessage = "Ship Address is mandatory"
        requiredFieldValidator2.Text = "*"
        requiredFieldValidator2.ValidationGroup = "Group1"

        Dim requiredFieldValidator3 As RequiredFieldValidator = New RequiredFieldValidator()
        requiredFieldValidator3.ID = "RequiredFieldValidator3"
        requiredFieldValidator3.Display = ValidatorDisplay.Dynamic
        requiredFieldValidator3.ErrorMessage = "Ship City is mandatory"
        requiredFieldValidator3.Text = "*"
        requiredFieldValidator3.ValidationGroup = "Group1"

        Dim requiredFieldValidator4 As RequiredFieldValidator = New RequiredFieldValidator()
        requiredFieldValidator4.ID = "RequiredFieldValidator4"
        requiredFieldValidator4.Display = ValidatorDisplay.Dynamic
        requiredFieldValidator4.ErrorMessage = "Ship Country is mandatory"
        requiredFieldValidator4.Text = "*"
        requiredFieldValidator4.ValidationGroup = "Group1"

        Dim requiredFieldValidator5 As RequiredFieldValidator = New RequiredFieldValidator()
        requiredFieldValidator5.ID = "RequiredFieldValidator5"
        requiredFieldValidator5.Display = ValidatorDisplay.Dynamic
        requiredFieldValidator5.ErrorMessage = "Order Date is mandatory"
        requiredFieldValidator5.Text = "*"
        requiredFieldValidator5.ValidationGroup = "Group1"

        Dim rangeValidator1 As RangeValidator = New RangeValidator()
        rangeValidator1.ID = "RangeValidator1"
        rangeValidator1.Display = ValidatorDisplay.Dynamic
        rangeValidator1.MinimumValue = "1900/1/1"
        rangeValidator1.MaximumValue = "2039/12/31"
        rangeValidator1.Type = ValidationDataType.Date
        rangeValidator1.ErrorMessage = "Order Date needs to be in this format: mm/dd/yyyy"
        rangeValidator1.Text = "*"
        rangeValidator1.ValidationGroup = "Group1"

        Dim requiredFieldValidator6 As RequiredFieldValidator = New RequiredFieldValidator()
        requiredFieldValidator6.ID = "RequiredFieldValidator6"
        requiredFieldValidator6.Display = ValidatorDisplay.Dynamic
        requiredFieldValidator6.ErrorMessage = "Required Date is mandatory"
        requiredFieldValidator6.Text = "*"
        requiredFieldValidator6.ValidationGroup = "Group1"

        Dim rangeValidator2 As RangeValidator = New RangeValidator()
        rangeValidator2.ID = "RangeValidator2"
        rangeValidator2.Display = ValidatorDisplay.Dynamic
        rangeValidator2.MinimumValue = "1900/1/1"
        rangeValidator2.MaximumValue = "2039/12/31"
        rangeValidator2.Type = ValidationDataType.Date
        rangeValidator2.ErrorMessage = "Required Date needs to be in this format: mm/dd/yyyy"
        rangeValidator2.Text = "*"
        rangeValidator2.ValidationGroup = "Group1"

        Dim requiredFieldValidator7 As RequiredFieldValidator = New RequiredFieldValidator()
        requiredFieldValidator7.ID = "RequiredFieldValidator7"
        requiredFieldValidator7.Display = ValidatorDisplay.Dynamic
        requiredFieldValidator7.ErrorMessage = "Shipped Date is mandatory"
        requiredFieldValidator7.Text = "*"
        requiredFieldValidator7.ValidationGroup = "Group1"

        Dim rangeValidator3 As RangeValidator = New RangeValidator()
        rangeValidator3.ID = "RangeValidator3"
        rangeValidator3.Display = ValidatorDisplay.Dynamic
        rangeValidator3.MinimumValue = "1900/1/1"
        rangeValidator3.MaximumValue = "2039/12/31"
        rangeValidator3.Type = ValidationDataType.Date
        rangeValidator3.ErrorMessage = "Shipped Date needs to be in this format: mm/dd/yyyy"
        rangeValidator3.Text = "*"
        rangeValidator3.ValidationGroup = "Group1"

        Dim field1 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field1.DataField = "ShipName"
        field1.HeaderText = "Ship Name"
        field1.FieldSetID = "FieldSet1"
        field1.Validators.Add(requiredFieldValidator1)

        Dim field2 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field2.DataField = "ShipAddress"
        field2.HeaderText = "Ship Address"
        field2.FieldSetID = "FieldSet1"
        field2.Validators.Add(requiredFieldValidator2)

        Dim field3 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field3.DataField = "ShipCity"
        field3.HeaderText = "Ship City"
        field3.FieldSetID = "FieldSet1"
        field3.Validators.Add(requiredFieldValidator3)

        Dim field4 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field4.DataField = "ShipRegion"
        field4.HeaderText = "Ship Region"
        field4.FieldSetID = "FieldSet1"

        Dim field5 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field5.DataField = "ShipPostalCode"
        field5.HeaderText = "Zip Cod"
        field5.FieldSetID = "FieldSet1"

        Dim field6 As Obout.SuperForm.DropDownListField = New Obout.SuperForm.DropDownListField()
        field6.DataField = "ShipCountry"
        field6.HeaderText = "Ship Country"
        field6.FieldSetID = "FieldSet1"
        field6.DataSourceID = "SqlDataSource3"
        field6.Validators.Add(requiredFieldValidator4)

        Dim field7 As Obout.SuperForm.DateField = New Obout.SuperForm.DateField()
        field7.DataField = "OrderDate"
        field7.HeaderText = "Order Date"
        field7.FieldSetID = "FieldSet2"
        field7.DataFormatString = "{0:MM/dd/yyyy}"
        field7.ApplyFormatInEditMode = True
        field7.Validators.Add(requiredFieldValidator5)
        field7.Validators.Add(rangeValidator1)

        Dim field8 As Obout.SuperForm.DateField = New Obout.SuperForm.DateField()
        field8.DataField = "RequiredDate"
        field8.HeaderText = "Required Date"
        field8.FieldSetID = "FieldSet2"
        field8.DataFormatString = "{0:MM/dd/yyyy}"
        field8.ApplyFormatInEditMode = True
        field8.Validators.Add(requiredFieldValidator6)
        field8.Validators.Add(rangeValidator2)

        Dim field9 As Obout.SuperForm.DateField = New Obout.SuperForm.DateField()
        field9.DataField = "ShippedDate"
        field9.HeaderText = "Shipped Date"
        field9.FieldSetID = "FieldSet2"
        field9.DataFormatString = "{0:MM/dd/yyyy}"
        field9.ApplyFormatInEditMode = True
        field9.Validators.Add(requiredFieldValidator7)
        field9.Validators.Add(rangeValidator3)

        Dim field10 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field10.DataField = "ShipVia"
        field10.HeaderText = "Ship Via"
        field10.FieldSetID = "FieldSet2"

        Dim field11 As Obout.SuperForm.CheckBoxField = New Obout.SuperForm.CheckBoxField()
        field11.DataField = "Sent"
        field11.HeaderText = "Sent"
        field11.FieldSetID = "FieldSet2"

        Dim field12 As Obout.SuperForm.MultiLineField = New Obout.SuperForm.MultiLineField()
        field12.DataField = "AdditionalInformation"
        field12.HeaderText = ""
        field12.FieldSetID = "FieldSet3"
        field12.HeaderStyle.Width = 1

        Dim field13 As Obout.SuperForm.TemplateField = New Obout.SuperForm.TemplateField()
        field13.FieldSetID = "FieldSet4"
        field13.EditItemTemplate = New btnUpdateEditItemTemplate()

        Dim fieldSetRow1 As Obout.SuperForm.FieldSetRow = New Obout.SuperForm.FieldSetRow()
        Dim fieldSet1 As Obout.SuperForm.FieldSet = New Obout.SuperForm.FieldSet()
        fieldSet1.ID = "FieldSet1"
        fieldSet1.Title = "Ship Information"
        fieldSetRow1.Items.Add(fieldSet1)

        Dim fieldSet2 As Obout.SuperForm.FieldSet = New Obout.SuperForm.FieldSet()
        fieldSet2.ID = "FieldSet2"
        fieldSet2.Title = "Order Information"
        fieldSetRow1.Items.Add(fieldSet2)

        Dim fieldSet3 As Obout.SuperForm.FieldSet = New Obout.SuperForm.FieldSet()
        fieldSet3.ID = "FieldSet3"
        fieldSet3.Title = "Additional Information"
        fieldSetRow1.Items.Add(fieldSet3)

        Dim fieldSetRow2 As Obout.SuperForm.FieldSetRow = New Obout.SuperForm.FieldSetRow()
        Dim fieldSet4 As Obout.SuperForm.FieldSet = New Obout.SuperForm.FieldSet()
        fieldSet4.ID = "FieldSet4"
        fieldSet4.ColumnSpan = 3
        fieldSet4.CssClass = "command-row"
        fieldSetRow2.Items.Add(fieldSet4)

        SuperForm1.FieldSets.Add(fieldSetRow1)
        SuperForm1.FieldSets.Add(fieldSetRow2)

        SuperForm1.Fields.Add(field1)
        SuperForm1.Fields.Add(field2)
        SuperForm1.Fields.Add(field3)
        SuperForm1.Fields.Add(field4)
        SuperForm1.Fields.Add(field5)
        SuperForm1.Fields.Add(field6)
        SuperForm1.Fields.Add(field7)
        SuperForm1.Fields.Add(field8)
        SuperForm1.Fields.Add(field9)
        SuperForm1.Fields.Add(field10)
        SuperForm1.Fields.Add(field11)
        SuperForm1.Fields.Add(field12)
        SuperForm1.Fields.Add(field13)


        ph1.Controls.Add(SuperForm1)

    End Sub
    Public Class btnUpdateEditItemTemplate
        Implements ITemplate

        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn

            Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)

            Dim btnUpdate As Obout.Interface.OboutButton = New Obout.Interface.OboutButton()
            btnUpdate.ID = "BtnUpdate"
            btnUpdate.Text = "Save"
            btnUpdate.OnClientClick = "if(Page_ClientValidate() == true){Grid1.save();} return false;"
            btnUpdate.Width = 75

            Dim btnCancele As Obout.Interface.OboutButton = New Obout.Interface.OboutButton()
            btnCancele.ID = "BtnCancel"
            btnCancele.Text = "Cancel"
            btnCancele.OnClientClick = "Grid1.cancel(); return false;"
            btnCancele.Width = 75

            templatePlaceHolder.Controls.Add(btnUpdate)
            templatePlaceHolder.Controls.Add(btnCancele)
        End Sub
    End Class

End Class

