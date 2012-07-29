imports OboutInc.Show

public class vb_scrollingcustomize
	inherits System.Web.UI.Page
	
	Protected Dim Show1 as Show
	Protected Dim ddlScrollDirection as DropDownList
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.Width=370
		Show1.Height=155
		Show1.ShowType=ShowType.Show
		Show1.TransitionType=TransitionType.Scrolling
		Show1.ScrollingSpeed=1000
		Show1.ScrollingStep=5
		
		if not IsPostBack
		
			ddlScrollDirection.SelectedIndex = 0
			Show1.ScrollDirection = ScrollDirection.Left
		
		End If
	
	End Sub
	
	Protected Sub ChangeScrollDirection(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.ScrollDirection = System.Enum.Parse(GetType(ScrollDirection), ddlScrollDirection.SelectedValue)
	
	End Sub
	
end class