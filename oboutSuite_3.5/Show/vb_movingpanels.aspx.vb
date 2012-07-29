imports OboutInc.Show

public class vb_movingpanels
	inherits System.Web.UI.Page
	
	Protected Dim Show1 as Show
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.Width=370
		Show1.Height=165
		Show1.ShowType=ShowType.Manual
		Show1.ManualChanger=false
		
	End Sub
	
end class