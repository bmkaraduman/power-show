imports OboutInc.TextMenu
imports System.Web.UI.WebControls

public class vb_fromxml
	inherits System.Web.UI.Page
	
	protected placeHolder1 as PlaceHolder
	
	private sub Page_Load(byval sender as object, byval e as System.EventArgs)
	
		dim xmlDoc as System.Xml.XmlDocument = new System.Xml.XmlDocument()
		xmlDoc.Load(Server.MapPath("TextMenuXML.xml"))

		dim menuNodes as System.Xml.XmlNodeList = xmlDoc.SelectNodes("/TextMenu")

		for each menuNode as System.Xml.XmlNode in menuNodes
		
			dim menuID as string = menuNode.Attributes("ID").Value

			' create new TextMenu object ...
			dim tmpMenu as TextMenu = new TextMenu()
			tmpMenu.ID = menuID
			
			' take the childs and create the menu items ...
			dim menuItemsNodes as System.Xml.XmlNodeList = menuNode.SelectNodes("//Item")

			for each menuItemNode as System.Xml.XmlNode in menuItemsNodes
			
				dim menuItemID as string = menuItemNode.Attributes("ID").Value
				dim InnerHTML as string = menuItemNode.Attributes("InnerHTML").Value
				dim parentMenuItemID as string = nothing
				if not menuItemNode.Attributes("ParentID") is nothing
					parentMenuItemID = menuItemNode.Attributes("ParentID").Value
				end if
				dim menuUrl as string = nothing
				if not menuItemNode.Attributes("Url") is nothing
					menuUrl = menuItemNode.Attributes("Url").Value
				end if

				' create new Menu item object and add it to the created menu ...
				tmpMenu.Add(parentMenuItemID, menuItemID, InnerHTML, menuUrl, nothing)
				
			next 
			
			placeHolder1.Controls.Add(tmpMenu)
			
		next
		
	end sub
	
end class