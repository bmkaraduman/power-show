using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_movingpanels : System.Web.UI.Page
{
	protected Show Show1;
	
	void Page_Load(object sender, EventArgs e) 
	{
		Show1.Width="370px";
		Show1.Height="165px";
		Show1.ShowType=ShowType.Manual;
		Show1.ManualChanger=false;
	}
}