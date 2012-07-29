using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_components_manual : System.Web.UI.Page
{
	protected Show Show1;
	
	void Page_Load(object sender, EventArgs e) 
	{
		Show1.StyleFolder="styles/style6";
		Show1.Width="700px";
		Show1.Height="250px";
		Show1.ShowType=ShowType.Manual;
		Show1.ManualChanger=true;
		
		Show1.Changer.Width=700;
		Show1.Changer.Height=30;
		Show1.Changer.Type=ChangerType.Both;
	}
}