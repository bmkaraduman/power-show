using System.Data.OleDb;
using System.Data;
using System.Web.UI.WebControls;
using System.Collections;
using OboutInc.EasyMenu_Pro;

public class cs_fromdatabase : System.Web.UI.Page
{
	protected PlaceHolder placeHolder1;
	protected PlaceHolder placeHolder2;
	
	private void Page_Load(object sender, System.EventArgs e)
	{
		string sConnectionString;
		OleDbDataReader oReader1;
		OleDbDataReader oReader2;

        sConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/EasyMenu.mdb");
		OleDbConnection Cn = new OleDbConnection(sConnectionString);
		Cn.Open();
		string SQL = "SELECT * FROM EasyMenu";
		
		// build menu1 - using sifferent style for the header menu
		OleDbCommand Com1 = new OleDbCommand(SQL,Cn);
		oReader1 = Com1.ExecuteReader();
		BuildMenu1(oReader1);
		oReader1.Close();
		
		// build menu2
		OleDbCommand Com2 = new OleDbCommand(SQL,Cn);
		oReader2 = Com2.ExecuteReader();
		BuildMenu2(oReader2);
		oReader2.Close();
		
		Cn.Close();
	}
	
	private void BuildMenu1(OleDbDataReader oReader)
	{
		/*** main menu - records with ParentId = 0 ***/
		EasyMenu mainEM = null;
		/*** ***/
		
		/*** list with child menus ***/
		Hashtable childMenus = null;
		
		while (oReader.Read()) 
		{
			int parentId = oReader.GetInt32(1);
			if (parentId == 0)
			{
				if (mainEM == null)
				{
					mainEM = new EasyMenu();
					mainEM.ID = "mainEM";
					mainEM.StyleFolder = "styles/horizontal1";
					mainEM.Width = "400";
					mainEM.ShowEvent = MenuShowEvent.Always;
					mainEM.Position = MenuPosition.Horizontal;
					
					// css classes names for the menu and the item container
					mainEM.CSSMenu = "ParentMenu";
					mainEM.CSSMenuItemContainer = "ParentItemContainer";
					
					// css classes names for MenuItems
					CSSClasses MenuItemCssClasses = mainEM.CSSClassesCollection[mainEM.CSSClassesCollection.Add(new CSSClasses(typeof(OboutInc.EasyMenu_Pro.MenuItem)))];
					MenuItemCssClasses.ComponentSubMenuCellOver="ParentItemSubMenuCellOver";
					MenuItemCssClasses.ComponentContentCell="ParentItemContentCell";
					MenuItemCssClasses.Component="ParentItem";
					MenuItemCssClasses.ComponentSubMenuCell="ParentItemSubMenuCell";
					MenuItemCssClasses.ComponentIconCellOver="ParentItemIconCellOver";
					MenuItemCssClasses.ComponentIconCell="ParentItemIconCell";
					MenuItemCssClasses.ComponentOver="ParentItemOver";
					MenuItemCssClasses.ComponentContentCellOver="ParentItemContentCellOver";
					// add the classes names to the collection
					mainEM.CSSClassesCollection.Add(MenuItemCssClasses);
					
					// css classes names for MenuSeparators
					CSSClasses MenuSeparatorCssClasses = mainEM.CSSClassesCollection[mainEM.CSSClassesCollection.Add(new CSSClasses(typeof(MenuSeparator)))];
					MenuSeparatorCssClasses.ComponentSubMenuCellOver="ParentSeparatorSubMenuCellOver";
					MenuSeparatorCssClasses.ComponentContentCell="ParentSeparatorContentCell";
					MenuSeparatorCssClasses.Component="ParentSeparator";
					MenuSeparatorCssClasses.ComponentSubMenuCell="ParentSeparatorSubMenuCell";
					MenuSeparatorCssClasses.ComponentIconCellOver="ParentSeparatorIconCellOver";
					MenuSeparatorCssClasses.ComponentIconCell="ParentSeparatorIconCell";
					MenuSeparatorCssClasses.ComponentOver="ParentSeparatorOver";
					MenuSeparatorCssClasses.ComponentContentCellOver="ParentSeparatorContentCellOver";
					// add the classes names to the collection
					mainEM.CSSClassesCollection.Add(MenuSeparatorCssClasses);
				}
				
				mainEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item_" + oReader.GetInt32(0).ToString(), oReader.GetString(2), "", "", "", ""));

				placeHolder1.Controls.Add(mainEM);
			}
			else
			{
				if (childMenus == null)
					childMenus = new Hashtable();
				
				/* first time the menu is ceated */
				if (!childMenus.ContainsKey(parentId))
				{
					EasyMenu childEM = new EasyMenu();
					childEM.ID = "childEM_" + parentId;
					childEM.StyleFolder = "styles/horizontal1";
					childEM.ShowEvent = MenuShowEvent.MouseOver;
					childEM.AttachTo = "item_" + parentId;
					childEM.Width = "150";
					
					int menuLevel = oReader.GetInt32(3);
					if (menuLevel == 1)
						childEM.Align = MenuAlign.Under;
					else
						childEM.Align = MenuAlign.Left;
					
					childEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item_" + oReader.GetInt32(0).ToString(), oReader.GetString(2), "", "", "", ""));
					
					childMenus.Add(parentId, childEM);
					
					placeHolder1.Controls.Add(childEM);
				}
				/* items are added to the already created menu */
				else
				{
					EasyMenu childEM = (EasyMenu)childMenus[parentId];
					
					childEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item_" + oReader.GetInt32(0).ToString(), oReader.GetString(2), "", "", "", ""));
				}
			}
		}
	}
	
