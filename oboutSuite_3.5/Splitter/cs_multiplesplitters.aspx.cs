using System;

public class cs_multiplesplitters : System.Web.UI.Page
{
	protected OboutInc.Splitter2.Splitter spl1;
	protected OboutInc.Splitter2.HorizontalSplitter spl2;
	
	void Page_Load(object sender, EventArgs e) {
		
		spl1.CookieDays = 0;
		spl1.StyleFolder="styles/default";
		spl1.LeftPanel.WidthDefault = 180;
		spl1.LeftPanel.WidthMin = 100;
		spl1.LeftPanel.WidthMax = 400;
		
		spl2.CookieDays = 0;
		spl2.CSSPath="styles/ExtraStyle/style.css"; 
		spl2.CSSPanel="ob_spl_panel_1";
		spl2.CSSDivider="ob_spl_dividerhorizontal_1";
		spl2.CSSResizeBar="ob_spl_resizebarhorizontal_1"; 
		spl2.CSSTopPanel="ob_spl_toppanel_1";
		spl2.CSSTopPanelHeader="ob_spl_toppanelheader_1";
		spl2.CSSTopPanelContent="ob_spl_toppanelcontent_1"; 
		spl2.CSSTopPanelFooter="ob_spl_toppanelfooter_1";
		spl2.CSSBottomPanel="ob_spl_bottompanel_1"; 
		spl2.CSSBottomPanelHeader="ob_spl_bottompanelheader_1";
		spl2.CSSBottomPanelContent="ob_spl_bottompanelcontent_1";
		spl2.CSSBottomPanelFooter="ob_spl_bottompanelfooter_1";
		spl2.CSSCollapseTop="ob_spl_collapsetop_1";
		spl2.CSSCollapseBottom="ob_spl_collapsebottom_1";
		
		spl2.TopPanel.HeightDefault = 100;
		spl2.TopPanel.HeightMin = 50;
		spl2.TopPanel.HeightMax = 200;
	}
}
