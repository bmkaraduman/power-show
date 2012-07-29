imports System

public class cookiedays 
	inherits System.Web.UI.Page

	protected splDV as OboutInc.Splitter2.Splitter
	protected splDV2 as OboutInc.Splitter2.Splitter
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		splDV.CookieDays = 10
		splDV.StyleFolder="styles/default"
		splDV.LeftPanel.WidthMin = 100
		splDV.LeftPanel.WidthMax = 400
		splDV.LeftPanel.WidthDefault = 140
		splDV.LeftPanel.Header.Height = 50
		splDV.LeftPanel.Footer.Height = 50
		splDV.RightPanel.Header.Height = 50
		splDV.RightPanel.Footer.Height = 50
		
		splDV2.CookieDays = 0
		splDV2.StyleFolder="styles/default"
		splDV2.LeftPanel.WidthMin = 100
		splDV2.LeftPanel.WidthMax = 400
		splDV2.LeftPanel.WidthDefault = 140
		splDV2.LeftPanel.Header.Height = 50
		splDV2.LeftPanel.Footer.Height = 50
		splDV2.RightPanel.Header.Height = 50
		splDV2.RightPanel.Footer.Height = 50
	End Sub
End Class
