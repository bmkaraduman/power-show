imports OboutInc.Show

public class vb_livequotes
	inherits System.Web.UI.Page
	
	Protected Dim Show1 as Show
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.Width=490
		Show1.Height=16
		Show1.ShowType=ShowType.Show
		Show1.TransitionType=TransitionType.Scrolling
		Show1.ScrollDirection=ScrollDirection.Left
		Show1.StopScrolling=true
		Show1.ScrollingStep=2
		Show1.TimeBetweenPanels=1
		Show1.ScrollingSpeed=5000
		
	End Sub
	
end class