using System;

public class cs_default : System.Web.UI.Page
{
	protected OboutInc.Splitter2.Splitter sp1DVF;
	
	void Page_Load(object sender, EventArgs e) {
		sp1DVF.CookieDays = 0;
		sp1DVF.StyleFolder = "styles/default";
		sp1DVF.LeftPanel.WidthMin = 100;
		sp1DVF.LeftPanel.WidthMax = 400;
		sp1DVF.LeftPanel.Header.Height = 50;
		sp1DVF.LeftPanel.Footer.Height = 50;
		sp1DVF.RightPanel.Header.Height = 50;
		sp1DVF.RightPanel.Footer.Height = 50;
	}
}