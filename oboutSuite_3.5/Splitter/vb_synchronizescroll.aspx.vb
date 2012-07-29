imports System

public class synchronizescroll 
	inherits System.Web.UI.Page

	protected spl1 as OboutInc.Splitter2.Splitter
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		spl1.SynchronizeScroll = true
		spl1.CookieDays = 0	
		spl1.StyleFolder="styles/default"
		spl1.LeftPanel.WidthDefault = 343
		spl1.LeftPanel.WidthMin = 100
		spl1.LeftPanel.Header.Height = 40
		spl1.RightPanel.WidthMin = 100
		spl1.RightPanel.Header.Height = 40
	End Sub
End class
