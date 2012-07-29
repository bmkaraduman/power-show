imports OboutInc.Show

public class vb_quicknews
	inherits System.Web.UI.Page
	
	Protected Dim Show1 as Show
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.Width=420
		Show1.Height=92
		Show1.ShowType=ShowType.Show
		Show1.TransitionType=TransitionType.QuickScroll
		Show1.ScrollDirection=ScrollDirection.Top
		
	End Sub
	
end class