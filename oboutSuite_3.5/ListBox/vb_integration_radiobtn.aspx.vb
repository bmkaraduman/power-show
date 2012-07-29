Imports Obout.ListBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Imports System.Text
Imports Obout.Interface
Partial Class ListBox_vb_integration_radiobtn
    Inherits System.Web.UI.Page
    Dim ListBox1 As Obout.ListBox.ListBox
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ListBox1 = New Obout.ListBox.ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.Width = Unit.Pixel(500)

        ListBox1.ItemTemplate = New ItemTemplate()

        ListBox1.Items.Add(New ListBoxItem())

        ListBox1Container.Controls.Add(ListBox1)
    End Sub
    Sub Order(ByVal sender As Object, ByVal e As EventArgs)

        If Not (String.IsNullOrEmpty(ListBox1.SelectedText)) Then

            OrderDetails.Text = "<br /><br /><br /><b>The following control has been ordered:</b> " + ListBox1.SelectedText + "<br />"
        End If
    End Sub
    Public Class ItemTemplate
        Implements ITemplate

        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)

            Dim divContainer As Literal = New Literal()
            divContainer.Text = "<div class=""column"">"

            Dim divContainer2 As Literal = New Literal()
            divContainer2.Text = "<h4>ASP.NET Controls</h4><hr/>"

            Dim divContainer3 As Literal = New Literal()
            divContainer3.Text = "<span>"

            Dim OboutRadioButton1 As Obout.Interface.OboutRadioButton = New Obout.Interface.OboutRadioButton()
            OboutRadioButton1.ID = "OboutRadioButton1"
            OboutRadioButton1.Text = "TreeView"
            OboutRadioButton1.GroupName = "Items"
            OboutRadioButton1.ClientSideEvents.OnCheckedChanged = "onCheckedChanged"

            Dim spacer1 As Literal = New Literal()
            spacer1.Text = "<br />"

            Dim OboutRadioButton2 As Obout.Interface.OboutRadioButton = New Obout.Interface.OboutRadioButton()
            OboutRadioButton2.ID = "OboutRadioButton2"
            OboutRadioButton2.Text = "Grid"
            OboutRadioButton2.GroupName = "Items"
            OboutRadioButton2.ClientSideEvents.OnCheckedChanged = "onCheckedChanged"

            Dim spacer2 As Literal = New Literal()
            spacer2.Text = "<br />"

            Dim OboutRadioButton3 As Obout.Interface.OboutRadioButton = New Obout.Interface.OboutRadioButton()
            OboutRadioButton3.ID = "OboutRadioButton10"
            OboutRadioButton3.Text = "HTML Editor"
            OboutRadioButton3.GroupName = "Items"
            OboutRadioButton3.ClientSideEvents.OnCheckedChanged = "onCheckedChanged"

            Dim spacer3 As Literal = New Literal()
            spacer3.Text = "<br />"

            Dim OboutRadioButton4 As Obout.Interface.OboutRadioButton = New Obout.Interface.OboutRadioButton()
            OboutRadioButton4.ID = "OboutRadioButton11"
            OboutRadioButton4.Text = "ComboBox"
            OboutRadioButton4.GroupName = "Items"
            OboutRadioButton4.ClientSideEvents.OnCheckedChanged = "onCheckedChanged"

            Dim spacer4 As Literal = New Literal()
            spacer4.Text = "<br />"

            Dim OboutRadioButton5 As Obout.Interface.OboutRadioButton = New Obout.Interface.OboutRadioButton()
            OboutRadioButton5.ID = "OboutRadioButton12"
            OboutRadioButton5.Text = "Scheduler"
            OboutRadioButton5.GroupName = "Items"
            OboutRadioButton5.ClientSideEvents.OnCheckedChanged = "onCheckedChanged"

            Dim spacer5 As Literal = New Literal()
            spacer5.Text = "<br />"

            Dim OboutRadioButton6 As Obout.Interface.OboutRadioButton = New Obout.Interface.OboutRadioButton()
            OboutRadioButton6.ID = "OboutRadioButton13"
            OboutRadioButton6.Text = "Window"
            OboutRadioButton6.GroupName = "Items"
            OboutRadioButton6.ClientSideEvents.OnCheckedChanged = "onCheckedChanged"

            Dim divContainer4 As Literal = New Literal()
            divContainer4.Text = "</span>"

            Dim divContainer5 As Literal = New Literal()
            divContainer5.Text = "</div>"

            Dim divContainer6 As Literal = New Literal()
            divContainer6.Text = "<div class=""column"">"

            Dim divContainer7 As Literal = New Literal()
            divContainer7.Text = "<h4>ASP.NET MVC Controls</h4><hr/>"

            Dim divContainer8 As Literal = New Literal()
            divContainer8.Text = "<span>"

            Dim OboutRadioButton7 As Obout.Interface.OboutRadioButton = New Obout.Interface.OboutRadioButton()
            OboutRadioButton7.ID = "OboutRadioButton3"
            OboutRadioButton7.Text = "Button"
            OboutRadioButton7.GroupName = "Items"
            OboutRadioButton7.ClientSideEvents.OnCheckedChanged = "onCheckedChanged"

            Dim spacer6 As Literal = New Literal()
            spacer6.Text = "<br />"

            Dim OboutRadioButton8 As Obout.Interface.OboutRadioButton = New Obout.Interface.OboutRadioButton()
            OboutRadioButton8.ID = "OboutRadioButton8"
            OboutRadioButton8.Text = "Checkbox"
            OboutRadioButton8.GroupName = "Items"
            OboutRadioButton8.ClientSideEvents.OnCheckedChanged = "onCheckedChanged"

            Dim spacer7 As Literal = New Literal()
            spacer7.Text = "<br />"

            Dim OboutRadioButton9 As Obout.Interface.OboutRadioButton = New Obout.Interface.OboutRadioButton()
            OboutRadioButton9.ID = "OboutRadioButton4"
            OboutRadioButton9.Text = "Dropdown List"
            OboutRadioButton9.GroupName = "Items"
            OboutRadioButton9.ClientSideEvents.OnCheckedChanged = "onCheckedChanged"

            Dim spacer8 As Literal = New Literal()
            spacer8.Text = "<br />"

            Dim OboutRadioButton10 As Obout.Interface.OboutRadioButton = New Obout.Interface.OboutRadioButton()
            OboutRadioButton10.ID = "OboutRadioButton7"
            OboutRadioButton10.Text = "Image Button"
            OboutRadioButton10.GroupName = "Items"
            OboutRadioButton10.ClientSideEvents.OnCheckedChanged = "onCheckedChanged"

            Dim spacer9 As Literal = New Literal()
            spacer9.Text = "<br />"

            Dim OboutRadioButton11 As Obout.Interface.OboutRadioButton = New Obout.Interface.OboutRadioButton()
            OboutRadioButton11.ID = "OboutRadioButton9"
            OboutRadioButton11.Text = "Radio Button"
            OboutRadioButton11.GroupName = "Items"
            OboutRadioButton11.ClientSideEvents.OnCheckedChanged = "onCheckedChanged"

            Dim spacer10 As Literal = New Literal()
            spacer10.Text = "<br />"

            Dim OboutRadioButton12 As Obout.Interface.OboutRadioButton = New Obout.Interface.OboutRadioButton()
            OboutRadioButton12.ID = "OboutRadioButton5"
            OboutRadioButton12.Text = "Textbox"
            OboutRadioButton12.GroupName = "Items"
            OboutRadioButton12.ClientSideEvents.OnCheckedChanged = "onCheckedChanged"

            Dim spacer11 As Literal = New Literal()
            spacer11.Text = "<br />"

            Dim OboutRadioButton13 As Obout.Interface.OboutRadioButton = New Obout.Interface.OboutRadioButton()
            OboutRadioButton13.ID = "OboutRadioButton6"
            OboutRadioButton13.Text = "Multiline Textbox"
            OboutRadioButton13.GroupName = "Items"
            OboutRadioButton13.ClientSideEvents.OnCheckedChanged = "onCheckedChanged"

            Dim divContainer9 As Literal = New Literal()
            divContainer9.Text = "</span>"

            Dim divContainer10 As Literal = New Literal()
            divContainer10.Text = "</div>"

            Dim divContainer11 As Literal = New Literal()
            divContainer11.Text = "<div class=""column"">"

            Dim divContainer12 As Literal = New Literal()
            divContainer12.Text = "<h4>Miscellaneous</h4><hr/>"

            Dim divContainer13 As Literal = New Literal()
            divContainer13.Text = "<span>"

            Dim OboutRadioButton14 As Obout.Interface.OboutRadioButton = New Obout.Interface.OboutRadioButton()
            OboutRadioButton14.ID = "OboutRadioButton14"
            OboutRadioButton14.Text = "TreeView for Classic ASP"
            OboutRadioButton14.GroupName = "Items"
            OboutRadioButton14.ClientSideEvents.OnCheckedChanged = "onCheckedChanged"

            Dim spacer12 As Literal = New Literal()
            spacer12.Text = "<br />"

            Dim OboutRadioButton15 As Obout.Interface.OboutRadioButton = New Obout.Interface.OboutRadioButton()
            OboutRadioButton15.ID = "OboutRadioButton15"
            OboutRadioButton15.Text = "Site Monitoring"
            OboutRadioButton15.GroupName = "Items"
            OboutRadioButton15.ClientSideEvents.OnCheckedChanged = "onCheckedChanged"


            Dim divContainer14 As Literal = New Literal()
            divContainer14.Text = "</span>"

            Dim divContainer15 As Literal = New Literal()
            divContainer15.Text = "</div>"

            templatePlaceHolder.Controls.Add(divContainer)
            templatePlaceHolder.Controls.Add(divContainer2)
            templatePlaceHolder.Controls.Add(divContainer3)
            templatePlaceHolder.Controls.Add(OboutRadioButton1)
            templatePlaceHolder.Controls.Add(spacer1)
            templatePlaceHolder.Controls.Add(OboutRadioButton2)
            templatePlaceHolder.Controls.Add(spacer2)
            templatePlaceHolder.Controls.Add(OboutRadioButton3)
            templatePlaceHolder.Controls.Add(spacer3)
            templatePlaceHolder.Controls.Add(OboutRadioButton4)
            templatePlaceHolder.Controls.Add(spacer4)
            templatePlaceHolder.Controls.Add(OboutRadioButton5)
            templatePlaceHolder.Controls.Add(spacer5)
            templatePlaceHolder.Controls.Add(OboutRadioButton6)
            templatePlaceHolder.Controls.Add(divContainer4)
            templatePlaceHolder.Controls.Add(divContainer5)
            templatePlaceHolder.Controls.Add(divContainer6)
            templatePlaceHolder.Controls.Add(divContainer7)
            templatePlaceHolder.Controls.Add(divContainer8)
            templatePlaceHolder.Controls.Add(OboutRadioButton7)
            templatePlaceHolder.Controls.Add(spacer6)
            templatePlaceHolder.Controls.Add(OboutRadioButton8)
            templatePlaceHolder.Controls.Add(spacer7)
            templatePlaceHolder.Controls.Add(OboutRadioButton9)
            templatePlaceHolder.Controls.Add(spacer8)
            templatePlaceHolder.Controls.Add(OboutRadioButton10)
            templatePlaceHolder.Controls.Add(spacer9)
            templatePlaceHolder.Controls.Add(OboutRadioButton11)
            templatePlaceHolder.Controls.Add(spacer10)
            templatePlaceHolder.Controls.Add(OboutRadioButton12)
            templatePlaceHolder.Controls.Add(spacer11)
            templatePlaceHolder.Controls.Add(OboutRadioButton13)
            templatePlaceHolder.Controls.Add(divContainer9)
            templatePlaceHolder.Controls.Add(divContainer10)
            templatePlaceHolder.Controls.Add(divContainer11)
            templatePlaceHolder.Controls.Add(divContainer12)
            templatePlaceHolder.Controls.Add(divContainer13)
            templatePlaceHolder.Controls.Add(OboutRadioButton14)
            templatePlaceHolder.Controls.Add(spacer12)
            templatePlaceHolder.Controls.Add(OboutRadioButton15)
            templatePlaceHolder.Controls.Add(divContainer14)
            templatePlaceHolder.Controls.Add(divContainer15)
        End Sub
    End Class
End Class
