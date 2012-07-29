using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_multipleshows : System.Web.UI.Page
{
	protected Show Show1;
	protected Show Show2;
	
	void Page_Load(object sender, EventArgs e) 
	{
		Show1.Width="370px";
		Show1.Height="175px";
		Show1.ShowType=ShowType.Show;
		Show1.TransitionType=TransitionType.Fading;
		Show1.TimeBetweenPanels=3000;
		
		Show2.Width="370px";
		Show2.Height="175px";
		Show2.ShowType=ShowType.Show;
		Show2.TransitionType=TransitionType.None;
		Show2.TimeBetweenPanels=2000;
	}
}