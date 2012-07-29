using System;
using OboutInc.EasyMenu_Pro;

namespace EM_Examples
{
	public class vertical : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.PlaceHolder placeHolder1;
		protected EasyMenu mainEM;
		protected EasyMenu em_1;
		protected EasyMenu em_2;
		protected EasyMenu em_4;
		protected EasyMenu em_5;
		protected EasyMenu em_6;

		private void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				// create the Parent EasyMenu
				mainEM = new EasyMenu();
				// set the ID (must be unique)
				mainEM.ID = "MainEM";
				// set the style for this menu
				mainEM.StyleFolder = "styles/vertical1";
				mainEM.Width = "140";
				// show event is always so the menu is always visible
				// this menu doesn't require any AttachTo or Align properties set
				mainEM.ShowEvent = MenuShowEvent.Always;
				// display the menu vertically
				mainEM.Position = MenuPosition.Vertical;

				// the parent menu looks the same as the child menus so we don't need 
				// to set different CSS classes names for its items or the menu

				// add the items for the menu
				mainEM.AddItem(new MenuItem("item1", "Item 1", "", "", "", ""));
				mainEM.AddItem(new MenuItem("item2", "Item 2", "", "", "", ""));
				mainEM.AddItem(new MenuItem("item3", "Item 3", "", "", "", ""));
				mainEM.AddItem(new MenuItem("item4", "Item 4", "", "", "", ""));
				mainEM.AddItem(new MenuItem("item5", "Item 5", "", "", "", ""));

				// add the menu to the placeholder on the page
				placeHolder1.Controls.Add(mainEM);


				// Create the submenus
				em_1 = new EasyMenu();
				em_1.ID = "Easymenu1";
				// this will attach to the first item of the parent menu (id=item1)
				em_1.AttachTo = "item1";
				em_1.StyleFolder = "styles/vertical1";
				em_1.Width = "140";
				// it will show on mouse over
				em_1.ShowEvent = MenuShowEvent.MouseOver;
				// and will align to the right of the item to which it is attached
				em_1.Align = MenuAlign.Right;
				// here are this menu's items
				em_1.AddItem(new MenuItem("menuItem1", "SubItem 1", "", "", "", "alert('Item 1 - SubItem 1')"));
				em_1.AddItem(new MenuItem("menuItem2", "SubItem 2", "", "", "", "alert('Item 1 - SubItem 2')"));
				em_1.AddItem(new MenuItem("menuItem3", "SubItem 3", "", "", "", "alert('Item 1 - SubItem 3')"));
				em_1.AddItem(new MenuItem("menuItem4", "SubItem 4", "", "", "", "alert('Item 1 - SubItem 4')"));
				em_1.AddItem(new MenuItem("menuItem5", "SubItem 5", "", "", "", "alert('Item 1 - SubItem 5')"));

				// and so on for every submenu
				em_2 = new EasyMenu();
				em_2.ID = "Easymenu2";
				em_2.AttachTo = "item2";
				em_2.StyleFolder = "styles/vertical1";
				em_2.Width = "140";
				em_2.ShowEvent = MenuShowEvent.MouseOver;
				em_2.Align = MenuAlign.Right;
				em_2.AddItem(new MenuItem("menuItem6", "SubItem 1", "", "", "", "alert('Item 2 - SubItem 1')"));
				em_2.AddItem(new MenuItem("menuItem7", "SubItem 2", "", "", "", "alert('Item 2 - SubItem 2')"));
				em_2.AddItem(new MenuItem("menuItem8", "SubItem 3", "", "", "", "alert('Item 2 - SubItem 3')"));

				em_4 = new EasyMenu();
				em_4.ID = "Easymenu4";
				em_4.AttachTo = "item4";
				em_4.StyleFolder = "styles/vertical1";
				em_4.Width = "140";
				em_4.ShowEvent = MenuShowEvent.MouseOver;
				em_4.Align = MenuAlign.Right;
				em_4.AddItem(new MenuItem("menuItem9", "SubItem 1", "", "", "", "alert('Item 4 - SubItem 1')"));
				em_4.AddItem(new MenuItem("menuItem10", "SubItem 2", "", "", "", "alert('Item 4 - SubItem 2')"));

				em_5 = new EasyMenu();
				em_5.ID = "Easymenu5";
				em_5.AttachTo = "item5";
				em_5.StyleFolder = "styles/vertical1";
				em_5.Width = "140";
				em_5.ShowEvent = MenuShowEvent.MouseOver;
				em_5.Align = MenuAlign.Right;
				em_5.AddItem(new MenuItem("menuItem11", "SubItem 1", "", "", "", "alert('Item 5 - SubItem 1')"));
				em_5.AddItem(new MenuItem("menuItem12", "SubItem 2", "", "", "", "alert('Item 5 - SubItem 2')"));
				em_5.AddItem(new MenuItem("menuItem13", "SubItem 3", "", "", "", "alert('Item 5 - SubItem 3')"));
				em_5.AddItem(new MenuItem("menuItem14", "SubItem 4", "", "", "", "alert('Item 5 - SubItem 4')"));
				em_5.AddItem(new MenuItem("menuItem15", "SubItem 5", "", "", "", "alert('Item 5 - SubItem 5')"));

				em_6 = new EasyMenu();
				em_6.ID = "Easymenu6";
				em_6.AttachTo = "menuItem3";
				em_6.StyleFolder = "styles/vertical1";
				em_6.Width = "140";
				em_6.ShowEvent = MenuShowEvent.MouseOver;
				em_6.Align = MenuAlign.Right;
				em_6.OffsetVertical = 0;
				em_6.OffsetHorizontal = -4;
				em_6.AddItem(new MenuItem("menuItem31", "SubItem 1", "", "", "", "alert('Item 1 - SubItem 3 - SubItem 1')"));
				em_6.AddItem(new MenuItem("menuItem32", "SubItem 2", "", "", "", "alert('Item 1 - SubItem 3 - SubItem 2')"));
				em_6.AddItem(new MenuItem("menuItem33", "SubItem 3", "", "", "", "alert('Item 1 - SubItem 3 - SubItem 3')"));

				// add the submenus to the page
				placeHolder1.Controls.Add(em_1);
				placeHolder1.Controls.Add(em_2);
				placeHolder1.Controls.Add(em_4);
				placeHolder1.Controls.Add(em_5);
				placeHolder1.Controls.Add(em_6);
			}
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
	
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}