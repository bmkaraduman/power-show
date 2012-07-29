imports System
imports System.Data
imports System.Web.UI.WebControls
imports OboutInc.EasyMenu_Pro

public class vb_easymenu_inside_datagridcolumn 
	inherits System.Web.UI.Page

	protected dgProducts as DataGrid
	
	sub Page_load(byval sender as object, byval e as EventArgs)
	
		if not IsPostBack
		
			dim dsProducts as DataSet = new DataSet()
			dsProducts.Tables.Add()
			dsProducts.Tables(0).Columns.Add("ProductId")
			dsProducts.Tables(0).Columns.Add("ProductName")
			dsProducts.Tables(0).Rows.Add(new object() { 1, "TV Set"})
			dsProducts.Tables(0).Rows.Add(new object() { 2, "DVD"})
	
			dgProducts.DataSource = dsProducts
			dgProducts.DataBind()
		end if
	end sub
	
	protected sub dgProducts_ItemCreated(byval sender as object, byval e as DataGridItemEventArgs)
    
        if e.Item.ItemType <> ListItemType.Header and e.Item.ItemType <> ListItemType.Footer
        
            dim PlaceHolder1 as PlaceHolder = CType(e.Item.FindControl("PlaceHolder1"), PlaceHolder)

            dim EasyMenu1 as EasyMenu = new EasyMenu()
            EasyMenu1.ID = "EasyMenu1_" + e.Item.ItemIndex.ToString()
            EasyMenu1.ShowEvent = MenuShowEvent.Always
            EasyMenu1.Position = MenuPosition.Horizontal
			EasyMenu1.StyleFolder = "styles/horizontal1"
            EasyMenu1.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu1.ID + "_item1", "Buy for...", "", "", "", ""))
			EasyMenu1.AddItem(new OboutInc.EasyMenu_Pro.MenuSeparator(EasyMenu1.ID + "_separator1", "|"))
            EasyMenu1.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu1.ID + "_item2", "Rent for...", "", "", "", ""))
			EasyMenu1.Width="100%"
			
			dim EasyMenu2 as EasyMenu = new EasyMenu()
			EasyMenu2.ID = "EasyMenu2_" + e.Item.ItemIndex.ToString()
			EasyMenu2.ShowEvent = MenuShowEvent.MouseOver
			EasyMenu2.Position = MenuPosition.Vertical
			EasyMenu2.StyleFolder = "styles/horizontal1"
			EasyMenu2.AttachTo = EasyMenu1.ID + "_item1"
			EasyMenu2.Align = MenuAlign.Right
			select case e.Item.ItemIndex
			
				case 0:
					EasyMenu2.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu2.ID + "_item1", "49.99$ for a piece", "", "", "", ""))
					EasyMenu2.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu2.ID + "_item2", "89.99$ for two pieces", "", "", "", ""))
				
				case 1:
					EasyMenu2.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu2.ID + "_item1", "29.99$ for a piece", "", "", "", ""))
					EasyMenu2.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu2.ID + "_item2", "54.99$ for two pieces", "", "", "", ""))
					EasyMenu2.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu2.ID + "_item3", "99.99$ for four pieces", "", "", "", ""))
				
			end select
			
			dim EasyMenu3 as EasyMenu = new EasyMenu()
			EasyMenu3.ID = "EasyMenu3_" + e.Item.ItemIndex.ToString()
			EasyMenu3.ShowEvent = MenuShowEvent.MouseOver
			EasyMenu3.Position = MenuPosition.Vertical
			EasyMenu3.StyleFolder = "styles/horizontal1"
			EasyMenu3.AttachTo = EasyMenu1.ID + "_item2"
			EasyMenu3.Align = MenuAlign.Right
			select case e.Item.ItemIndex
			
				case 0:
					EasyMenu3.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu3.ID + "_item1", "2.99$ for a day", "", "", "", ""))
					EasyMenu3.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu3.ID + "_item2", "4.99$ for two days", "", "", "", ""))
					EasyMenu3.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu3.ID + "_item3", "9.99$ for a week", "", "", "", ""))
				
				case 1:
					EasyMenu3.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu3.ID + "_item1", "Not Available", "", "", "", ""))
					
			end select

            PlaceHolder1.Controls.Add(EasyMenu1)
			PlaceHolder1.Controls.Add(EasyMenu2)
			PlaceHolder1.Controls.Add(EasyMenu3)
        end if
    end sub
end class