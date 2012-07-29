Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_apiclient_selected
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox
    Dim ListBoxItem1 As Obout.ListBox.ListBoxItem
    Dim ListBoxItem2 As Obout.ListBox.ListBoxItem
    Dim ListBoxItem3 As Obout.ListBox.ListBoxItem
    Dim ListBoxItem4 As Obout.ListBox.ListBoxItem
    Dim ListBoxItem5 As Obout.ListBox.ListBoxItem
    Dim RequiredFieldValidator1 As RequiredFieldValidator
    Dim RangeValidator1 As RangeValidator

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(125)

        ListBoxItem1 = New ListBoxItem()
        ListBoxItem1.ID = "ListBoxItem1"
        ListBoxItem1.Text = "10"

        ListBoxItem2 = New ListBoxItem()
        ListBoxItem2.ID = "ListBoxItem2"
        ListBoxItem2.Text = "50"

        ListBoxItem3 = New ListBoxItem()
        ListBoxItem3.ID = "ListBoxItem3"
        ListBoxItem3.Text = "75"

        ListBoxItem4 = New ListBoxItem()
        ListBoxItem4.ID = "ListBoxItem4"
        ListBoxItem4.Text = "100"

        ListBoxItem5 = New ListBoxItem()
        ListBoxItem5.ID = "ListBoxItem5"
        ListBoxItem5.Text = "1000"

        ListBox1.Items.Add(ListBoxItem1)
        ListBox1.Items.Add(ListBoxItem2)
        ListBox1.Items.Add(ListBoxItem3)
        ListBox1.Items.Add(ListBoxItem4)
        ListBox1.Items.Add(ListBoxItem5)

        RequiredFieldValidator1 = New RequiredFieldValidator()
        RequiredFieldValidator1.ID = "Validator1"
        RequiredFieldValidator1.ControlToValidate = "ListBox1"
        RequiredFieldValidator1.ErrorMessage = "Please select a value."
        RequiredFieldValidator1.CssClass = "tdText"
        RequiredFieldValidator1.Display = ValidatorDisplay.Dynamic

        RangeValidator1 = New RangeValidator()
        RangeValidator1.ID = "RangeValidator1"
        RangeValidator1.ControlToValidate = "ListBox1"
        RangeValidator1.Display = ValidatorDisplay.Dynamic
        RangeValidator1.ErrorMessage = "Please specify a value between 50 and 100."
        RangeValidator1.MinimumValue = "50"
        RangeValidator1.MaximumValue = "100"
        RangeValidator1.Type = ValidationDataType.Integer
        RangeValidator1.CssClass = "tdText"

        ListBox1Container.Controls.Add(ListBox1)
        ValidatorContainer.Controls.Add(RequiredFieldValidator1)
        ValidatorContainer.Controls.Add(RangeValidator1)
    End Sub
End Class
