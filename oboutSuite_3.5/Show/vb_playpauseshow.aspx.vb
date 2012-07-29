imports OboutInc.Show

public class vb_playpauseshow
	inherits System.Web.UI.Page
	
	Protected Dim Show1 as Show
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Show1.StyleFolder="styles/style5"
		Show1.Width=625
		Show1.Height=350
		Show1.ShowType=ShowType.Show
		Show1.ManualChanger=true
		Show1.Changer.Width=625
		Show1.Changer.Height=40
		Show1.Changer.Type=ChangerType.Both
		Show1.Changer.HorizontalAlign=ChangerHorizontalAlign.Center
		Show1.Changer.Height=40
		Show1.Changer.Width=625
	End Sub
	
end class