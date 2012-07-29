Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ListBox_vb_apiclient_events
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox

   Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(250)
        ListBox1.DataSourceID = "sds1"
        ListBox1.DataTextField = "CompanyName"
        ListBox1.DataValueField = "CustomerID"

        ListBox1.ClientSideEvents.OnSelectedIndexChanged = "ListBox1_SelectedIndexChanged"
        ListBox1.ClientSideEvents.OnItemClick = "ListBox1_ItemClick"
        ListBox1.ClientSideEvents.OnFocus = "ListBox1_Focus"
        ListBox1.ClientSideEvents.OnBlur = "ListBox1_Blur"

        ListBox1Container.Controls.Add(ListBox1)
    End Sub
End Class
