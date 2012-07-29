using System;

public class cs_synchronizescroll : System.Web.UI.Page
{
	protected OboutInc.Splitter2.Splitter spl1;
	
	void Page_Load(object sender, EventArgs e) {
		
		spl1.SynchronizeScroll = true;
		spl1.CookieDays = 0;
		spl1.StyleFolder="styles/default";
		spl1.LeftPanel.WidthDefault = 343;
		spl1.LeftPanel.WidthMin = 100;
		spl1.LeftPanel.Header.Height = 40;
		spl1.RightPanel.WidthMin = 100;
		spl1.RightPanel.Header.Height = 40;
	}
}
