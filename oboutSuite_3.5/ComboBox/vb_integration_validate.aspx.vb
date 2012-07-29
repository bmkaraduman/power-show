Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb

Partial Class ComboBox_vb_integration_validate
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox
    Dim ComboBoxItem1 As Obout.ComboBox.ComboBoxItem
    Dim ComboBoxItem2 As Obout.ComboBox.ComboBoxItem
    Dim ComboBoxItem3 As Obout.ComboBox.ComboBoxItem
    Dim ComboBoxItem4 As Obout.ComboBox.ComboBoxItem
    Dim ComboBoxItem5 As Obout.ComboBox.ComboBoxItem
    Dim RequiredFieldValidator1 As RequiredFieldValidator
    Dim RangeValidator1 As RangeValidator

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(125)

        ComboBoxItem1 = New Obout.ComboBox.ComboBoxItem()
        ComboBoxItem1.ID = "ComboBoxItem1"
        ComboBoxItem1.Text = "10"

        ComboBoxItem2 = New Obout.ComboBox.ComboBoxItem()
        ComboBoxItem2.ID = "ComboBoxItem2"
        ComboBoxItem2.Text = "50"

        ComboBoxItem3 = New Obout.ComboBox.ComboBoxItem()
        ComboBoxItem3.ID = "ComboBoxItem3"
        ComboBoxItem3.Text = "75"

        ComboBoxItem4 = New Obout.ComboBox.ComboBoxItem()
        ComboBoxItem4.ID = "ComboBoxItem4"
        ComboBoxItem4.Text = "100"

        ComboBoxItem5 = New Obout.ComboBox.ComboBoxItem()
        ComboBoxItem5.ID = "ComboBoxItem5"
        ComboBoxItem5.Text = "1000"

        ComboBox1.Items.Add(ComboBoxItem1)
        ComboBox1.Items.Add(ComboBoxItem2)
        ComboBox1.Items.Add(ComboBoxItem3)
        ComboBox1.Items.Add(ComboBoxItem4)
        ComboBox1.Items.Add(ComboBoxItem5)

        RequiredFieldValidator1 = New RequiredFieldValidator()
        RequiredFieldValidator1.ID = "Validator1"
        RequiredFieldValidator1.ControlToValidate = "ComboBox1"
        RequiredFieldValidator1.ErrorMessage = "Please select a value."
        RequiredFieldValidator1.CssClass = "tdText"
        RequiredFieldValidator1.Display = ValidatorDisplay.Dynamic

        RangeValidator1 = New RangeValidator()
        RangeValidator1.ID = "RangeValidator1"
        RangeValidator1.ControlToValidate = "ComboBox1"
        RangeValidator1.Display = ValidatorDisplay.Dynamic
        RangeValidator1.ErrorMessage = "Please specify a value between 50 and 100."
        RangeValidator1.MinimumValue = "50"
        RangeValidator1.MaximumValue = "100"
        RangeValidator1.Type = ValidationDataType.Integer
        RangeValidator1.CssClass = "tdText"

        ComboBox1Container.Controls.Add(ComboBox1)
        ValidatorContainer.Controls.Add(RequiredFieldValidator1)
        ValidatorContainer.Controls.Add(RangeValidator1)

    End Sub
    
End Class
