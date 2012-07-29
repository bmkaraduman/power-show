using System;
using OboutInc.EasyMenu_Pro;

	public class cs_multiple_menus : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.PlaceHolder placeHolder1;
		protected System.Web.UI.WebControls.PlaceHolder placeHolder2;
		protected EasyMenu EasymenuMain1;
		protected EasyMenu EasymenuMain2;
		protected EasyMenu Easymenu11;
		protected EasyMenu Easymenu12;
		protected EasyMenu Easymenu13;
		protected EasyMenu Easymenu14;
		protected EasyMenu Easymenu21;
		protected EasyMenu Easymenu22;
		protected EasyMenu Easymenu23;
		protected EasyMenu Easymenu24;

		private void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				// EasymenuMain1
                EasymenuMain1.StyleFolder = "styles/style1_multiple_menus";
				EasymenuMain1.Width = "330";
				EasymenuMain1.ShowEvent = MenuShowEvent.Always;
				EasymenuMain1.Position = MenuPosition.Horizontal;
				
				EasymenuMain1.AddItem(new MenuItem("item11", "Item 1", "", "", "", ""));
				EasymenuMain1.AddItem(new MenuItem("item12", "Item 2", "", "", "", ""));
				EasymenuMain1.AddItem(new MenuItem("item13", "Item 3", "", "", "", ""));
				EasymenuMain1.AddItem(new MenuItem("item14", "Item 4", "", "", "", ""));
				
				// EasymenuMain2
				EasymenuMain2.StyleFolder = "styles/style2_multiple_menus";
				EasymenuMain2.Width = "330";
				EasymenuMain2.ShowEvent = MenuShowEvent.Always;
				EasymenuMain2.Position = MenuPosition.Horizontal;
				EasymenuMain2.CSSMenu = "easyMenu2";
				EasymenuMain2.CSSMenuItemContainer = "easyMenuItemContainer2";
				
				CSSClasses MenuItemCssClasses = EasymenuMain2.CSSClassesCollection[EasymenuMain2.CSSClassesCollection.Add(new CSSClasses(typeof(MenuItem)))];
				MenuItemCssClasses.ComponentSubMenuCellOver="easyMenuItemSubMenuCellOver2";
				MenuItemCssClasses.ComponentContentCell="easyMenuItemContentCell2";
				MenuItemCssClasses.Component="easyMenuItem2";
				MenuItemCssClasses.ComponentSubMenuCell="easyMenuItemSubMenuCell2";
				MenuItemCssClasses.ComponentIconCellOver="easyMenuItemIconCellOver2";
				MenuItemCssClasses.ComponentIconCell="easyMenuItemIconCell2";
				MenuItemCssClasses.ComponentOver="easyMenuItemOver2";
				MenuItemCssClasses.ComponentContentCellOver="easyMenuItemContentCellOver2";
				EasymenuMain2.CSSClassesCollection.Add(MenuItemCssClasses);
				
				CSSClasses MenuSeparatorCssClasses = EasymenuMain2.CSSClassesCollection[EasymenuMain2.CSSClassesCollection.Add(new CSSClasses(typeof(MenuSeparator)))];
				MenuSeparatorCssClasses.ComponentSubMenuCellOver="easyMenuSeparatorSubMenuCellOver2";
				MenuSeparatorCssClasses.ComponentContentCell="easyMenuSeparatorContentCell2";
				MenuSeparatorCssClasses.Component="easyMenuSeparator2";
				MenuSeparatorCssClasses.ComponentSubMenuCell="easyMenuSeparatorSubMenuCell2";
				MenuSeparatorCssClasses.ComponentIconCellOver="easyMenuSeparatorIconCellOver2";
				MenuSeparatorCssClasses.ComponentIconCell="easyMenuSeparatorIconCell2";
				MenuSeparatorCssClasses.ComponentOver="easyMenuSeparatorOver2";
				MenuSeparatorCssClasses.ComponentContentCellOver="easyMenuSeparatorContentCellOver2";
				EasymenuMain2.CSSClassesCollection.Add(MenuSeparatorCssClasses);

				EasymenuMain2.AddItem(new MenuItem("item21", "Item 1", "", "", "", ""));
				EasymenuMain2.AddItem(new MenuItem("item22", "Item 2", "", "", "", ""));
				EasymenuMain2.AddItem(new MenuItem("item23", "Item 3", "", "", "", ""));
				EasymenuMain2.AddItem(new MenuItem("item24", "Item 4", "", "", "", ""));

				// Easymenu11
				Easymenu11.AttachTo = "item11";
                Easymenu11.StyleFolder = "styles/style1_multiple_menus";
				Easymenu11.Width = "140";
				Easymenu11.ShowEvent = MenuShowEvent.MouseOver;
				Easymenu11.Align = MenuAlign.Under;
				Easymenu11.AddItem(new MenuItem("menuItem111", "Item11", "", "", "", ""));
				Easymenu11.AddItem(new MenuItem("menuItem112", "Item12", "", "", "", ""));
				Easymenu11.AddItem(new MenuItem("menuItem113", "Item13", "", "", "", ""));
				
				// Easymenu12
				Easymenu12.AttachTo = "item12";
                Easymenu12.StyleFolder = "styles/style1_multiple_menus";
				Easymenu12.Width = "140";
				Easymenu12.ShowEvent = MenuShowEvent.MouseOver;
				Easymenu12.Align = MenuAlign.Under;
				Easymenu12.AddItem(new MenuItem("menuItem121", "Item21", "", "", "", ""));
				Easymenu12.AddItem(new MenuItem("menuItem122", "Item22", "", "", "", ""));
				
				// Easymenu13
				Easymenu13.AttachTo = "item13";
                Easymenu13.StyleFolder = "styles/style1_multiple_menus";
				Easymenu13.Width = "140";
				Easymenu13.ShowEvent = MenuShowEvent.MouseOver;
				Easymenu13.Align = MenuAlign.Under;
				Easymenu13.AddItem(new MenuItem("menuItem131", "Item31", "", "", "", ""));
				Easymenu13.AddItem(new MenuItem("menuItem132", "Item32", "", "", "", ""));
				Easymenu13.AddItem(new MenuItem("menuItem133", "Item33", "", "", "", ""));
				Easymenu13.AddItem(new MenuItem("menuItem134", "Item34", "", "", "", ""));
				Easymenu13.AddItem(new MenuItem("menuItem135", "Item35", "", "", "", ""));
				Easymenu13.AddItem(new MenuItem("menuItem136", "Item36", "", "", "", ""));
				
				// Easymenu14
				Easymenu14.AttachTo = "item14";
                Easymenu14.StyleFolder = "styles/style1_multiple_menus";
				Easymenu14.Width = "140";
				Easymenu14.ShowEvent = MenuShowEvent.MouseOver;
				Easymenu14.Align = MenuAlign.Under;
				Easymenu14.AddItem(new MenuItem("menuItem141", "Item41", "", "", "", ""));
				Easymenu14.AddItem(new MenuItem("menuItem142", "Item42", "", "", "", ""));
				Easymenu14.AddItem(new MenuItem("menuItem143", "Item43", "", "", "", ""));
				
				// Easymenu21
				Easymenu21.AttachTo = "item21";
                Easymenu21.StyleFolder = "styles/style1_multiple_menus";
				Easymenu21.Width = "140";
				Easymenu21.ShowEvent = MenuShowEvent.MouseOver;
				Easymenu21.Align = MenuAlign.Under;
				Easymenu21.AddItem(new MenuItem("menuItem211", "Item11", "", "", "", ""));
				Easymenu21.AddItem(new MenuItem("menuItem212", "Item12", "", "", "", ""));
				Easymenu21.AddItem(new MenuItem("menuItem213", "Item13", "", "", "", ""));
				
				// Easymenu22
				Easymenu22.AttachTo = "item22";
                Easymenu22.StyleFolder = "styles/style1_multiple_menus";
				Easymenu22.Width = "140";
				Easymenu22.ShowEvent = MenuShowEvent.MouseOver;
				Easymenu22.Align = MenuAlign.Under;
				Easymenu22.AddItem(new MenuItem("menuItem221", "Item21", "", "", "", ""));
				
				// Easymenu23
				Easymenu23.AttachTo = "item23";
                Easymenu23.StyleFolder = "styles/style1_multiple_menus";
				Easymenu23.Width = "140";
				Easymenu23.ShowEvent = MenuShowEvent.MouseOver;
				Easymenu23.Align = MenuAlign.Under;
				Easymenu23.AddItem(new MenuItem("menuItem231", "Item31", "", "", "", ""));
				Easymenu23.AddItem(new MenuItem("menuItem232", "Item32", "", "", "", ""));
				Easymenu23.AddItem(new MenuItem("menuItem233", "Item33", "", "", "", ""));
				Easymenu23.AddItem(new MenuItem("menuItem234", "Item34", "", "", "", ""));
				
				// Easymenu24
				Easymenu24.AttachTo = "item24";
                Easymenu24.StyleFolder = "styles/style1_multiple_menus";
				Easymenu24.Width = "140";
				Easymenu24.ShowEvent = MenuShowEvent.MouseOver;
				Easymenu24.Align = MenuAlign.Under;
				Easymenu24.AddItem(new MenuItem("menuItem241", "Item41", "", "", "", ""));
				Easymenu24.AddItem(new MenuItem("menuItem242", "Item42", "", "", "", ""));
				Easymenu24.AddItem(new MenuItem("menuItem243", "Item43", "", "", "", ""));

			}
		}
		
		void Page_Init(object sender, EventArgs e) 
		{
			// EasymenuMain1
			EasymenuMain1 = new EasyMenu();
			EasymenuMain1.ID = "EasymenuMain1";
			placeHolder1.Controls.Add(EasymenuMain1);
			
			// EasymenuMain2
			EasymenuMain2 = new EasyMenu();
			EasymenuMain2.ID = "EasymenuMain2";
			placeHolder2.Controls.Add(EasymenuMain2);
			
			// Easymenu11
			Easymenu11 = new EasyMenu();
			Easymenu11.ID = "Easymenu11";
			placeHolder1.Controls.Add(Easymenu11);
			
			// Easymenu12
			Easymenu12 = new EasyMenu();
			Easymenu12.ID = "Easymenu12";
			placeHolder1.Controls.Add(Easymenu12);
			
			// Easymenu13
			Easymenu13 = new EasyMenu();
			Easymenu13.ID = "Easymenu13";
			placeHolder1.Controls.Add(Easymenu13);
			
			// Easymenu14
			Easymenu14 = new EasyMenu();
			Easymenu14.ID = "Easymenu14";
			placeHolder1.Controls.Add(Easymenu14);
			
			// Easymenu21
			Easymenu21 = new EasyMenu();
			Easymenu21.ID = "Easymenu21";
			placeHolder2.Controls.Add(Easymenu21);
			
			// Easymenu22
			Easymenu22 = new EasyMenu();
			Easymenu22.ID = "Easymenu22";
			placeHolder2.Controls.Add(Easymenu22);
			
			// Easymenu23
			Easymenu23 = new EasyMenu();
			Easymenu23.ID = "Easymenu23";
			placeHolder2.Controls.Add(Easymenu23);
			
			// Easymenu24
			Easymenu24 = new EasyMenu();
			Easymenu24.ID = "Easymenu24";
			placeHolder2.Controls.Add(Easymenu24);
		}

	}