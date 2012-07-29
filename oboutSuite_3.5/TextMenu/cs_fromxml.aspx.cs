using OboutInc.TextMenu;
using System.Web.UI.WebControls;

public class cs_fromxml : System.Web.UI.Page
{
	protected PlaceHolder placeHolder1;
	
	private void Page_Load(object sender, System.EventArgs e)
	{
		System.Xml.XmlDocument xmlDoc = new System.Xml.XmlDocument();
		xmlDoc.Load(Server.MapPath("TextMenuXML.xml"));

		System.Xml.XmlNodeList menuNodes = xmlDoc.SelectNodes("/TextMenu");

		foreach (System.Xml.XmlNode menuNode in menuNodes)
		{
			string menuID = menuNode.Attributes["ID"].Value;

			// create new TextMenu object ...
			TextMenu tmpMenu = new TextMenu();
			tmpMenu.ID = menuID;
			
			// take the childs and create the menu items ...
			System.Xml.XmlNodeList menuItemsNodes = menuNode.SelectNodes("//Item");

			foreach (System.Xml.XmlNode menuItemNode in menuItemsNodes)
			{
				string menuItemID = menuItemNode.Attributes["ID"].Value;
				string InnerHTML = menuItemNode.Attributes["InnerHTML"].Value;
				string parentMenuItemID = null;
				if (menuItemNode.Attributes["ParentID"] != null)
					parentMenuItemID = menuItemNode.Attributes["ParentID"].Value;
				string menuUrl = null;
				if (menuItemNode.Attributes["Url"] != null)
					menuUrl = menuItemNode.Attributes["Url"].Value;

				// create new Menu item object and add it to the created menu ...
				tmpMenu.Add(parentMenuItemID, menuItemID, InnerHTML, menuUrl, null);
			}
			
			placeHolder1.Controls.Add(tmpMenu);
		}
	}
}