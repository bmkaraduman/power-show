imports System

public class mcenter 
	inherits System.Web.UI.Page

	protected sp1 as OboutInc.Splitter2.Splitter
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		sp1.CookieDays = 0
		sp1.StyleFolder = "styles/xp_mcenter"
		sp1.LeftPanel.WidthMin = 100
		sp1.LeftPanel.WidthMax = 400
		sp1.LeftPanel.Header.Height = 50
		sp1.LeftPanel.Footer.Height = 50
		sp1.RightPanel.Header.Height = 50
		sp1.RightPanel.Footer.Height = 50
	End Sub
End Class