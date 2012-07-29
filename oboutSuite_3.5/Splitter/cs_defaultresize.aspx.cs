using System;

public class cs_defaultresize : System.Web.UI.Page
{
	protected OboutInc.Splitter2.Splitter splDV;
	
	void Page_Load(object sender, EventArgs e) {
		splDV.CookieDays = 0;
		splDV.StyleFolder = "styles/default";
		splDV.LeftPanel.WidthMin = 100;
		splDV.LeftPanel.WidthMax = 400;
		splDV.LeftPanel.Header.Height = 50;
		splDV.LeftPanel.Footer.Height = 50;
		splDV.RightPanel.Header.Height = 70;
		splDV.RightPanel.Footer.Height = 50;
	}
}