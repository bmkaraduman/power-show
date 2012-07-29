imports OboutInc.Show

public class vb_members
	inherits System.Web.UI.Page
	
	Protected Dim Show1 as Show
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.Width=400
		Show1.Height=180
		Show1.ShowType=ShowType.Show
		Show1.TransitionType=TransitionType.Fading
		
	End Sub
	
end class