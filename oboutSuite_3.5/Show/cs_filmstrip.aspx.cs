using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_filmstrip : System.Web.UI.Page
{
	protected Show Show1;
	
	void Page_Load(object sender, EventArgs e) 
	{
	
		Show1.StyleFolder = "styles/style5";
		Show1.Width="700px";
		Show1.Height="240px";
		Show1.ShowType=ShowType.Manual;
		Show1.ManualChanger = true;
		
		Show1.Changer.Type = ChangerType.Both;
		Show1.Changer.ArrowType = ArrowType.Side1;
		Show1.Changer.Height = 40;
		Show1.Changer.Width = 625;
		Show1.Changer.HorizontalAlign = ChangerHorizontalAlign.Center;
	}
}