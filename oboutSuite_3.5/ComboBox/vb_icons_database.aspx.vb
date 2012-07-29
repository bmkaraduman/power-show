Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_icons_database
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(200)
        ComboBox1.MenuWidth = Unit.Pixel(300)
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "CustomerID"
        ComboBox1.EmptyText = "Select a customer ..."
        ComboBox1.ShowSelectedImage = True
        AddHandler ComboBox1.ItemDataBound, AddressOf ComboBox1_ItemDataBound

        ComboBox1Container.Controls.Add(ComboBox1)
    End Sub
    Sub ComboBox1_ItemDataBound(ByVal sender As Object, ByVal e As ComboBoxItemEventArgs)

        e.Item.ImageUrl = GetCountryFlag(DataBinder.Eval(e.Item.DataItem, "Country").ToString())

    End Sub
    Function GetCountryFlag(ByVal countryName As String) As String

        Select Case countryName
            Case "UK"
                countryName = "England"
                Exit Select
        End Select

        Return "resources/Images/flags/flag_" + countryName.ToLower() + ".png"
    End Function
End Class
