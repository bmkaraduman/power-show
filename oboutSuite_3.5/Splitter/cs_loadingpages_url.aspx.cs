using System;

public class cs_loadingpages_url : System.Web.UI.Page
{
	protected OboutInc.Splitter2.Splitter splDV;
	
	void Page_Load(object sender, EventArgs e) {
	
		// build splitter
		splDV.CookieDays = 0;
		splDV.StyleFolder="styles/default";
		
		splDV.LeftPanel.Content.Url="HTMFiles/1.html"; 
		splDV.RightPanel.Content.Url="HTMFiles/2_1.html";
		
		splDV.LeftPanel.WidthDefault = 240;
		splDV.LeftPanel.WidthMin = 100;
		splDV.LeftPanel.WidthMax = 400;
		splDV.LeftPanel.Header.Height = 50;
		splDV.LeftPanel.Footer.Height = 50;
		splDV.RightPanel.Header.Height = 50;
		splDV.RightPanel.Footer.Height = 50;
	}

}