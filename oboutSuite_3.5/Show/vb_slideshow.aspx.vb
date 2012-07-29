imports OboutInc.Show

public class vb_slideshow
	inherits System.Web.UI.Page
	
	Protected Dim Show1 as Show
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.StyleFolder="styles/style7"
		Show1.Width=680
		Show1.Height=450
		Show1.ShowType=ShowType.Manual
		Show1.ManualChanger=true
		
		Show1.Changer.Width=680
		Show1.Changer.Height=40
		Show1.Changer.Type=ChangerType.Both
		
	End Sub
	
end class