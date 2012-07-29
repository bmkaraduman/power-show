imports OboutInc.Show

public class vb_multipleshows
	inherits System.Web.UI.Page
	
	Protected Dim Show1 as Show
	Protected Dim Show2 as Show
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.Width=370
		Show1.Height=175
		Show1.ShowType=ShowType.Show
		Show1.TransitionType=TransitionType.Fading
		Show1.TimeBetweenPanels=3000
		
		Show2.Width=370
		Show2.Height=175
		Show2.ShowType=ShowType.Show
		Show2.TransitionType=TransitionType.None
		Show2.TimeBetweenPanels=2000
		
	End Sub
	
end class