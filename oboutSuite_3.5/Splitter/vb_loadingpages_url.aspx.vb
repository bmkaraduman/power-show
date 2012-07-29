imports System

public class loadingpages_url 
	inherits System.Web.UI.Page

	protected splDV as OboutInc.Splitter2.Splitter
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		' build splitter
		splDV.CookieDays = 0
		splDV.StyleFolder="styles/default"
		
		splDV.LeftPanel.Content.Url="HTMFiles/1.html"
		splDV.RightPanel.Content.Url="HTMFiles/2_1.html"
		
		splDV.LeftPanel.WidthDefault = 240
		splDV.LeftPanel.WidthMin = 100
		splDV.LeftPanel.WidthMax = 400
		splDV.LeftPanel.Header.Height = 50
		splDV.LeftPanel.Footer.Height = 50
		splDV.RightPanel.Header.Height = 50
		splDV.RightPanel.Footer.Height = 50
	End Sub
End Class