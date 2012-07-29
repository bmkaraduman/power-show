using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_livequotes : System.Web.UI.Page
{
	protected Show Show1;
	
	void Page_Load(object sender, EventArgs e) 
	{
		Show1.Width="490px";
		Show1.Height="16px";
		Show1.ShowType=ShowType.Show;
		Show1.TransitionType=TransitionType.Scrolling;
		Show1.ScrollDirection=ScrollDirection.Left;
		Show1.StopScrolling=true;
		Show1.ScrollingStep=2;
		Show1.TimeBetweenPanels=1;
		Show1.ScrollingSpeed=5000;
	}
}