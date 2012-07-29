<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="OboutInc.EasyMenu_Pro" %>
<%@ Page Language="c#" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="c#" Runat="server">
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
</script>

<html>
	<head>
	<title>obout ASP.NET Easy Menu examples</title>

	<!--// Only needed for this page's formatting //-->
	<style type="text/css">
			body 
			{
			    font-family: Verdana; 
			    font-size: XX-Small; 
			    margin: 0px; 
			    padding: 20px
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
		    .div 
		    {
		        border: black 1px solid; 
		        width: 25px; 
		        height: 25px; 
		        align: middle; 
		        background-color: silver; 
		        cursor: default;
		    }
	</style>
</head>
<body>
	<form id="Form1" runat="server">
	
		<span class="tdText"><b>ASP.NET Easy Menu - Populating from database</b></span>
	
		<br />
		<br /><br />
		<br />

	    <!--// This is where the head of the menus (the parent menu) will appear //-->
	    <span class="tdText">Menu 1</span> 
	    <asp:PlaceHolder ID="placeHolder1" EnableViewState="false" runat="server"></asp:PlaceHolder>
	    <br /><br /><br />
	    <span class="tdText">Menu 2</span>
	    <asp:PlaceHolder ID="placeHolder2" EnableViewState="false" runat="server"></asp:PlaceHolder>
    	
	    <br /><br /><br /><br /><br /><br />
	        
	    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	
        </form>
    </body>
</html>