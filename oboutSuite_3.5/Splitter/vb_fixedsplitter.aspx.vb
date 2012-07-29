imports System

public class fixedsplitter 
	inherits System.Web.UI.Page

	protected splDV as OboutInc.Splitter2.Splitter
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		splDV.IsResizable = false
		splDV.CookieDays = 0
		splDV.StyleFolder="styles/default"
		splDV.LeftPanel.WidthMin = 100
		splDV.LeftPanel.WidthMax = 400
		splDV.LeftPanel.WidthDefault = 140
		splDV.LeftPanel.Header.Height = 50
		splDV.LeftPanel.Footer.Height = 50
		splDV.RightPanel.Header.Height = 70
		splDV.RightPanel.Footer.Height = 50
	End Sub
End Class
