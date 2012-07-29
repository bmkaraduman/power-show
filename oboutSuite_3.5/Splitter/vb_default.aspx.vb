imports System

public class _default 
	inherits System.Web.UI.Page

	protected sp1DVF as OboutInc.Splitter2.Splitter
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		sp1DVF.CookieDays = 0
		sp1DVF.StyleFolder = "styles/default"
		sp1DVF.LeftPanel.WidthMin = 100
		sp1DVF.LeftPanel.WidthMax = 400
		sp1DVF.LeftPanel.Header.Height = 50
		sp1DVF.LeftPanel.Footer.Height = 50
		sp1DVF.RightPanel.Header.Height = 50
		sp1DVF.RightPanel.Footer.Height = 50
	End Sub
End Class