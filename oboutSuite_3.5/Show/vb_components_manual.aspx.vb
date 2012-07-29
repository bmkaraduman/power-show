imports OboutInc.Show

public class vb_components_manual
	inherits System.Web.UI.Page
	
	Protected Dim Show1 as Show
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.StyleFolder="styles/style6"
		Show1.Width=700
		Show1.Height=250
		Show1.ShowType=ShowType.Manual
		Show1.ManualChanger=true
		
		Show1.Changer.Width=700
		Show1.Changer.Height=30
		Show1.Changer.Type=ChangerType.Both
		
	End Sub
	
end class