imports System

public class collapseexpandpanel 
	inherits System.Web.UI.Page

	protected splDV as OboutInc.Splitter2.Splitter
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		splDV.CookieDays = 0
		splDV.CollapsePanel=OboutInc.Splitter2.VerticalCollapsePanelType.left
		splDV.StyleFolder="styles/default"
		splDV.LeftPanel.WidthMin = 100
		splDV.LeftPanel.WidthMax = 400
	end sub
end class
