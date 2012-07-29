imports System
imports OboutInc.EasyMenu_Pro

public class vb_windowsxp 
	inherits System.Web.UI.Page

	protected dim placeHolder1 as System.Web.UI.WebControls.PlaceHolder
	protected dim EasyMenu1 as EasyMenu
	protected dim EasyMenu2 as EasyMenu
	
	private sub Page_Load(byval sender as object,byval e as System.EventArgs)
	
		if not Page.IsPostBack
		
			EasyMenu1 = new EasyMenu()		
			EasyMenu1.ID = "EasyMenu1"
			EasyMenu1.StyleFolder = "styles/windowsxp"
			EasyMenu1.IconsFolder = "icons"
			EasyMenu1.UseIcons = true
			EasyMenu1.Width = "140"
			EasyMenu1.AttachTo = "div1"
			EasyMenu1.ShowEvent = MenuShowEvent.ContextMenu
			EasyMenu1.Align = MenuAlign.Under
			
			' add the items for the menu
			EasyMenu1.AddMenuItem("menuItem1", "<span style='color:#666666; font:bold; cursor:pointer;'>obout.com<b style='color:crimson; text-decoration:none;'> Home</b></span>", nothing,  "http://www.obout.com", "_blank", nothing)
			EasyMenu1.AddMenuItem("menuItem2", "Alert", nothing, nothing, nothing, "alert('you just clicked Alert')")
			EasyMenu1.AddMenuItem("menuItem3", "<input type='checkbox' style='height:14px; width:14px;' checked='1'> Any <span style='background-color:gold; padding-left:2px; padding-right:2px;'>HTML</span>", nothing, nothing, nothing, nothing)
			EasyMenu1.AddSeparator("menuSeparator1", "")
			EasyMenu1.AddMenuItem("menuItem4", "Browser Operation", nothing, nothing, nothing, nothing)
			EasyMenu1.AddSeparator("menuSeparator2", "")
			EasyMenu1.AddMenuItem("menuItem5", "Recycle", "xpRecycle.gif", nothing, nothing, nothing)
			
			' add the menu to the placeholder on the page
			placeHolder1.Controls.Add(EasyMenu1)
			
			EasyMenu2 = new EasyMenu()		
			EasyMenu2.ID = "EasyMenu2"
			EasyMenu2.StyleFolder = "styles/windowsxp"
			EasyMenu2.IconsFolder = "icons"
			EasyMenu2.UseIcons = true
			EasyMenu2.Width = "140"
			EasyMenu2.AttachTo = "menuItem4"
			EasyMenu2.ShowEvent = MenuShowEvent.MouseOver
			EasyMenu2.Align = MenuAlign.Right
			
			' add the items for the menu
			EasyMenu2.AddMenuItem("menuItem11", "Open New Page", "new.gif",  "about:blank", "_blank", nothing)
			EasyMenu2.AddMenuItem("menuItem12", "Close This Page", "delete.gif", nothing, nothing, "try {window.opener.focus(); window.opener = this; window.close();} catch (e) {};")
		
			placeHolder1.Controls.Add(EasyMenu2)
		end if
	end sub
end class