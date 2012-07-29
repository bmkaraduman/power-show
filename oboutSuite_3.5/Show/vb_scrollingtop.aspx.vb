imports OboutInc.Show

public class vb_scrollingtop
	inherits System.Web.UI.Page
	
	Protected Dim Show1 as Show
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.Width=700
		Show1.Height=220
		Show1.ShowType=ShowType.Show
		Show1.TransitionType=TransitionType.Scrolling
		Show1.ScrollDirection=ScrollDirection.Top
		
	End Sub
	
end class