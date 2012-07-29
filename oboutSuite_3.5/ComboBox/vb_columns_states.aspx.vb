Imports Obout.ComboBox
Imports System.Data
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_columns_states
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox
    Dim ComboBox2 As ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(150)
        ComboBox1.MenuWidth = Unit.Pixel(550)
        ComboBox1.EmptyText = "Select a state ..."

        ComboBox1.CssSettings.ItemsContainer = "ob_iCboIC long-states"

        ComboBox1Container.Controls.Add(ComboBox1)


        ComboBox2 = New ComboBox()
        ComboBox2.ID = "ComboBox2"
        ComboBox2.Width = Unit.Pixel(150)
        ComboBox2.MenuWidth = Unit.Pixel(335)
        ComboBox2.EmptyText = "Select a state ..."

        ComboBox2.CssSettings.ItemsContainer = "ob_iCboIC short-states"

        ComboBox2Container.Controls.Add(ComboBox2)


        Dim arrStates As String() = {"Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", _
        "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", _
        "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", _
        "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", _
        "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", _
        "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", _
        "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"}

        ' creating an array with all the states - short names
        Dim arrShortStates As String() = {"AL", "AK", "AZ", "AR", "CA", "CO", "CT", _
        "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", _
        "KS", "KY", "LA", "ME", "MD", "MA", "MI", _
        "MN", "MS", "MO", "MT", "NE", "NV", "NH", _
        "NJ", "NM", "NY", "NC", "ND", "OH", "OK", _
        "OR", "PA", "RI", "SC", "SD", "TN", "TX", _
        "UT", "VT", "VA", "WA", "WV", "WI", "WY"}

        ' looping through the full names array and adding each state to the first combobox
        Dim i As Integer
        For i = 0 To arrStates.Length - 1
            ComboBox1.Items.Add(New Obout.ComboBox.ComboBoxItem(arrStates(i)))
        Next i

        ' looping through the short names array and adding each state to the second combobox
        For i = 0 To arrShortStates.Length - 1
            ComboBox2.Items.Add(New Obout.ComboBox.ComboBoxItem(arrShortStates(i)))
        Next i
    End Sub
End Class
