using System;
using OboutInc.TextMenu;

public class ex_Vertical : System.Web.UI.Page
{
	private void Page_Load(object sender, System.EventArgs e)
	{
		TextMenu tm1 = new TextMenu();
		tm1.Vertical = true;
		tm1.ID = "tm1";

		tm1.Add(null, "brands", "Brands", "javascript:alert('you clicked me');void(0);", null);
			tm1.Add("brands", "ibm", "IBM");
			tm1.Add("brands", "microsoft", "MICROSOFT");
			tm1.Add("brands", "obout", "OBOUT", "http://www.obout.com/", "_top");
				tm1.Add("obout", "treeview", "TreeView", "http://www.obout.com/t2/edraganddrop.aspx", "_top");
				tm1.Add("obout", "slidemenu", "Slide Menu", "http://www.obout.com/sm3/whatisnew.aspx", "_top");
				tm1.Add("obout", "calendar", "Calendar", "http://www.obout.com/calendar/", "_top");
				tm1.Add("obout", "postback", "AJAXPage", "http://www.obout.com/AJAXPage/", "_top");
				tm1.Add("obout", "splitter", "Splitter", "http://www.obout.com/splitter/", "_top");
				tm1.Add("obout", "easymenu", "EasyMenu", "http://www.obout.com/em/", "_top");
				tm1.Add("obout", "combobox", "Combobox", "http://www.obout.com/combobox/", "_top");
				tm1.Add("obout", "editor", "HTML Editor", "http://www.obout.com/editor_new/", "_top");
				tm1.Add("obout", "superbutton", "Super Button", "http://www.obout.com/osb/", "_top");
				tm1.Add("obout", "treedb", "Tree_DB", "http://www.obout.com/t_db/index.aspx", "_top");
				tm1.Add("obout", "textmenu", "TextMenu", "http://www.obout.com/tm/tm.aspx", "_top");
		tm1.Add(null, "systems", "Systems");
			tm1.Add("systems", "desktops", "Desktops");
			tm1.Add("systems", "handhelds", "Handhelds");
			tm1.Add("systems", "notebooks", "Notebooks");
			tm1.Add("systems", "servers", "Servers");
		tm1.Add(null, "hardware", "Hardware");
			tm1.Add("hardware", "accessories", "Accessories");
			tm1.Add("hardware", "keyboards", "Keyboards");
			tm1.Add("hardware", "memory", "Memory");
			tm1.Add("hardware", "printers", "Printers");
			tm1.Add("hardware", "videocards", "Video Cards");
		tm1.Add(null, "software", "Software");
			tm1.Add("software", "applications", "Applications");
			tm1.Add("software", "licensing", "Licensing");

		this.Controls.Add(tm1);
	}
}