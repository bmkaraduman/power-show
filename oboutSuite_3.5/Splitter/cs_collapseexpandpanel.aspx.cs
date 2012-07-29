using System;

public class cs_collapseexpandpanel : System.Web.UI.Page
{
	protected OboutInc.Splitter2.Splitter splDV;
	
	void Page_Load(object sender, EventArgs e) {
		splDV.CookieDays = 0;
		splDV.CollapsePanel=OboutInc.Splitter2.VerticalCollapsePanelType.left;
		splDV.StyleFolder="styles/default";
		splDV.LeftPanel.WidthMin = 100;
		splDV.LeftPanel.WidthMax = 400;
	}
}
