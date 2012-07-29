imports OboutInc.Show

public class vb_loadpage
	inherits System.Web.UI.Page
	
	Protected Dim PlaceHolder1 as PlaceHolder
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		dim Show1 as new Show
		Show1.Width=400
		Show1.Height=340
		Show1.ShowType=ShowType.Show
		Show1.ID = "Show1"
		Show1.AddUrlPanel("HTMFiles/1.html")
		Show1.AddUrlPanel("HTMFiles/2.html")
		Show1.AddUrlPanel("HTMFiles/3.html")
		Show1.AddUrlPanel("HTMFiles/4.html")
		
		PlaceHolder1.Controls.Add(Show1)
		
		
	End Sub
	
end class