using System;

public class cs_panelresizable_left : System.Web.UI.Page
{
	protected OboutInc.Splitter2.Splitter spl1;
	
	void Page_Load(object sender, EventArgs e) {
		
		spl1.PanelResizable = OboutInc.Splitter2.VerticalPanelResizableType.left;
		spl1.CookieDays = 0;
		spl1.StyleFolder="styles/default";
		spl1.LeftPanel.WidthMin = 100;
		spl1.LeftPanel.WidthMax = 400;
		spl1.LeftPanel.Header.Height = 50;
		spl1.LeftPanel.Footer.Height = 50;
		spl1.RightPanel.Header.Height = 50;
		spl1.RightPanel.Footer.Height = 50;
	}
}
