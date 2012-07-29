Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Imports System.Text
Imports Obout.Interface
Partial Class ListBox_vb_integration_oboutcheckboxes
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox
    Dim OboutCheckBox1 As Obout.Interface.OboutCheckBox
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(200)
        ListBox1.DataSourceID = "sds1"
        ListBox1.DataTextField = "ControlName"
        ListBox1.DataValueField = "ControlID"
        ListBox1.SelectionMode = ListSelectionMode.Multiple

        ListBox1.ItemTemplate = New ItemTemplate()

        ListBox1Container.Controls.Add(ListBox1)
    End Sub

    Sub Order(ByVal sender As Object, ByVal e As EventArgs)

        Dim orderedItems As StringBuilder = New StringBuilder()

        For Each item As ListBoxItem In ListBox1.Items

            Dim checkbox As Obout.Interface.OboutCheckBox = CType(item.FindControl("OboutCheckBox1"), Obout.Interface.OboutCheckBox)
            checkbox.ClientSideEvents.OnClick = "handleCheckBoxClick"
            If CheckBox.Checked Then

                If orderedItems.Length > 0 Then

                    orderedItems.Append(", ")
                End If
                orderedItems.Append(item.Text)
            End If
        Next

        If orderedItems.Length > 0 Then

            OrderDetails.Text = "<br /><br /><br /><b>The following controls have been ordered:</b> " + orderedItems.ToString() + "<br />"
        ElseIf orderedItems.Length < 0 Then
            OrderDetails.Text = ""
        End If
    End Sub
    Public Class ItemTemplate
        Implements ITemplate
        Dim OboutCheckBox1 As Obout.Interface.OboutCheckBox
        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)
            AddHandler templatePlaceHolder.DataBinding, AddressOf DataBindTemplate

            Dim divContainer As Literal = New Literal()
            divContainer.Text = "<div class=""item""><span class=""chk-cont"">"

            Dim OboutCheckBox1 As Obout.Interface.OboutCheckBox = New Obout.Interface.OboutCheckBox()
            OboutCheckBox1.ID = "OboutCheckBox1"
            OboutCheckBox1.ClientSideEvents.OnClick = "handleCheckBoxClick"

            Dim divContainer2 As Literal = New Literal()
            divContainer2.Text = "</span>"

            Dim innerContainer As Literal = New Literal()

            templatePlaceHolder.Controls.Add(divContainer)
            templatePlaceHolder.Controls.Add(OboutCheckBox1)
            templatePlaceHolder.Controls.Add(divContainer2)
            templatePlaceHolder.Controls.Add(innerContainer)
        End Sub
        Sub DataBindTemplate(ByVal sender As Object, ByVal e As EventArgs)
            Dim templatePlaceHolder As PlaceHolder = CType(sender, PlaceHolder)
            Dim container As ListBoxItemTemlateContainer = CType(templatePlaceHolder.NamingContainer, ListBoxItemTemlateContainer)
            Dim item As Obout.ListBox.ListBoxItem = CType(container.Parent, Obout.ListBox.ListBoxItem)

            Dim innerContainer As Literal = CType(templatePlaceHolder.Controls(3), Literal)
            innerContainer.Text = "<div class=""label"">"
            innerContainer.Text += "<img src='resources/images/products/" + DataBinder.Eval(item.DataItem, "ImageName").ToString() + "' alt='' />"
            innerContainer.Text += DataBinder.Eval(item.DataItem, "ControlName").ToString()
            innerContainer.Text += "</div>"
            innerContainer.Text += "</div>"
        End Sub

    End Class
End Class
