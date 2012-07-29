Imports Obout.SuperForm
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Imports Obout.Interface
'Imports AjaxControlToolkit

Partial Class SuperForm_vb_firstlook_checkout
    Inherits System.Web.UI.Page
    Dim SuperForm1 As Obout.SuperForm.SuperForm
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        SuperForm1 = New SuperForm()
        SuperForm1.ID = "SuperForm1"
        SuperForm1.AutoGenerateRows = False
        SuperForm1.Width = Unit.Pixel(630)
        SuperForm1.Title = "Payment Information"
        SuperForm1.FolderStyle = "styles/black_glass"

        SuperForm1.DefaultMode = DetailsViewMode.Insert
        AddHandler SuperForm1.ItemInserting, AddressOf SuperForm1_Inserting
        AddHandler SuperForm1.DataBound, AddressOf SuperForm1_DataBound

        Dim field5 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field5.DataField = "CardNumber"
        field5.HeaderText = "Card Number"
        field5.FieldSetID = "FieldSet2"
        field5.Required = True
        field5.ControlStyle.Width = Unit.Pixel(150)

        'Dim extender1 As MaskedEditExtender = New MaskedEditExtender()
        'extender1.ID = "MaskedEditExtender1"
        'extender1.Mask = "9999-9999-9999-9999"
        'extender1.MessageValidatorTip = True
        'extender1.MaskType = MaskedEditType.Number
        'field5.Masks.Add(extender1)

        Dim field6 As Obout.SuperForm.DropDownListField = New Obout.SuperForm.DropDownListField()
        field6.DataField = "ExpirationYear"
        field6.HeaderText = "Expiration Year"
        field6.FieldSetID = "FieldSet2"
        field6.ControlStyle.Width = 93
        field6.Required = True

        Dim field7 As Obout.SuperForm.DropDownListField = New Obout.SuperForm.DropDownListField()
        field7.DataField = "ExpirationMonth"
        field7.HeaderText = "ExpirationMonth"
        field7.FieldSetID = "FieldSet2"
        field7.ControlStyle.Width = 117
        field7.Required = True

        Dim field8 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field8.DataField = "CIN"
        field8.HeaderText = "Security Code"
        field8.FieldSetID = "FieldSet2"
        field8.ControlStyle.Width = 83
        field8.Required = True
        field8.MaxLength = 3

        'Dim numbers As FilteredTextBoxExtender = New FilteredTextBoxExtender()
        'numbers.FilterType = FilterTypes.Numbers
        'field8.Filters.Add(numbers)

        Dim dummyField As Obout.SuperForm.TemplateField = New Obout.SuperForm.TemplateField()
        dummyField.FieldSetID = "FieldSet3"
        dummyField.ItemTemplate = New DummyItemTemplate()
        dummyField.ItemStyle.Width = 150

        Dim field4 As Obout.SuperForm.CheckBoxField = New Obout.SuperForm.CheckBoxField()
        field4.DataField = "SameAsBilling"
        field4.FieldSetID = "FieldSet4"
        field4.Text = "Same as the billing"
        field4.FieldsToDisable = "UserCompanyName"
        field4.FieldsToDisable = "UserCompanyName,UserFirstName,UserLastName,UserEmailAddress,UserAddress,UserCountryID,UserStateID,UserProvince,UserZip,UserVatID,UserPhone,UserFax"
        field4.ItemStyle.Width = 150

        Dim field9 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field9.DataField = "BillingCompanyName"
        field9.HeaderText = "Company Name"
        field9.FieldSetID = "FieldSet3"

        Dim field10 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field10.DataField = "BillingFirstName"
        field10.HeaderText = "First Name"
        field10.FieldSetID = "FieldSet3"
        field10.Required = True

        Dim field11 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field11.DataField = "BillingLastName"
        field11.HeaderText = "Last Name"
        field11.FieldSetID = "FieldSet3"
        field11.Required = True

        Dim field12 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field12.DataField = "BillingEmailAddress"
        field12.HeaderText = "Email Address"
        field12.FieldSetID = "FieldSet3"
        field12.Required = True

        Dim field13 As Obout.SuperForm.MultiLineField = New Obout.SuperForm.MultiLineField()
        field13.DataField = "BillingAddress"
        field13.HeaderText = "Address"
        field13.FieldSetID = "FieldSet3"
        field13.Required = True

        Dim field14 As Obout.SuperForm.DropDownListField = New Obout.SuperForm.DropDownListField()
        field14.DataField = "BillingCountryID"
        field14.HeaderText = "Country"
        field14.FieldSetID = "FieldSet3"
        field14.Required = True
        field14.DataSourceID = "CountriesDataSource"
        field14.DataValueField = "CountryID"
        field14.DataTextField = "CountryName"
        field14.Default = "219"
        field14.FieldsToEnable = "BillingStateID"
        field14.EnablingValues = "219"
        field14.FieldsToDisable = "BillingProvince"
        field14.DisablingValues = "219"

        Dim field15 As Obout.SuperForm.DropDownListField = New Obout.SuperForm.DropDownListField()
        field15.DataField = "BillingStateID"
        field15.HeaderText = "State"
        field15.FieldSetID = "FieldSet3"
        field15.Required = True
        field15.DataSourceID = "StatesDataSource"
        field15.DataValueField = "State"
        field15.DataTextField = "State"

        Dim field16 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field16.DataField = "BillingProvince"
        field16.FieldSetID = "FieldSet3"

        Dim field17 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field17.DataField = "BillingZip"
        field17.HeaderText = "Zip Code / Postal Code"
        field17.FieldSetID = "FieldSet3"

        Dim field18 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field18.DataField = "BillingVatID"
        field18.HeaderText = "VAT Exemption ID"
        field18.FieldSetID = "FieldSet3"

        Dim field19 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field19.DataField = "BillingPhone"
        field19.HeaderText = "Phone"
        field19.FieldSetID = "FieldSet3"

        'Dim extender2 As MaskedEditExtender = New MaskedEditExtender()
        'extender2.ID = "MaskedEditExtender2"
        'extender2.Mask = "(999)999-9999"
        'extender2.MaskType = MaskedEditType.Number
        'field19.Masks.Add(extender2)

        Dim field20 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field20.DataField = "BillingFax"
        field20.HeaderText = "Fax"
        field20.FieldSetID = "FieldSet3"

        'Dim extender3 As MaskedEditExtender = New MaskedEditExtender()
        'extender3.ID = "MaskedEditExtender3"
        'extender3.Mask = "(999)999-9999"
        'extender3.MaskType = MaskedEditType.Number
        'field20.Masks.Add(extender3)

        Dim field21 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field21.DataField = "UserCompanyName"
        field21.HeaderText = "Company Name"
        field21.FieldSetID = "FieldSet4"

        Dim field22 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field22.DataField = "UserFirstName"
        field22.HeaderText = "First Name"
        field22.FieldSetID = "FieldSet4"

        Dim field23 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field23.DataField = "UserLastName"
        field23.HeaderText = "Last Name"
        field23.FieldSetID = "FieldSet4"

        Dim field24 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field24.DataField = "UserEmailAddress"
        field24.HeaderText = "Email Address"
        field24.FieldSetID = "FieldSet4"

        Dim field25 As Obout.SuperForm.MultiLineField = New Obout.SuperForm.MultiLineField()
        field25.DataField = "UserAddress"
        field25.HeaderText = "Address"
        field25.FieldSetID = "FieldSet4"

        Dim field26 As Obout.SuperForm.DropDownListField = New Obout.SuperForm.DropDownListField()
        field26.DataField = "UserCountryID"
        field26.HeaderText = "Country"
        field26.FieldSetID = "FieldSet4"

        field26.DataSourceID = "CountriesDataSource"
        field26.DataValueField = "CountryID"
        field26.DataTextField = "CountryName"
        field26.Default = "219"
        field26.FieldsToEnable = "UserStateID"
        field26.EnablingValues = "219"
        field26.FieldsToDisable = "UserProvince"
        field26.DisablingValues = "219"

        Dim field27 As Obout.SuperForm.DropDownListField = New Obout.SuperForm.DropDownListField()
        field27.DataField = "UserStateID"
        field27.HeaderText = "State"
        field27.FieldSetID = "FieldSet4"

        field27.DataSourceID = "StatesDataSource"
        field27.DataValueField = "State"
        field27.DataTextField = "State"


        Dim field28 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field28.DataField = "UserProvince"
        field28.FieldSetID = "FieldSet4"

        Dim field29 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field29.DataField = "UserZip"
        field29.FieldSetID = "FieldSet4"
        field29.HeaderText = "Zip Code / Postal Code"

        Dim field30 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field30.DataField = "UserVatID"
        field30.FieldSetID = "FieldSet4"
        field30.HeaderText = "VAT Exemption ID"

        Dim field31 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field31.DataField = "UserPhone"
        field31.FieldSetID = "FieldSet4"
        field31.HeaderText = "Phone"

        'Dim extender4 As MaskedEditExtender = New MaskedEditExtender()
        'extender4.ID = "MaskedEditExtender4"
        'extender4.Mask = "(999)999-9999"
        'extender4.MaskType = MaskedEditType.Number
        'field31.Masks.Add(extender4)

        Dim field32 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field32.DataField = "UserFax"
        field32.HeaderText = "Fax"
        field32.FieldSetID = "FieldSet4"

        'Dim extender5 As MaskedEditExtender = New MaskedEditExtender()
        'extender5.ID = "MaskedEditExtender5"
        'extender5.Mask = "(999)999-9999"
        'extender5.MaskType = MaskedEditType.Number
        'field32.Masks.Add(extender5)

        Dim field33 As Obout.SuperForm.CommandField = New Obout.SuperForm.CommandField()
        field33.ShowInsertButton = True
        field33.InsertText = "Buy Now"
        field33.ShowCancelButton = False
        field33.ButtonType = ButtonType.Button
        field33.ItemStyle.HorizontalAlign = HorizontalAlign.Center
        field33.FieldSetID = "CommandFields"

        Dim fieldSetRow2 As Obout.SuperForm.FieldSetRow = New Obout.SuperForm.FieldSetRow()
        Dim fieldSet2 As Obout.SuperForm.FieldSet = New Obout.SuperForm.FieldSet()
        fieldSet2.ID = "FieldSet2"
        fieldSet2.Direction = Direction.Horizontal
        fieldSet2.ColumnSpan = 2        
        fieldSetRow2.Items.Add(fieldSet2)

        Dim fieldSetRow4 As Obout.SuperForm.FieldSetRow = New Obout.SuperForm.FieldSetRow()
        Dim fieldSet3 As Obout.SuperForm.FieldSet = New Obout.SuperForm.FieldSet()
        fieldSet3.ID = "FieldSet3"
        fieldSet3.Title = "Billing Information"

        Dim fieldSet4 As Obout.SuperForm.FieldSet = New Obout.SuperForm.FieldSet()
        fieldSet4.ID = "FieldSet4"
        fieldSet4.Title = "End-User Information"

        fieldSetRow4.Items.Add(fieldSet3)
        fieldSetRow4.Items.Add(fieldSet4)

        Dim fieldSetRow5 As Obout.SuperForm.FieldSetRow = New Obout.SuperForm.FieldSetRow()
        Dim commandFields As Obout.SuperForm.FieldSet = New Obout.SuperForm.FieldSet()
        commandFields.ID = "CommandFields"
        commandFields.HorizontalAlign = HorizontalAlign.Center
        commandFields.ColumnSpan = 2
        fieldSetRow5.Items.Add(commandFields)

        SuperForm1.FieldSets.Add(fieldSetRow2)
        SuperForm1.FieldSets.Add(fieldSetRow4)
        SuperForm1.FieldSets.Add(fieldSetRow5)

        SuperForm1.Fields.Add(field5)
        SuperForm1.Fields.Add(field6)
        SuperForm1.Fields.Add(field7)
        SuperForm1.Fields.Add(field8)
        SuperForm1.Fields.Add(dummyField)
        SuperForm1.Fields.Add(field4)
        SuperForm1.Fields.Add(field9)
        SuperForm1.Fields.Add(field10)
        SuperForm1.Fields.Add(field11)
        SuperForm1.Fields.Add(field12)
        SuperForm1.Fields.Add(field13)
        SuperForm1.Fields.Add(field14)
        SuperForm1.Fields.Add(field15)
        SuperForm1.Fields.Add(field16)
        SuperForm1.Fields.Add(field17)
        SuperForm1.Fields.Add(field18)
        SuperForm1.Fields.Add(field19)
        SuperForm1.Fields.Add(field20)
        SuperForm1.Fields.Add(field21)
        SuperForm1.Fields.Add(field22)
        SuperForm1.Fields.Add(field23)
        SuperForm1.Fields.Add(field24)
        SuperForm1.Fields.Add(field25)
        SuperForm1.Fields.Add(field26)
        SuperForm1.Fields.Add(field27)
        SuperForm1.Fields.Add(field28)
        SuperForm1.Fields.Add(field29)
        SuperForm1.Fields.Add(field30)
        SuperForm1.Fields.Add(field31)
        SuperForm1.Fields.Add(field32)
        SuperForm1.Fields.Add(field33)

        SuperForm1Container.Controls.Add(SuperForm1)

    End Sub
   Sub SuperForm1_Inserting(ByVal sender As Object, ByVal e As DetailsViewInsertEventArgs)

        SuperForm1.Visible = False
        MessagePanel.Visible = True
    End Sub

    Sub SuperForm1_DataBound(ByVal sender As Object, ByVal e As EventArgs)

        Dim yearDdl As OboutDropDownList = CType(SuperForm1.GetFieldControl(1), OboutDropDownList)
        yearDdl.MenuWidth = Unit.Pixel(90)

        yearDdl.Items.Add(New ListItem(""))

        Dim i As Integer

        For i = 2010 To 2024

            yearDdl.Items.Add(New ListItem(i.ToString()))
        Next

        Dim monthDdl As OboutDropDownList = CType(SuperForm1.GetFieldControl(2), OboutDropDownList)

        monthDdl.Items.Add(New ListItem(""))
        monthDdl.Items.Add(New ListItem("January"))
        monthDdl.Items.Add(New ListItem("February"))
        monthDdl.Items.Add(New ListItem("March"))
        monthDdl.Items.Add(New ListItem("April"))
        monthDdl.Items.Add(New ListItem("May"))
        monthDdl.Items.Add(New ListItem("June"))
        monthDdl.Items.Add(New ListItem("July"))
        monthDdl.Items.Add(New ListItem("August"))
        monthDdl.Items.Add(New ListItem("September"))
        monthDdl.Items.Add(New ListItem("October"))
        monthDdl.Items.Add(New ListItem("November"))
        monthDdl.Items.Add(New ListItem("December"))
    End Sub
    
    Public Class DummyItemTemplate
        Implements ITemplate
        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn

            Dim Header As Literal = New Literal()
            Header.Text = "&#160;"
            container.Controls.Add(Header)
        End Sub
    End Class

End Class
