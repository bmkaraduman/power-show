imports System.Web.UI.WebControls
imports OboutInc.Show

public class vb_imagesshowpath
	inherits System.Web.UI.Page
	
	Protected Dim PlaceHolder1 as PlaceHolder
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		dim Show1 as new Show
		Show1.ImagesShowPath="images/members"
		Show1.Width=180
		Show1.Height=180
		Show1.ShowType=ShowType.Show
		Show1.TransitionType=TransitionType.QuickScroll
		Show1.ID = "Show1"
		
		PlaceHolder1.Controls.Add(Show1)
		
	End Sub
	
end class