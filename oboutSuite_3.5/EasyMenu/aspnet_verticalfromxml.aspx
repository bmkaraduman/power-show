<%@ Page Language="C#" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

	private void Page_Load(object sender, System.EventArgs e)
	{
		System.Xml.XmlDocument xmlDoc = new System.Xml.XmlDocument();
		xmlDoc.Load(Server.MapPath("EasyMenuXML.xml"));

		System.Xml.XmlNodeList menuNodes = xmlDoc.SelectNodes("//EasyMenu");

		foreach (System.Xml.XmlNode menuNode in menuNodes)
		{
			string menuID = menuNode.Attributes["ID"].Value;
			string AttachTo = menuNode.Attributes["AttachTo"].Value;

			// create new EasyMenu object ...
			
			EasyMenu tmpMenu = new EasyMenu();
			if (AttachTo == "") // main menu
			{
				EasyMenu mainEM = new EasyMenu();
				mainEM.ID = menuID;
				mainEM.StyleFolder = "styles/horizontal1";
				mainEM.Width = "140";
				mainEM.ShowEvent = MenuShowEvent.Always;
				
				tmpMenu = mainEM;
			}
			else
			{
				EasyMenu menuEM = new EasyMenu();
				menuEM.ID = menuID;
				menuEM.StyleFolder = "styles/horizontal1";
				menuEM.Width = "140";
				menuEM.ShowEvent = MenuShowEvent.MouseOver;
				menuEM.Align = MenuAlign.Right;
				menuEM.AttachTo = AttachTo;
				
				tmpMenu = menuEM;
			}

			// take the childs and create the menu items ...
			System.Xml.XmlNodeList menuItemsNodes = menuNode.SelectNodes("MenuItem");

			foreach (System.Xml.XmlNode menuItemNode in menuItemsNodes)
			{
				string menuItemID = menuItemNode.Attributes["ID"].Value;
				string InnerHTML = menuItemNode.Attributes["InnerHTML"].Value;

				// create new EasyMenu item object and add it to the created menu ...
				tmpMenu.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(menuItemID, InnerHTML, "", "", "", ""));
			}
			
			placeHolder1.Controls.Add(tmpMenu);
		}
	}
</script>

<html>
<head>
	<title>obout ASP.NET Easy Menu examples</title>
	
	<!--// Only needed for this page's formatting //-->
	<style>
		body 
		{
		    font-family: Verdana; 
		    font-size: XX-Small; 
		    margin: 0px; padding: 20px
		}
		.title 
		{
		    font-size: X-Large; 
		    padding: 20px; 
		    border-bottom: 2px solid gray;
		}
		.tdText {
                font:11px Verdana;
                color:#333333;
        }
	</style>
</head>
<body>
	<form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - Vertical from XML</b></span>
		    <br /><br />	
			<br /><br />

	        Check for "EasyMenuXML.xml".<br /><br />
	        <!--// The head of the menus //-->
	        <asp:PlaceHolder ID="placeHolder1" runat="server"></asp:PlaceHolder>
	        
	        <br /><br /><br />
	        	
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>

        </form>		
    </body>
</html>