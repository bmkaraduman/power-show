public class cs_withslidemenu_left : OboutInc.oboutAJAXPage
{
	protected OboutInc.SlideMenu.SlideMenu pro7;
	
	public void UpdateSlideMenu(string cId)
	{
		pro7.SelectedId = cId;	
		UpdatePanel("cp_slidemenu");
	}
}