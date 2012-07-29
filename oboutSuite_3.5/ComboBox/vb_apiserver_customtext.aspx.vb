Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Imports System
Imports System.Web
Partial Class ComboBox_vb_apiserver_customtext
    Inherits System.Web.UI.Page
    Dim ComboBox1 As Obout.ComboBox.ComboBox
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1 = New Obout.ComboBox.ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(250)
        ComboBox1.Height = Unit.Pixel(200)
        ComboBox1.EmptyText = "Enter a new item.."
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CountryName"
        ComboBox1.DataValueField = "CountryID"
        ComboBox1.AutoValidate = True
        ComboBox1.AppendDataBoundItems = True
        ComboBox1.AllowCustomText = True

        ComboBox1Container.Controls.Add(ComboBox1)
    End Sub


    Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)

        If (ComboBox1.SelectedIndex = -1 AndAlso Not (ComboBox1.SelectedText = ComboBox1.EmptyText)) Then

            Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/continent.mdb"))
            myConn.Open()

            Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Country (CountryName) VALUES(@CountryName)", myConn)

            myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = ComboBox1.SelectedText

            myComm.ExecuteNonQuery()
            myConn.Close()

            ComboBox1.Items.Clear()
            ComboBox1.SelectedIndex = 0

            ComboBox1.DataBind()
        End If

    End Sub

End Class
