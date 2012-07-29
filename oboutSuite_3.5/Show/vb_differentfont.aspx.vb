imports System
imports System.Web.UI.WebControls
imports OboutInc.Show

public class vb_differentfont 
	inherits System.Web.UI.Page

	protected Show1 as Show
	
	private sub Page_Load(byval sender as object, byval e as EventArgs) 
	
		Show1.Width="700px"
		Show1.Height="220px"
		Show1.ShowType=ShowType.Show
		Show1.TransitionType=TransitionType.None
		
	end sub

end class