Imports Obout.SuperForm
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class SuperForm_vb_linked_conditional
    Inherits System.Web.UI.Page
    Dim SuperForm1 As Obout.SuperForm.SuperForm
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        SuperForm1 = New SuperForm()
        SuperForm1.ID = "SuperForm1"
        SuperForm1.AutoGenerateRows = False
        SuperForm1.DefaultMode = DetailsViewMode.Insert
        AddHandler SuperForm1.ItemInserting, AddressOf SuperForm1_Inserting

        Dim field1 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field1.DataField = "FirstName"
        field1.HeaderText = "First Name"

        Dim field2 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field2.DataField = "LastName"
        field2.HeaderText = "Last Name"

        Dim field3 As Obout.SuperForm.DropDownListField = New Obout.SuperForm.DropDownListField()
        field3.DataField = "CountryID"
        field3.HeaderText = "Country"
        field3.Required = True
        field3.DataSourceID = "CountriesDataSource"
        field3.DataValueField = "CountryID"
        field3.DataTextField = "CountryName"
        field3.Default = "219"
        field3.FieldsToEnable = "StateID"
        field3.EnablingValues = "219"
        field3.FieldsToDisable = "Province"
        field3.DisablingValues = "219"

        Dim field4 As Obout.SuperForm.DropDownListField = New Obout.SuperForm.DropDownListField()
        field4.DataField = "StateID"
        field4.HeaderText = "State / Province"
        field4.Required = True
        field4.DataSourceID = "StatesDataSource"
        field4.DataValueField = "State"
        field4.DataTextField = "State"

        Dim field5 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field5.DataField = "Province"

        Dim field6 As Obout.SuperForm.CommandField = New Obout.SuperForm.CommandField()
        field6.ShowInsertButton = True
        field6.ShowCancelButton = False
        field6.ButtonType = ButtonType.Button
        field6.ItemStyle.HorizontalAlign = HorizontalAlign.Center

        SuperForm1.Fields.Add(field1)
        SuperForm1.Fields.Add(field2)
        SuperForm1.Fields.Add(field3)
        SuperForm1.Fields.Add(field4)
        SuperForm1.Fields.Add(field5)
        SuperForm1.Fields.Add(field6)

        SuperForm1Container.Controls.Add(SuperForm1)
    End Sub
    Sub SuperForm1_Inserting(ByVal sender As Object, ByVal e As DetailsViewInsertEventArgs)

        SuperForm1.Visible = False
        MessagePanel.Visible = True
    End Sub

End Class
