imports OboutInc.Show

public class vb_fadingcustomize
	inherits System.Web.UI.Page
	
	Protected Dim Show1 as Show
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.Width=370
		Show1.Height=175
		Show1.ShowType=ShowType.Show
		Show1.TransitionType=TransitionType.Fading
		Show1.FadingSpeed=1000
		Show1.FadingStep=3
		
	End Sub
	
end class