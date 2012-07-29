using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_quicknews : System.Web.UI.Page
{
	protected Show Show1;
	
	void Page_Load(object sender, EventArgs e) 
	{
		Show1.Width="420px";
		Show1.Height="92px";
		Show1.ShowType=ShowType.Show;
		Show1.TransitionType=TransitionType.QuickScroll;
		Show1.ScrollDirection=ScrollDirection.Top;
	}
}