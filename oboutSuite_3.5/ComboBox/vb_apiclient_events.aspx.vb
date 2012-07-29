Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_apiclient_events
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox

   Sub Page_load(ByVal sender As Object, ByVal e As EventArgs) 
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(250)
        ComboBox1.EmptyText = "Select a customer ..."
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "CustomerID"

        ComboBox1.ClientSideEvents.OnSelectedIndexChanged = "ComboBox1_SelectedIndexChanged"
        ComboBox1.ClientSideEvents.OnItemClick = "ComboBox1_ItemClick"
        ComboBox1.ClientSideEvents.OnOpen = "ComboBox1_Open"
        ComboBox1.ClientSideEvents.OnClose = "ComboBox1_Close"
        ComboBox1.ClientSideEvents.OnFocus = "ComboBox1_Focus"
        ComboBox1.ClientSideEvents.OnBlur = "ComboBox1_Blur"

        ComboBox1Container.Controls.Add(ComboBox1)

    End Sub
End Class
