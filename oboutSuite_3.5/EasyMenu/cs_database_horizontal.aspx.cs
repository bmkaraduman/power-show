using System.Data.OleDb;
using System.Data;
using System.Web.UI.WebControls;
using OboutInc.EasyMenu_Pro;

public class cs_database_horizontal : System.Web.UI.Page
{
	protected PlaceHolder placeHolder1;
	
	private void Page_Init(object sender, System.EventArgs e)
	{
		string sConnectionString;
		OleDbDataReader oReader;
		
		sConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/DBDEMO_horizontal.mdb");
		OleDbConnection Cn = new OleDbConnection(sConnectionString);
		string SQL = "SELECT * FROM Menus a Inner Join MenuItems b ON (a.ID = b.MENUID) ORDER BY a.ATTACHTO, a.ID, b.ORDER";
		OleDbCommand Com = new OleDbCommand(SQL,Cn);
		Cn.Open();
		oReader = Com.ExecuteReader();
		string lastMenuId = "";
		EasyMenu oem = null;

		// Populate EM in one loop.
		while (oReader.Read()) 
		{
			// Initialising a new EM
			if (oReader.GetString(oReader.GetOrdinal("menuID")) != lastMenuId)
			{
				oem = new EasyMenu();
				oem.ID = oReader.GetString(oReader.GetOrdinal("menuid"));

				// if an attachto property is set, this is not the main menu
				if (!oReader.IsDBNull(oReader.GetOrdinal("attachto")))
				{
					oem.AttachTo = oReader.GetString(oReader.GetOrdinal("attachto"));
					// we add the menus to the page controls
					placeHolder1.Controls.Add(oem);
				}
				// otherwise this is the main menu
				else
				{
					// we add the menu to the placeholder (to display it where we need in the page)
					placeHolder1.Controls.Add(oem);
				}
				
				Session["EasyMenu_" + oem.ID] = oem;
				
				lastMenuId = oReader.GetString(oReader.GetOrdinal("menuID"));
			}
		}

		oReader.Close();
		Cn.Close();
	}
	
