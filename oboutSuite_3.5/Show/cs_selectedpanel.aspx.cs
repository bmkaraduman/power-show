using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_selectedpanel : System.Web.UI.Page
{
	protected Show Show1;
	
	void Page_Load(object sender, EventArgs e) 
	{
		Show1.Width="370px";
		Show1.Height="195px";
		Show1.SelectedPanel=3;
		Show1.ShowType=ShowType.Manual;
		Show1.ManualChanger=true;
		
		Show1.Changer.Width=370;
		Show1.Changer.Height=30;
		Show1.Changer.Type=ChangerType.Both;
		Show1.Changer.HorizontalAlign=ChangerHorizontalAlign.Center;
	}
}