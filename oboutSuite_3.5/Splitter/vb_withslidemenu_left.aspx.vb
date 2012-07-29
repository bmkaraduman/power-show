public class vb_withslidemenu_left 
	Inherits OboutInc.oboutAJAXPage

	protected pro7 as OboutInc.SlideMenu.SlideMenu 
	
	public Sub UpdateSlideMenu(BYVAL cId as string)
	
		pro7.SelectedId = cId
		UpdatePanel("cp_slidemenu")
		
	End Sub
	
End Class