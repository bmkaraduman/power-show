imports OboutInc.Show

public class vb_selectedpanel
	inherits System.Web.UI.Page
	
	Protected Dim Show1 as Show
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.Width=370
		Show1.Height=195
		Show1.SelectedPanel=3
		Show1.ShowType=ShowType.Manual
		Show1.ManualChanger=true
		
		Show1.Changer.Width=370
		Show1.Changer.Height=30
		Show1.Changer.Type=ChangerType.Both
		Show1.Changer.HorizontalAlign=ChangerHorizontalAlign.Center
		
	End Sub
	
end class