	private void Page_Load(object sender, System.EventArgs e)
	{
		if (!IsPostBack)
		{
			string sConnectionString;
			OleDbDataReader oReader;
			
			// The database has 2 tables, Menus for the principal menus and MenuItems for the items
			// Each Menu has an ID, and each item of that menu must have the same MENUID so they can be related
			// The Menu that has no ATTACHTO property set in the database is the main menu (parent)
			// and is the one that has ShowEvent set to Always. This has to be the first menu to add on the page
			// hence we order by ATTACHTO field first.
			sConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/DBDEMO_horizontal.mdb");
			OleDbConnection Cn = new OleDbConnection(sConnectionString);
			string SQL = "SELECT * FROM Menus a Inner Join MenuItems b ON (a.ID = b.MENUID) ORDER BY a.ATTACHTO, a.ID, b.ORDER";
			OleDbCommand Com = new OleDbCommand(SQL,Cn);
			Cn.Open();
			oReader = Com.ExecuteReader();
			string lastMenuId = "";
			EasyMenu oem = null;

			// Populate EM in one loop.
			while (oReader.Read()) 
			{
				// Initialising a new EM
				if (oReader.GetString(oReader.GetOrdinal("menuID")) != lastMenuId)
				{
					oem = (EasyMenu)Session["EasyMenu_" + oReader.GetString(oReader.GetOrdinal("menuid"))];
					oem.Position = MenuPosition.Horizontal;
					oem.Width = "140";
					oem.IconsFolder = "Icons";
					oem.StyleFolder = oReader.GetString(oReader.GetOrdinal("style"));

					// if an attachto property is set, this is not the main menu
					if (!oReader.IsDBNull(oReader.GetOrdinal("attachto")))
					{
						oem.ShowEvent = MenuShowEvent.MouseOver;
						
						if (oem.AttachTo != "item1" && oem.AttachTo != "item2" && oem.AttachTo != "item3")
							oem.Align = MenuAlign.Right;
						else
							oem.Align = MenuAlign.Under;
							
						oem.Position = MenuPosition.Vertical;
					}
					// otherwise this is the main menu
					else
					{
						oem.ShowEvent = MenuShowEvent.Always;
						oem.Width = "400px";
						
						// css classes names for MenuItems
						CSSClasses MenuItemCssClasses = oem.CSSClassesCollection[oem.CSSClassesCollection.Add(new CSSClasses(typeof(OboutInc.EasyMenu_Pro.MenuItem)))];
						MenuItemCssClasses.ComponentSubMenuCellOver="ParentItemSubMenuCellOver";
						MenuItemCssClasses.ComponentContentCell="ParentItemContentCell";
						MenuItemCssClasses.Component="ParentItem";
						MenuItemCssClasses.ComponentSubMenuCell="ParentItemSubMenuCell";
						MenuItemCssClasses.ComponentIconCellOver="ParentItemIconCellOver";
						MenuItemCssClasses.ComponentIconCell="ParentItemIconCell";
						MenuItemCssClasses.ComponentOver="ParentItemOver";
						MenuItemCssClasses.ComponentContentCellOver="ParentItemContentCellOver";
						// add the classes names to the collection
						oem.CSSClassesCollection.Add(MenuItemCssClasses);
						
						// css classes names for MenuSeparators
						CSSClasses MenuSeparatorCssClasses = oem.CSSClassesCollection[oem.CSSClassesCollection.Add(new CSSClasses(typeof(MenuSeparator)))];
						MenuSeparatorCssClasses.ComponentSubMenuCellOver="ParentSeparatorSubMenuCellOver";
						MenuSeparatorCssClasses.ComponentContentCell="ParentSeparatorContentCell";
						MenuSeparatorCssClasses.Component="ParentSeparator";
						MenuSeparatorCssClasses.ComponentSubMenuCell="ParentSeparatorSubMenuCell";
						MenuSeparatorCssClasses.ComponentIconCellOver="ParentSeparatorIconCellOver";
						MenuSeparatorCssClasses.ComponentIconCell="ParentSeparatorIconCell";
						MenuSeparatorCssClasses.ComponentOver="ParentSeparatorOver";
						MenuSeparatorCssClasses.ComponentContentCellOver="ParentSeparatorContentCellOver";
						// add the classes names to the collection
						oem.CSSClassesCollection.Add(MenuSeparatorCssClasses);
					}
				}

				// Adding either a Separator or an Item
				if (oReader.GetString(oReader.GetOrdinal("ITEMTYPE")) == "S")
					oem.AddSeparator(oReader.GetString(oReader.GetOrdinal("b.ID")), oReader.IsDBNull(oReader.GetOrdinal("HTML")) ? "" : oReader.GetString(oReader.GetOrdinal("HTML")));
				else if (oReader.GetString(oReader.GetOrdinal("ITEMTYPE")) == "I")
					oem.AddMenuItem(oReader.GetString(oReader.GetOrdinal("b.ID")), oReader.IsDBNull(oReader.GetOrdinal("HTML")) ? "" : oReader.GetString(oReader.GetOrdinal("HTML")), oReader.IsDBNull(oReader.GetOrdinal("ICON")) ? "" : oReader.GetString(oReader.GetOrdinal("ICON")), oReader.IsDBNull(oReader.GetOrdinal("URL")) ? "" : oReader.GetString(oReader.GetOrdinal("URL")), oReader.IsDBNull(oReader.GetOrdinal("URLTARGET")) ? "" : oReader.GetString(oReader.GetOrdinal("URLTARGET")), oReader.IsDBNull(oReader.GetOrdinal("ONCLIENTCLICK")) ? "" : oReader.GetString(oReader.GetOrdinal("ONCLIENTCLICK")));

				lastMenuId = oReader.GetString(oReader.GetOrdinal("menuID"));
			}

			oReader.Close();
			Cn.Close();
		}
	}
}