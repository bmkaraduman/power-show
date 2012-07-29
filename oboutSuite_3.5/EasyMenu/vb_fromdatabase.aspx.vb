imports System.Data.OleDb
imports System.Data
imports System.Web.UI.WebControls
imports System.Collections
imports OboutInc.EasyMenu_Pro

public class vb_fromdatabase 
	inherits System.Web.UI.Page

	protected placeHolder1 as PlaceHolder
	protected placeHolder2 as PlaceHolder
	
	private sub Page_Load(byval sender as object, byval e as System.EventArgs)
	
		dim sConnectionString as string
		dim oReader1 as OleDbDataReader
		dim oReader2 as OleDbDataReader
			
        sConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/EasyMenu.mdb")
		dim Cn as OleDbConnection = new OleDbConnection(sConnectionString)
		Cn.Open()
		dim SQL as string = "SELECT * FROM EasyMenu"
		
		' build menu1 - using sifferent style for the header menu
		dim Com1 as OleDbCommand = new OleDbCommand(SQL,Cn)
		oReader1 = Com1.ExecuteReader()
		BuildMenu1(oReader1)
		oReader1.Close()
		
		' build menu2
		dim Com2 as OleDbCommand = new OleDbCommand(SQL,Cn)
		oReader2 = Com2.ExecuteReader()
		BuildMenu2(oReader2)
		oReader2.Close()
		
		Cn.Close()
		
	end sub
	
	private sub BuildMenu1(byval oReader as OleDbDataReader)
	
		' main menu - records with ParentId = 0 
		Dim mainEM as EasyMenu = nothing
		
		'ist with child menus 
		dim childMenus as Hashtable = nothing
		
		while oReader.Read()
		
			dim parentId as Int32 = oReader.GetInt32(1)
			if parentId = 0
			
				if mainEM is nothing
				
					mainEM = new EasyMenu()
					mainEM.ID = "mainEM"
					mainEM.StyleFolder = "styles/horizontal1"
					mainEM.Width = "400"
					mainEM.ShowEvent = MenuShowEvent.Always
					mainEM.Position = MenuPosition.Horizontal
					
					' css classes names for the menu and the item container
					mainEM.CSSMenu = "ParentMenu"
					mainEM.CSSMenuItemContainer = "ParentItemContainer"
					
					' css classes names for MenuItems
					dim MenuItemCssClasses as CSSClasses = mainEM.CSSClassesCollection(mainEM.CSSClassesCollection.Add(new CSSClasses(GetType(OboutInc.EasyMenu_Pro.MenuItem))))
					MenuItemCssClasses.ComponentSubMenuCellOver="ParentItemSubMenuCellOver"
					MenuItemCssClasses.ComponentContentCell="ParentItemContentCell"
					MenuItemCssClasses.Component="ParentItem"
					MenuItemCssClasses.ComponentSubMenuCell="ParentItemSubMenuCell"
					MenuItemCssClasses.ComponentIconCellOver="ParentItemIconCellOver"
					MenuItemCssClasses.ComponentIconCell="ParentItemIconCell"
					MenuItemCssClasses.ComponentOver="ParentItemOver"
					MenuItemCssClasses.ComponentContentCellOver="ParentItemContentCellOver"
					' add the classes names to the collection
					mainEM.CSSClassesCollection.Add(MenuItemCssClasses)
					
					' css classes names for MenuSeparators
					dim MenuSeparatorCssClasses as CSSClasses = mainEM.CSSClassesCollection(mainEM.CSSClassesCollection.Add(new CSSClasses(GetType(MenuSeparator))))
					MenuSeparatorCssClasses.ComponentSubMenuCellOver="ParentSeparatorSubMenuCellOver"
					MenuSeparatorCssClasses.ComponentContentCell="ParentSeparatorContentCell"
					MenuSeparatorCssClasses.Component="ParentSeparator"
					MenuSeparatorCssClasses.ComponentSubMenuCell="ParentSeparatorSubMenuCell"
					MenuSeparatorCssClasses.ComponentIconCellOver="ParentSeparatorIconCellOver"
					MenuSeparatorCssClasses.ComponentIconCell="ParentSeparatorIconCell"
					MenuSeparatorCssClasses.ComponentOver="ParentSeparatorOver"
					MenuSeparatorCssClasses.ComponentContentCellOver="ParentSeparatorContentCellOver"
					' add the classes names to the collection
					mainEM.CSSClassesCollection.Add(MenuSeparatorCssClasses)
				end if
				
				mainEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item_" + oReader.GetInt32(0).ToString(), oReader.GetString(2), "", "", "", ""))

				placeHolder1.Controls.Add(mainEM)
			
			else
			
				if childMenus is nothing
					childMenus = new Hashtable()
				end if
				
				' first time the menu is ceated 
				if not childMenus.ContainsKey(parentId)
				
					dim childEM as EasyMenu = new EasyMenu()
					childEM.ID = "childEM_" + parentId.ToString()
					childEM.StyleFolder = "styles/horizontal1"
					childEM.ShowEvent = MenuShowEvent.MouseOver
					childEM.AttachTo = "item_" + parentId.ToString()
					childEM.Width = "150"
					
					dim menuLevel as int32 = oReader.GetInt32(3)
					if menuLevel = 1
						childEM.Align = MenuAlign.Under
					else
						childEM.Align = MenuAlign.Left
					end if
					
					childEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item_" + oReader.GetInt32(0).ToString(), oReader.GetString(2), "", "", "", ""))
					
					childMenus.Add(parentId, childEM)
					
					placeHolder1.Controls.Add(childEM)
				
				
				' items are added to the already created menu 
				else
				
					dim childEM as EasyMenu = childMenus(parentId)
					
					childEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item_" + oReader.GetInt32(0).ToString(), oReader.GetString(2), "", "", "", ""))
				end if
				
			end if
		end while
	end sub
	
	private sub BuildMenu2(byval oReader as OleDbDataReader)
	
		' main menu - records with ParentId = 0 
		dim mainEM as EasyMenu = nothing
		
		' list with child menus 
		dim childMenus as Hashtable = nothing
		
		while oReader.Read()
		
			dim parentId as Int32 = oReader.GetInt32(1)
			if parentId = 0
			
				if mainEM is nothing
				
					mainEM = new EasyMenu()
					mainEM.ID = "VmainEM"
					mainEM.StyleFolder = "styles/horizontal1"
					mainEM.Width = "400"
					mainEM.ShowEvent = MenuShowEvent.Always
					mainEM.Position = MenuPosition.Horizontal
				end if
				
				mainEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("Vitem_" + oReader.GetInt32(0).ToString(), oReader.GetString(2), "", "", "", ""))

				placeHolder2.Controls.Add(mainEM)
			
			else
			
				if childMenus is nothing
					childMenus = new Hashtable()
				end if
				
				' first time the menu is ceated 
				if not childMenus.ContainsKey(parentId)
				
					dim childEM as EasyMenu = new EasyMenu()
					childEM.ID = "VchildEM_" + parentId.ToString()
					childEM.StyleFolder = "styles/horizontal1"
					childEM.ShowEvent = MenuShowEvent.MouseOver
					childEM.AttachTo = "Vitem_" + parentId.ToString()
					childEM.Width = "150"
					
					dim menuLevel as Int32 = oReader.GetInt32(3)
					if menuLevel = 1
						childEM.Align = MenuAlign.Under
					else
						childEM.Align = MenuAlign.Left
					end if
					
					childEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("Vitem_" + oReader.GetInt32(0).ToString(), oReader.GetString(2), "", "", "", ""))
					
					childMenus.Add(parentId, childEM)
					
					placeHolder1.Controls.Add(childEM)
				
				' items are added to the already created menu 
				else
				
					dim childEM as EasyMenu = childMenus(parentId)
					
					childEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("Vitem_" + oReader.GetInt32(0).ToString(), oReader.GetString(2), "", "", "", ""))
				end if
			end if
		end while
	end sub
end class