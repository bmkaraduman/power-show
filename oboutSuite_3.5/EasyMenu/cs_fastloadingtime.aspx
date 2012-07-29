<%@ Page Language="C#" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
	
	protected EasyMenu mainEM;
	protected EasyMenu em_1;
	protected EasyMenu em_11;
	protected EasyMenu em_12;
	protected EasyMenu em_13;
	protected EasyMenu em_14;
	protected EasyMenu em_143;
	protected EasyMenu em_15;
	protected EasyMenu em_16;
	protected EasyMenu em_2;
	protected EasyMenu em_23;
	protected EasyMenu em_4;
	protected EasyMenu em_5;
	
	private Int32 index;
	private Int32 menuItems = 10;

	void Page_Load(object sender, System.EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			// set the style for this menu
			mainEM.StyleFolder = "styles/horizontal1";
			mainEM.Width = "330";
			// show event is always so the menu is always visible
			// this menu doesn't require any AttachTo or Align properties set
			mainEM.ShowEvent = MenuShowEvent.Always;
			// display the menu horizontally
			mainEM.Position = MenuPosition.Horizontal;

			// add the items for the menu
			for (index=1;index<=5;index++)
			{
				mainEM.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item" + index.ToString(), "Item " + index.ToString(), "", "", "", ""));
			}
			
			// this will attach to the first item of the parent menu (id=item1)
			em_1.AttachTo = "item1";
			em_1.StyleFolder = "styles/horizontal1";
			em_1.Width = "140";
			// it will show on mouse over
			em_1.ShowEvent = MenuShowEvent.MouseOver;
			// and will align under the item to which it is attached
			em_1.Align = MenuAlign.Under;
			// here are this menu's items
			for (index=1;index<=menuItems;index++)
			{
				em_1.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item1" + index.ToString(), "SubItem 1" + index.ToString(), "", "", "", ""));
			}

			em_2.AttachTo = "item2";
			em_2.StyleFolder = "styles/horizontal1";
			em_2.Width = "140";
			em_2.ShowEvent = MenuShowEvent.MouseOver;
			em_2.Align = MenuAlign.Under;
			for (index=1;index<=menuItems;index++)
			{
				em_2.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item2" + index.ToString(), "SubItem 2" + index.ToString(), "", "", "", ""));
			}

			em_4.AttachTo = "item4";
			em_4.StyleFolder = "styles/horizontal1";
			em_4.Width = "140";
			em_4.ShowEvent = MenuShowEvent.MouseOver;
			em_4.Align = MenuAlign.Under;
			for (index=1;index<=menuItems;index++)
			{
				em_4.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item4" + index.ToString(), "SubItem 4" + index.ToString(), "", "", "", ""));
			}
		
			em_5.AttachTo = "item5";
			em_5.StyleFolder = "styles/horizontal1";
			em_5.Width = "140";
			em_5.ShowEvent = MenuShowEvent.MouseOver;
			em_5.Align = MenuAlign.Under;
			for (index=1;index<=menuItems;index++)
			{
				em_5.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item5" + index.ToString(), "SubItem 5" + index.ToString(), "", "", "", ""));
			}

			em_11.AttachTo = "item11";
			em_11.StyleFolder = "styles/horizontal1";
			em_11.Width = "140";
			em_11.ShowEvent = MenuShowEvent.MouseOver;
			em_11.Align = MenuAlign.Right;
			em_11.OffsetVertical = 0;
			em_11.OffsetHorizontal = -4;
			for (index=1;index<=menuItems;index++)
			{
				em_11.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item11" + index.ToString(), "SubItem 11" + index.ToString(), "", "", "", ""));
			}
			
			em_12.AttachTo = "item12";
			em_12.StyleFolder = "styles/horizontal1";
			em_12.Width = "140";
			em_12.ShowEvent = MenuShowEvent.MouseOver;
			em_12.Align = MenuAlign.Right;
			em_12.OffsetVertical = 0;
			em_12.OffsetHorizontal = -4;
			for (index=1;index<=menuItems;index++)
			{
				em_12.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item12" + index.ToString(), "SubItem 12" + index.ToString(), "", "", "", ""));
			}
			
			em_13.AttachTo = "item13";
			em_13.StyleFolder = "styles/horizontal1";
			em_13.Width = "140";
			em_13.ShowEvent = MenuShowEvent.MouseOver;
			em_13.Align = MenuAlign.Right;
			em_13.OffsetVertical = 0;
			em_13.OffsetHorizontal = -4;
			for (index=1;index<=menuItems;index++)
			{
				em_13.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item13" + index.ToString(), "SubItem 13" + index.ToString(), "", "", "", ""));
			}
			
			em_14.AttachTo = "item14";
			em_14.StyleFolder = "styles/horizontal1";
			em_14.Width = "140";
			em_14.ShowEvent = MenuShowEvent.MouseOver;
			em_14.Align = MenuAlign.Right;
			em_14.OffsetVertical = 0;
			em_14.OffsetHorizontal = -4;
			for (index=1;index<=menuItems;index++)
			{
				em_14.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item14" + index.ToString(), "SubItem 14" + index.ToString(), "", "", "", ""));
			}
			
			em_143.AttachTo = "item143";
			em_143.StyleFolder = "styles/horizontal1";
			em_143.Width = "140";
			em_143.ShowEvent = MenuShowEvent.MouseOver;
			em_143.Align = MenuAlign.Right;
			em_143.OffsetVertical = 0;
			em_143.OffsetHorizontal = -4;
			for (index=1;index<=menuItems;index++)
			{
				em_143.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item143" + index.ToString(), "SubItem 143" + index.ToString(), "", "", "", ""));
			}
			
			em_15.AttachTo = "item15";
			em_15.StyleFolder = "styles/horizontal1";
			em_15.Width = "140";
			em_15.ShowEvent = MenuShowEvent.MouseOver;
			em_15.Align = MenuAlign.Right;
			em_15.OffsetVertical = 0;
			em_15.OffsetHorizontal = -4;
			for (index=1;index<=menuItems;index++)
			{
				em_15.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item15" + index.ToString(), "SubItem 15" + index.ToString(), "", "", "", ""));
			}
			
			em_16.AttachTo = "item16";
			em_16.StyleFolder = "styles/horizontal1";
			em_16.Width = "140";
			em_16.ShowEvent = MenuShowEvent.MouseOver;
			em_16.Align = MenuAlign.Right;
			em_16.OffsetVertical = 0;
			em_16.OffsetHorizontal = -4;
			for (index=1;index<=menuItems;index++)
			{
				em_16.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item16" + index.ToString(), "SubItem 16" + index.ToString(), "", "", "", ""));
			}
			
			em_23.AttachTo = "item23";
			em_23.StyleFolder = "styles/horizontal1";
			em_23.Width = "140";
			em_23.ShowEvent = MenuShowEvent.MouseOver;
			em_23.Align = MenuAlign.Right;
			em_23.OffsetVertical = 0;
			em_23.OffsetHorizontal = -4;
			for (index=1;index<=menuItems;index++)
			{
				em_23.AddItem(new OboutInc.EasyMenu_Pro.MenuItem("item23" + index.ToString(), "SubItem 23" + index.ToString(), "", "", "", ""));
			}
		}
	}

	void Page_Init(object sender, EventArgs e)
	{
		// create the Parent EasyMenu
		mainEM = new EasyMenu();
		// set the ID (must be unique)
		mainEM.ID = "MainEM";
		// add the menu to the placeholder on the page
		placeHolder1.Controls.Add(mainEM);
		
		// Create the submenus
		em_1 = new EasyMenu();
		em_1.ID = "Easymenu1";
		
		em_11 = new EasyMenu();
		em_11.ID = "Easymenu11";
		
		em_12 = new EasyMenu();
		em_12.ID = "Easymenu12";
		
		em_13 = new EasyMenu();
		em_13.ID = "Easymenu13";
		
		em_14 = new EasyMenu();
		em_14.ID = "Easymenu14";
		
		em_143 = new EasyMenu();
		em_143.ID = "Easymenu143";
		
		em_15 = new EasyMenu();
		em_15.ID = "Easymenu15";
		
		em_16 = new EasyMenu();
		em_16.ID = "Easymenu16";
		
		em_2 = new EasyMenu();
		em_2.ID = "Easymenu2";
		
		em_23 = new EasyMenu();
		em_23.ID = "Easymenu23";
		
		em_4 = new EasyMenu();
		em_4.ID = "Easymenu4";
		
		em_5 = new EasyMenu();
		em_5.ID = "Easymenu5";
		
		// add the submenus to the page
		placeHolder1.Controls.Add(em_1);
		placeHolder1.Controls.Add(em_11);
		placeHolder1.Controls.Add(em_12);
		placeHolder1.Controls.Add(em_13);
		placeHolder1.Controls.Add(em_14);
		placeHolder1.Controls.Add(em_143);
		placeHolder1.Controls.Add(em_15);
		placeHolder1.Controls.Add(em_16);
		placeHolder1.Controls.Add(em_2);
		placeHolder1.Controls.Add(em_23);
		placeHolder1.Controls.Add(em_4);
		placeHolder1.Controls.Add(em_5);
	}	
	
</script>
<html>
	<head>
	<title>obout ASP.NET Easy Menu examples</title>
	<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
    </style>
	</head>
	<body>
	<form id="Form1" runat="server">
	<table width="100%">
		<tr>
			<td class="tdText" valign="top">
				<span class="tdText"><b>ASP.NET Easy Menu - Fast Loading Time</b></span>
				<br />
				<br /><br />
				<span class="tdText">
					The menu has <b>125 items</b>. The loading time is verry small.<br />
					Download the example with source code and check it in your environment.
			    </span><br /><br />
					<asp:PlaceHolder ID="placeHolder1" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		</table>
	     <br /><br /><br /><br />
	    
		<a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=CSHARP">« Back to examples</a>
		
	</form>
	</body>
</html>