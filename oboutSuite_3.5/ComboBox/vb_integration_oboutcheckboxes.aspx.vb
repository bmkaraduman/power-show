Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Imports System.Web
Imports System.Web.UI
Partial Class ComboBox_vb_integrate_oboutcheckboxes
    Inherits System.Web.UI.Page
    Dim ComboBox1 As Obout.ComboBox.ComboBox
    Dim OboutCheckBox1 As Obout.Interface.OboutCheckBox
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1 = New Obout.ComboBox.ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(350)
        ComboBox1.AutoClose = False
        ComboBox1.AllowCustomText = True
        ComboBox1.AutoValidate = True
        ComboBox1.AllowEdit = False
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "ControlName"
        ComboBox1.DataValueField = "ControlID"
        ComboBox1.SelectionMode = ListSelectionMode.Multiple

        ComboBox1.ItemTemplate = New ItemTemplate()

        ComboBox1Container.Controls.Add(ComboBox1)
    End Sub

    Sub Order(ByVal sender As Object, ByVal e As EventArgs)

        Dim orderedItems As StringBuilder = New StringBuilder()

        For Each item As Obout.ComboBox.ComboBoxItem In ComboBox1.Items

            Dim checkbox As Obout.Interface.OboutCheckBox = CType(item.FindControl("OboutCheckBox1"), Obout.Interface.OboutCheckBox)
            checkbox.ClientSideEvents.OnClick = "handleCheckBoxClick"
            If checkbox.Checked Then

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
            Dim container As ComboBoxItemTemlateContainer = CType(templatePlaceHolder.NamingContainer, ComboBoxItemTemlateContainer)
            Dim item As Obout.ComboBox.ComboBoxItem = CType(container.Parent, Obout.ComboBox.ComboBoxItem)

            Dim innerContainer As Literal = CType(templatePlaceHolder.Controls(3), Literal)
            innerContainer.Text = "<div class=""label"">"
            innerContainer.Text += "<img src='resources/images/products/" + DataBinder.Eval(item.DataItem, "ImageName").ToString() + "' alt='' />"
            innerContainer.Text += DataBinder.Eval(item.DataItem, "ControlName").ToString()
            innerContainer.Text += "</div>"
            innerContainer.Text += "</div>"
        End Sub

    End Class
End Class
