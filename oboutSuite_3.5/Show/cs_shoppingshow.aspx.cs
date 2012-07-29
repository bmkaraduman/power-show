using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_shoppingshow : System.Web.UI.Page
{
	protected Show Show1;
	
	void Page_Load(object sender, EventArgs e) 
	{
		Show1.Width="400px";
		Show1.Height="220px";
		Show1.ShowType=ShowType.Show;
		Show1.TransitionType=TransitionType.Scrolling;
		Show1.ScrollDirection=ScrollDirection.Top;
	}
}