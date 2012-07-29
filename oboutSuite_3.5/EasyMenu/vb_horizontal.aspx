<%@ Page Language="VB" %>
<%@ Import Namespace="OboutInc.EasyMenu_Pro"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="VB" runat="server">
	
	protected mainEM as EasyMenu
	protected em_1 as EasyMenu
	protected em_2 as EasyMenu
	protected em_4 as EasyMenu
	protected em_5 as EasyMenu
	protected em_6 as EasyMenu
	
	private Sub Page_Load(ByVal sender as object, ByVal e as System.EventArgs) Handles MyBase.Load
	
		if not Page.IsPostBack
		
			' set the style for this menu
			mainEM.StyleFolder = "styles/horizontal1"
			mainEM.Width = "330"
			' show event is always so the menu is always visible
			' this menu doesn't require any AttachTo or Align properties set
			mainEM.ShowEvent = MenuShowEvent.Always
			' display the menu horizontally
			mainEM.Position = MenuPosition.Horizontal

			' the parent menu looks different so we need to set different
			' CSS classes names for its items and the menu itself
			
			' css classes names for the menu and the item container
			mainEM.CSSMenu = "ParentMenu"
			mainEM.CSSMenuItemContainer = "ParentItemContainer"
			
			' css classes names for MenuItems
			Dim MenuItemCssClasses as CSSClasses = mainEM.CSSClassesCollection(mainEM.CSSClassesCollection.Add(new CSSClasses(GetType(OboutInc.EasyMenu_Pro.MenuItem))))
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
			Dim MenuSeparatorCssClasses as CSSClasses = mainEM.CSSClassesCollection(mainEM.CSSClassesCollection.Add(new CSSClasses(GetType(MenuSeparator))))
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

			' add the items for the menu
			mainEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item1", "Item 1", "", "", "", ""))
			mainEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item2", "Item 2", "", "", "", ""))
			mainEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item3", "Item 3", "", "", "", ""))
			mainEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item4", "Item 4", "", "", "", ""))
			mainEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item5", "Item 5", "", "", "", ""))

			' this will attach to the first item of the parent menu (id=item1)
			em_1.AttachTo = "item1"
			em_1.StyleFolder = "styles/horizontal1"
			em_1.Width = "140"
			' it will show on mouse over
			em_1.ShowEvent = MenuShowEvent.MouseOver
			' and will align under the item to which it is attached
			em_1.Align = MenuAlign.Under
			' here are this menu's items
			em_1.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem1", "SubItem 1", "", "", "", "alert('Item 1 - SubItem 1')"))
			em_1.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem2", "SubItem 2", "", "", "", "alert('Item 1 - SubItem 2')"))
			em_1.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem3", "SubItem 3", "", "", "", "alert('Item 1 - SubItem 3')"))
			em_1.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem4", "SubItem 4", "", "", "", "alert('Item 1 - SubItem 4')"))
			em_1.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem5", "SubItem 5", "", "", "", "alert('Item 1 - SubItem 5')"))

			em_2.AttachTo = "item2"
			em_2.StyleFolder = "styles/horizontal1"
			em_2.Width = "140"
			em_2.ShowEvent = MenuShowEvent.MouseOver
			em_2.Align = MenuAlign.Under
			em_2.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem6", "SubItem 1", "", "", "", "alert('Item 2 - SubItem 1')"))
			em_2.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem7", "SubItem 2", "", "", "", "alert('Item 2 - SubItem 2')"))
			em_2.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem8", "SubItem 3", "", "", "", "alert('Item 2 - SubItem 3')"))

			em_4.AttachTo = "item4"
			em_4.StyleFolder = "styles/horizontal1"
			em_4.Width = "140"
			em_4.ShowEvent = MenuShowEvent.MouseOver
			em_4.Align = MenuAlign.Under
			em_4.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem9", "SubItem 1", "", "", "", "alert('Item 4 - SubItem 1')"))
			em_4.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem10", "SubItem 2", "", "", "", "alert('Item 4 - SubItem 2')"))

			em_5.AttachTo = "item5"
			em_5.StyleFolder = "styles/horizontal1"
			em_5.Width = "140"
			em_5.ShowEvent = MenuShowEvent.MouseOver
			em_5.Align = MenuAlign.Under
			em_5.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem11", "SubItem 1", "", "", "", "alert('Item 5 - SubItem 1')"))
			em_5.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem12", "SubItem 2", "", "", "", "alert('Item 5 - SubItem 2')"))
			em_5.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem13", "SubItem 3", "", "", "", "alert('Item 5 - SubItem 3')"))
			em_5.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem14", "SubItem 4", "", "", "", "alert('Item 5 - SubItem 4')"))
			em_5.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem15", "SubItem 5", "", "", "", "alert('Item 5 - SubItem 5')"))

			em_6.AttachTo = "menuItem3"
			em_6.StyleFolder = "styles/horizontal1"
			em_6.Width = "140"
			em_6.ShowEvent = MenuShowEvent.MouseOver
			em_6.Align = MenuAlign.Right
			em_6.OffsetVertical = 0
			em_6.OffsetHorizontal = -4
			em_6.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem31", "SubItem 1", "", "", "", "alert('Item 1 - SubItem 3 - SubItem 1')"))
			em_6.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem32", "SubItem 2", "", "", "", "alert('Item 1 - SubItem 3 - SubItem 2')"))
			em_6.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("menuItem33", "SubItem 3", "", "", "", "alert('Item 1 - SubItem 3 - SubItem 3')"))
			
		End If
		
	End Sub

	private Sub Page_Init(ByVal sender as object, ByVal e as System.EventArgs) Handles MyBase.Init
	
		' create the Parent EasyMenu
		mainEM = new EasyMenu()
		' set the ID (must be unique)
		mainEM.ID = "MainEM"

		' Create the submenus
		em_1 = new EasyMenu()
		em_1.ID = "Easymenu1"
		em_2 = new EasyMenu()
		em_2.ID = "Easymenu2"
		em_4 = new EasyMenu()
		em_4.ID = "Easymenu4"
		em_5 = new EasyMenu()
		em_5.ID = "Easymenu5"
		em_6 = new EasyMenu()
		em_6.ID = "Easymenu6"

		' add the submenus to the page
		Me.Controls.Add(em_1)
		Me.Controls.Add(em_2)
		Me.Controls.Add(em_4)
		Me.Controls.Add(em_5)
		Me.Controls.Add(em_6)
		
		' add the menu to the placeholder on the page
		placeHolder1.Controls.Add(mainEM)
		
	End Sub
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
		            margin: 20px;
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
	        <span class="tdText"><b>ASP.NET Easy Menu - Horizontal 1 skin</b></span>
		    <br /><br />	
			<br /><br /> 
		    
		    <asp:PlaceHolder ID="placeHolder1" runat="server"></asp:PlaceHolder>
		    
		    <br /><br /><br /><br />
	    
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VB">« Back to examples</a>
		    
		</form>
	</body>
</html>