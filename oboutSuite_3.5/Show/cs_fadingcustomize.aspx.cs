using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_fadingcustomize : System.Web.UI.Page
{
	protected Show Show1;
	
	void Page_Load(object sender, EventArgs e) 
	{
		Show1.Width="370px";
		Show1.Height="175px";
		Show1.ShowType=ShowType.Show;
		Show1.TransitionType=TransitionType.Fading;
		Show1.FadingSpeed=1000;
		Show1.FadingStep=3;
	}

}