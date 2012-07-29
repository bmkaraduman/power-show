imports OboutInc.Show

public class vb_style_gallery
	inherits System.Web.UI.Page
	
	Dim StyleFolder as string = "styles/"
	Protected Dim Show1 as Show
	Protected Dim lbLiveStyles as ListBox
	
	protected Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.Width=370
		Show1.Height=195
		Show1.ShowType=ShowType.Manual
		Show1.ManualChanger=true
		Show1.Changer.Width=370
		Show1.Changer.Height=30
		Show1.Changer.Type=ChangerType.Both
		Show1.Changer.HorizontalAlign=ChangerHorizontalAlign.Center

		If not IsPostBack
		
			Show1.StyleFolder = ""
			
		End If
		
	End Sub
	
	protected Sub ChangeStyle(ByVal sender As Object, ByVal e As EventArgs)
	
		If lbLiveStyles.SelectedValue.ToString() = "Default"
			Show1.StyleFolder = ""
		End If
		
		If lbLiveStyles.SelectedValue.ToString() <> "Default"
			Show1.StyleFolder = StyleFolder + lbLiveStyles.SelectedValue.ToString()
		End If
		
	End Sub
	
end class