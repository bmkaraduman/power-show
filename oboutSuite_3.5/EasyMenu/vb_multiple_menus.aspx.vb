imports System
imports OboutInc.EasyMenu_Pro

Public Class vb_multiple_menus
    Inherits System.Web.UI.Page

    Protected placeHolder1 As System.Web.UI.WebControls.PlaceHolder
    Protected placeHolder2 As System.Web.UI.WebControls.PlaceHolder
    Protected EasymenuMain1 As EasyMenu
    Protected EasymenuMain2 As EasyMenu
    Protected Easymenu11 As EasyMenu
    Protected Easymenu12 As EasyMenu
    Protected Easymenu13 As EasyMenu
    Protected Easymenu14 As EasyMenu
    Protected Easymenu21 As EasyMenu
    Protected Easymenu22 As EasyMenu
    Protected Easymenu23 As EasyMenu
    Protected Easymenu24 As EasyMenu

    Private Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

        If Not Page.IsPostBack Then

            ' EasymenuMain1
            EasymenuMain1.StyleFolder = "styles/style1_multiple_menus"
            EasymenuMain1.Width = "330"
            EasymenuMain1.ShowEvent = MenuShowEvent.Always
            EasymenuMain1.Position = MenuPosition.Horizontal

            EasymenuMain1.AddItem(New MenuItem("item11", "Item 1", "", "", "", ""))
            EasymenuMain1.AddItem(New MenuItem("item12", "Item 2", "", "", "", ""))
            EasymenuMain1.AddItem(New MenuItem("item13", "Item 3", "", "", "", ""))
            EasymenuMain1.AddItem(New MenuItem("item14", "Item 4", "", "", "", ""))

            ' EasymenuMain2
            EasymenuMain2.StyleFolder = "styles/style2_multiple_menus"
            EasymenuMain2.Width = "330"
            EasymenuMain2.ShowEvent = MenuShowEvent.Always
            EasymenuMain2.Position = MenuPosition.Horizontal
            EasymenuMain2.CSSMenu = "easyMenu2"
            EasymenuMain2.CSSMenuItemContainer = "easyMenuItemContainer2"

            Dim MenuItemCssClasses As CSSClasses = EasymenuMain2.CSSClassesCollection(EasymenuMain2.CSSClassesCollection.Add(New CSSClasses(GetType(MenuItem))))
            MenuItemCssClasses.ComponentSubMenuCellOver = "easyMenuItemSubMenuCellOver2"
            MenuItemCssClasses.ComponentContentCell = "easyMenuItemContentCell2"
            MenuItemCssClasses.Component = "easyMenuItem2"
            MenuItemCssClasses.ComponentSubMenuCell = "easyMenuItemSubMenuCell2"
            MenuItemCssClasses.ComponentIconCellOver = "easyMenuItemIconCellOver2"
            MenuItemCssClasses.ComponentIconCell = "easyMenuItemIconCell2"
            MenuItemCssClasses.ComponentOver = "easyMenuItemOver2"
            MenuItemCssClasses.ComponentContentCellOver = "easyMenuItemContentCellOver2"
            EasymenuMain2.CSSClassesCollection.Add(MenuItemCssClasses)

            Dim MenuSeparatorCssClasses As CSSClasses = EasymenuMain2.CSSClassesCollection(EasymenuMain2.CSSClassesCollection.Add(New CSSClasses(GetType(MenuSeparator))))
            MenuSeparatorCssClasses.ComponentSubMenuCellOver = "easyMenuSeparatorSubMenuCellOver2"
            MenuSeparatorCssClasses.ComponentContentCell = "easyMenuSeparatorContentCell2"
            MenuSeparatorCssClasses.Component = "easyMenuSeparator2"
            MenuSeparatorCssClasses.ComponentSubMenuCell = "easyMenuSeparatorSubMenuCell2"
            MenuSeparatorCssClasses.ComponentIconCellOver = "easyMenuSeparatorIconCellOver2"
            MenuSeparatorCssClasses.ComponentIconCell = "easyMenuSeparatorIconCell2"
            MenuSeparatorCssClasses.ComponentOver = "easyMenuSeparatorOver2"
            MenuSeparatorCssClasses.ComponentContentCellOver = "easyMenuSeparatorContentCellOver2"
            EasymenuMain2.CSSClassesCollection.Add(MenuSeparatorCssClasses)

            EasymenuMain2.AddItem(New MenuItem("item21", "Item 1", "", "", "", ""))
            EasymenuMain2.AddItem(New MenuItem("item22", "Item 2", "", "", "", ""))
            EasymenuMain2.AddItem(New MenuItem("item23", "Item 3", "", "", "", ""))
            EasymenuMain2.AddItem(New MenuItem("item24", "Item 4", "", "", "", ""))

            ' Easymenu11
            Easymenu11.AttachTo = "item11"
            Easymenu11.StyleFolder = "styles/style1_multiple_menus"
            Easymenu11.Width = "140"
            Easymenu11.ShowEvent = MenuShowEvent.MouseOver
            Easymenu11.Align = MenuAlign.Under
            Easymenu11.AddItem(New MenuItem("menuItem111", "Item11", "", "", "", ""))
            Easymenu11.AddItem(New MenuItem("menuItem112", "Item12", "", "", "", ""))
            Easymenu11.AddItem(New MenuItem("menuItem113", "Item13", "", "", "", ""))

            ' Easymenu12
            Easymenu12.AttachTo = "item12"
            Easymenu12.StyleFolder = "styles/style1_multiple_menus"
            Easymenu12.Width = "140"
            Easymenu12.ShowEvent = MenuShowEvent.MouseOver
            Easymenu12.Align = MenuAlign.Under
            Easymenu12.AddItem(New MenuItem("menuItem121", "Item21", "", "", "", ""))
            Easymenu12.AddItem(New MenuItem("menuItem122", "Item22", "", "", "", ""))

            ' Easymenu13
            Easymenu13.AttachTo = "item13"
            Easymenu13.StyleFolder = "styles/style1_multiple_menus"
            Easymenu13.Width = "140"
            Easymenu13.ShowEvent = MenuShowEvent.MouseOver
            Easymenu13.Align = MenuAlign.Under
            Easymenu13.AddItem(New MenuItem("menuItem131", "Item31", "", "", "", ""))
            Easymenu13.AddItem(New MenuItem("menuItem132", "Item32", "", "", "", ""))
            Easymenu13.AddItem(New MenuItem("menuItem133", "Item33", "", "", "", ""))
            Easymenu13.AddItem(New MenuItem("menuItem134", "Item34", "", "", "", ""))
            Easymenu13.AddItem(New MenuItem("menuItem135", "Item35", "", "", "", ""))
            Easymenu13.AddItem(New MenuItem("menuItem136", "Item36", "", "", "", ""))

            ' Easymenu14
            Easymenu14.AttachTo = "item14"
            Easymenu14.StyleFolder = "styles/style1_multiple_menus"
            Easymenu14.Width = "140"
            Easymenu14.ShowEvent = MenuShowEvent.MouseOver
            Easymenu14.Align = MenuAlign.Under
            Easymenu14.AddItem(New MenuItem("menuItem141", "Item41", "", "", "", ""))
            Easymenu14.AddItem(New MenuItem("menuItem142", "Item42", "", "", "", ""))
            Easymenu14.AddItem(New MenuItem("menuItem143", "Item43", "", "", "", ""))

            ' Easymenu21
            Easymenu21.AttachTo = "item21"
            Easymenu21.StyleFolder = "styles/style1_multiple_menus"
            Easymenu21.Width = "140"
            Easymenu21.ShowEvent = MenuShowEvent.MouseOver
            Easymenu21.Align = MenuAlign.Under
            Easymenu21.AddItem(New MenuItem("menuItem211", "Item11", "", "", "", ""))
            Easymenu21.AddItem(New MenuItem("menuItem212", "Item12", "", "", "", ""))
            Easymenu21.AddItem(New MenuItem("menuItem213", "Item13", "", "", "", ""))

            ' Easymenu22
            Easymenu22.AttachTo = "item22"
            Easymenu22.StyleFolder = "styles/style1_multiple_menus"
            Easymenu22.Width = "140"
            Easymenu22.ShowEvent = MenuShowEvent.MouseOver
            Easymenu22.Align = MenuAlign.Under
            Easymenu22.AddItem(New MenuItem("menuItem221", "Item21", "", "", "", ""))

            ' Easymenu23
            Easymenu23.AttachTo = "item23"
            Easymenu23.StyleFolder = "styles/style1_multiple_menus"
            Easymenu23.Width = "140"
            Easymenu23.ShowEvent = MenuShowEvent.MouseOver
            Easymenu23.Align = MenuAlign.Under
            Easymenu23.AddItem(New MenuItem("menuItem231", "Item31", "", "", "", ""))
            Easymenu23.AddItem(New MenuItem("menuItem232", "Item32", "", "", "", ""))
            Easymenu23.AddItem(New MenuItem("menuItem233", "Item33", "", "", "", ""))
            Easymenu23.AddItem(New MenuItem("menuItem234", "Item34", "", "", "", ""))

            ' Easymenu24
            Easymenu24.AttachTo = "item24"
            Easymenu24.StyleFolder = "styles/style1_multiple_menus"
            Easymenu24.Width = "140"
            Easymenu24.ShowEvent = MenuShowEvent.MouseOver
            Easymenu24.Align = MenuAlign.Under
            Easymenu24.AddItem(New MenuItem("menuItem241", "Item41", "", "", "", ""))
            Easymenu24.AddItem(New MenuItem("menuItem242", "Item42", "", "", "", ""))
            Easymenu24.AddItem(New MenuItem("menuItem243", "Item43", "", "", "", ""))

        End If
    End Sub

    Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)

        ' EasymenuMain1
        EasymenuMain1 = New EasyMenu()
        EasymenuMain1.ID = "EasymenuMain1"
        placeHolder1.Controls.Add(EasymenuMain1)

        ' EasymenuMain2
        EasymenuMain2 = New EasyMenu()
        EasymenuMain2.ID = "EasymenuMain2"
        placeHolder2.Controls.Add(EasymenuMain2)

        ' Easymenu11
        Easymenu11 = New EasyMenu()
        Easymenu11.ID = "Easymenu11"
        placeHolder1.Controls.Add(Easymenu11)

        ' Easymenu12
        Easymenu12 = New EasyMenu()
        Easymenu12.ID = "Easymenu12"
        placeHolder1.Controls.Add(Easymenu12)

        ' Easymenu13
        Easymenu13 = New EasyMenu()
        Easymenu13.ID = "Easymenu13"
        placeHolder1.Controls.Add(Easymenu13)

        ' Easymenu14
        Easymenu14 = New EasyMenu()
        Easymenu14.ID = "Easymenu14"
        placeHolder1.Controls.Add(Easymenu14)

        ' Easymenu21
        Easymenu21 = New EasyMenu()
        Easymenu21.ID = "Easymenu21"
        placeHolder2.Controls.Add(Easymenu21)

        ' Easymenu22
        Easymenu22 = New EasyMenu()
        Easymenu22.ID = "Easymenu22"
        placeHolder2.Controls.Add(Easymenu22)

        ' Easymenu23
        Easymenu23 = New EasyMenu()
        Easymenu23.ID = "Easymenu23"
        placeHolder2.Controls.Add(Easymenu23)

        ' Easymenu24
        Easymenu24 = New EasyMenu()
        Easymenu24.ID = "Easymenu24"
        placeHolder2.Controls.Add(Easymenu24)
    End Sub

End Class