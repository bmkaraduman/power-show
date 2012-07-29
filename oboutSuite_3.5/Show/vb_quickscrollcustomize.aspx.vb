imports OboutInc.Show

public class vb_quickscrollcustomize
	inherits System.Web.UI.Page
	
	Protected Dim Show1 as Show
	Protected Dim ddlScrollDirection as DropDownList
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.Width=345
		Show1.Height=153
		Show1.ShowType=ShowType.Show
		Show1.TransitionType=TransitionType.QuickScroll
		
		if not IsPostBack
		
			ddlScrollDirection.SelectedIndex = 0
			Show1.ScrollDirection = ScrollDirection.Left
		
		End If
	
	End Sub
	
	Protected Sub ChangeScrollDirection(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.ScrollDirection = System.Enum.Parse(GetType(ScrollDirection), ddlScrollDirection.SelectedValue)
	
	End Sub
	
end class