imports OboutInc.Show

public class vb_differenttypes
	inherits System.Web.UI.Page
	
	Protected Dim Show1 as Show
	Protected Dim ddlChangerType as DropDownList
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.Width=320
		Show1.Height=200
		Show1.ShowType=ShowType.Manual
		Show1.ManualChanger=true
		
		Show1.Changer.Width=350
		Show1.Changer.Height=30
		Show1.Changer.Type=ChangerType.Arrow
		
		Show1.StyleFolder = "styles/style5"
		
		If not IsPostBack
		
			Show1.Changer.Type = ChangerType.Arrow
		
		End If
		
	End Sub
	
	Protected Sub ChangeChangerType(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.Changer.Type = System.Enum.Parse(GetType(ChangerType), ddlChangerType.SelectedValue)
	
	End Sub
	
end class