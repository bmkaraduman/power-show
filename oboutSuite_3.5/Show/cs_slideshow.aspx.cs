using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_slideshow : System.Web.UI.Page
{
	protected Show Show1;
	
	void Page_Load(object sender, EventArgs e) 
	{
		Show1.StyleFolder="styles/style7";
		Show1.Width="680px";
		Show1.Height="450px";
		Show1.ShowType=ShowType.Manual;
		Show1.ManualChanger=true;
		
		Show1.Changer.Width=680;
		Show1.Changer.Height=40;
		Show1.Changer.Type=ChangerType.Both;
	}
}