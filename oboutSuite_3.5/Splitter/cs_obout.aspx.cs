using System;

public class cs_obout : System.Web.UI.Page
{
	protected OboutInc.Splitter2.Splitter sp1;
	
	void Page_Load(object sender, EventArgs e) {
		sp1.CookieDays = 0;
		sp1.StyleFolder = "styles/obout";
		sp1.LeftPanel.WidthMin = 100;
		sp1.LeftPanel.WidthMax = 400;
		sp1.LeftPanel.Header.Height = 50;
		sp1.LeftPanel.Footer.Height = 50;
		sp1.RightPanel.Header.Height = 50;
		sp1.RightPanel.Footer.Height = 50;
	}
}