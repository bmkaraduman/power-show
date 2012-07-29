using System;
using System.Data;
using System.Web.UI.WebControls;
using OboutInc.EasyMenu_Pro;

public class cs_easymenu_inside_datagridcolumn : System.Web.UI.Page
{
	protected DataGrid dgProducts;
	
	void Page_load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			DataSet dsProducts = new DataSet();
			dsProducts.Tables.Add();
			dsProducts.Tables[0].Columns.Add("ProductId");
			dsProducts.Tables[0].Columns.Add("ProductName");
			dsProducts.Tables[0].Rows.Add(new object[] { 1, "TV Set"});
			dsProducts.Tables[0].Rows.Add(new object[] { 2, "DVD"});
	
			dgProducts.DataSource = dsProducts;
			dgProducts.DataBind();
		}
	}
	
	protected void dgProducts_ItemCreated(object sender, DataGridItemEventArgs e)
    {
        if (e.Item.ItemType != ListItemType.Header && e.Item.ItemType != ListItemType.Footer)
        {
            PlaceHolder PlaceHolder1 = (PlaceHolder)e.Item.FindControl("PlaceHolder1");

            EasyMenu EasyMenu1 = new EasyMenu();
            EasyMenu1.ID = "EasyMenu1_" + e.Item.ItemIndex.ToString();
            EasyMenu1.ShowEvent = MenuShowEvent.Always;
            EasyMenu1.Position = MenuPosition.Horizontal;
			EasyMenu1.StyleFolder = "styles/horizontal1";
            EasyMenu1.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu1.ID + "_item1", "Buy for...", "", "", "", ""));
			EasyMenu1.AddItem(new OboutInc.EasyMenu_Pro.MenuSeparator(EasyMenu1.ID + "_separator1", "|"));
            EasyMenu1.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu1.ID + "_item2", "Rent for...", "", "", "", ""));
			EasyMenu1.Width = "100%";
			
			EasyMenu EasyMenu2 = new EasyMenu();
			EasyMenu2.ID = "EasyMenu2_" + e.Item.ItemIndex.ToString();
			EasyMenu2.ShowEvent = MenuShowEvent.MouseOver;
			EasyMenu2.Position = MenuPosition.Vertical;
			EasyMenu2.StyleFolder = "styles/horizontal1";
			EasyMenu2.AttachTo = EasyMenu1.ID + "_item1";
			EasyMenu2.Align = MenuAlign.Right;
			switch(e.Item.ItemIndex)
			{
				case 0:
					EasyMenu2.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu2.ID + "_item1", "49.99$ for a piece", "", "", "", ""));
					EasyMenu2.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu2.ID + "_item2", "89.99$ for two pieces", "", "", "", ""));
				break;
				case 1:
					EasyMenu2.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu2.ID + "_item1", "29.99$ for a piece", "", "", "", ""));
					EasyMenu2.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu2.ID + "_item2", "54.99$ for two pieces", "", "", "", ""));
					EasyMenu2.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu2.ID + "_item3", "99.99$ for four pieces", "", "", "", ""));
				break;
			}
			
			EasyMenu EasyMenu3 = new EasyMenu();
			EasyMenu3.ID = "EasyMenu3_" + e.Item.ItemIndex.ToString();
			EasyMenu3.ShowEvent = MenuShowEvent.MouseOver;
			EasyMenu3.Position = MenuPosition.Vertical;
			EasyMenu3.StyleFolder = "styles/horizontal1";
			EasyMenu3.AttachTo = EasyMenu1.ID + "_item2";
			EasyMenu3.Align = MenuAlign.Right;
			switch(e.Item.ItemIndex)
			{
				case 0:
					EasyMenu3.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu3.ID + "_item1", "2.99$ for a day", "", "", "", ""));
					EasyMenu3.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu3.ID + "_item2", "4.99$ for two days", "", "", "", ""));
					EasyMenu3.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu3.ID + "_item3", "9.99$ for a week", "", "", "", ""));
				break;
				case 1:
					EasyMenu3.AddItem(new OboutInc.EasyMenu_Pro.MenuItem(EasyMenu3.ID + "_item1", "Not Available", "", "", "", ""));
					break;
			}

            PlaceHolder1.Controls.Add(EasyMenu1);
			PlaceHolder1.Controls.Add(EasyMenu2);
			PlaceHolder1.Controls.Add(EasyMenu3);
        }
    }
}