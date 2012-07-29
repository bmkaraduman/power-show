Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_columns_states
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox
    Dim ListBox2 As Obout.ListBox.ListBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(550)

        ListBox1.CssSettings.ItemsContainer += "ob_iLboIC long-states"

        ListBox1Container.Controls.Add(ListBox1)

        ListBox2 = New Obout.ListBox.ListBox()
        ListBox2.ID = "ListBox2"
        ListBox2.Width = Unit.Pixel(335)
        ListBox2.CssSettings.ItemsContainer += "ob_iLboIC short-states"

        ListBox2Container.Controls.Add(ListBox2)

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
            ListBox1.Items.Add(New ListBoxItem(arrStates(i)))
        Next i

        ' looping through the short names array and adding each state to the second combobox
        For i = 0 To arrShortStates.Length - 1
            ListBox2.Items.Add(New ListBoxItem(arrShortStates(i)))
        Next i


    End Sub
End Class
