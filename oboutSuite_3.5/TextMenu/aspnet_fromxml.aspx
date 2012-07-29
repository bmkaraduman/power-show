<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<%@ Page Language="C#" %>
<%@ Register TagPrefix="tm" Namespace="OboutInc.TextMenu" Assembly="obout_TextMenu" %>

<script runat="server">

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
</script>

<html>
<head>
	<title>Example Page - Load from XML</title>
	
	<!--// Only needed for this page's formatting //-->
	<style>
		body {font-family: Verdana; font-size: XX-Small; margin: 0px; padding: 20px}
		.title {font-size: X-Large; padding: 20px; border-bottom: 2px solid gray;}
	</style>
</head>
<body>
	<div class="title">Load from XML example</div>
	<br /><br />
	<a class="examples" href="Default.aspx?type=ASPNET">« Back to examples</a>
	<br /><br /><br />
	Check for "TextMenuXML.xml".<br /><br />
	<!--// The head of the menus //-->
	<asp:PlaceHolder ID="placeHolder1" runat="server"></asp:PlaceHolder>
		
</body>
</html>