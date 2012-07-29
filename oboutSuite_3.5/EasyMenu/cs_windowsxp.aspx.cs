using System;
using OboutInc.EasyMenu_Pro;

public class cs_windowsxp : System.Web.UI.Page
{
	protected System.Web.UI.WebControls.PlaceHolder placeHolder1;
	protected EasyMenu EasyMenu1;
	protected EasyMenu EasyMenu2;
	
	private void Page_Load(object sender, System.EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			EasyMenu1 = new EasyMenu();			
			EasyMenu1.ID = "EasyMenu1";
			EasyMenu1.StyleFolder = "styles/windowsxp";
			EasyMenu1.IconsFolder = "icons";
			EasyMenu1.UseIcons = true;
			EasyMenu1.Width = "140";
			EasyMenu1.AttachTo = "div1";
			EasyMenu1.ShowEvent = MenuShowEvent.ContextMenu;
			EasyMenu1.Align = MenuAlign.Under;
			
			// add the items for the menu
			EasyMenu1.AddMenuItem("menuItem1", "<span style='color:#666666; font:bold; cursor:pointer;'>obout.com<b style='color:crimson; text-decoration:none;'> Home</b></span>", null,  "http://www.obout.com", "_blank", null);
			EasyMenu1.AddMenuItem("menuItem2", "Alert", null, null, null, "alert('you just clicked Alert')");
			EasyMenu1.AddMenuItem("menuItem3", "<input type='checkbox' style='height:14px; width:14px;' checked='1'> Any <span style='background-color:gold; padding-left:2px; padding-right:2px;'>HTML</span>", null, null, null, null);
			EasyMenu1.AddSeparator("menuSeparator1", "");
			EasyMenu1.AddMenuItem("menuItem4", "Browser Operation", null, null, null, null);
			EasyMenu1.AddSeparator("menuSeparator2", "");
			EasyMenu1.AddMenuItem("menuItem5", "Recycle", "xpRecycle.gif", null, null, null);
			
			// add the menu to the placeholder on the page
			placeHolder1.Controls.Add(EasyMenu1);
			
			EasyMenu2 = new EasyMenu();			
			EasyMenu2.ID = "EasyMenu2";
			EasyMenu2.StyleFolder = "styles/windowsxp";
			EasyMenu2.IconsFolder = "icons";
			EasyMenu2.UseIcons = true;
			EasyMenu2.Width = "140";
			EasyMenu2.AttachTo = "menuItem4";
			EasyMenu2.ShowEvent = MenuShowEvent.MouseOver;
			EasyMenu2.Align = MenuAlign.Right;
			
			// add the items for the menu
			EasyMenu2.AddMenuItem("menuItem11", "Open New Page", "new.gif",  "about:blank", "_blank", null);
			EasyMenu2.AddMenuItem("menuItem12", "Close This Page", "delete.gif", null, null, "try {window.opener.focus(); window.opener = this; window.close();} catch (e) {};");
		
			placeHolder1.Controls.Add(EasyMenu2);
		}
	}
}