	private void BuildMenu2(OleDbDataReader oReader)
	{
		/*** main menu - records with ParentId = 0 ***/
		EasyMenu mainEM = null;
		/*** ***/
		
		/*** list with child menus ***/
		Hashtable childMenus = null;
		
		while (oReader.Read()) 
		{
			int parentId = oReader.GetInt32(1);
			if (parentId == 0)
			{
				if (mainEM == null)
				{
					mainEM = new EasyMenu();
					mainEM.ID = "VmainEM";
					mainEM.StyleFolder = "styles/horizontal1";
					mainEM.Width = "400";
					mainEM.ShowEvent = MenuShowEvent.Always;
					mainEM.Position = MenuPosition.Horizontal;
				}
				
				mainEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("Vitem_" + oReader.GetInt32(0).ToString(), oReader.GetString(2), "", "", "", ""));

				placeHolder2.Controls.Add(mainEM);
			}
			else
			{
				if (childMenus == null)
					childMenus = new Hashtable();
				
				/* first time the menu is ceated */
				if (!childMenus.ContainsKey(parentId))
				{
					EasyMenu childEM = new EasyMenu();
					childEM.ID = "VchildEM_" + parentId;
					childEM.StyleFolder = "styles/horizontal1";
					childEM.ShowEvent = MenuShowEvent.MouseOver;
					childEM.AttachTo = "Vitem_" + parentId;
					childEM.Width = "150";
					
					int menuLevel = oReader.GetInt32(3);
					if (menuLevel == 1)
						childEM.Align = MenuAlign.Under;
					else
						childEM.Align = MenuAlign.Left;
					
					childEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("Vitem_" + oReader.GetInt32(0).ToString(), oReader.GetString(2), "", "", "", ""));
					
					childMenus.Add(parentId, childEM);
					
					placeHolder1.Controls.Add(childEM);
				}
				/* items are added to the already created menu */
				else
				{
					EasyMenu childEM = (EasyMenu)childMenus[parentId];
					
					childEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("Vitem_" + oReader.GetInt32(0).ToString(), oReader.GetString(2), "", "", "", ""));
				}
			}
		}
	}
}