using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_currentpanel : System.Web.UI.Page
{
	protected Show Show1;
	
	void Page_Load(object sender, EventArgs e) 
	{
		Show1.Width="400px";
		Show1.Height="187px";
		Show1.ShowType=ShowType.Manual;
		Show1.ManualChanger=true;
		
		Show1.Changer.Width=400;
		Show1.Changer.Height=30;
		Show1.Changer.Type=ChangerType.Both;
	}
}