using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_imagesshowpath : System.Web.UI.Page
{
	protected PlaceHolder PlaceHolder1;
	
	void Page_Load(object sender, EventArgs e) 
	{
		Show Show1 = new Show();
		Show1.ImagesShowPath="images/members";
		Show1.Width="180px";
		Show1.Height="180px";
		Show1.ShowType=ShowType.Show;
		Show1.TransitionType=TransitionType.QuickScroll;
		Show1.ID = "Show1";
		
		PlaceHolder1.Controls.Add(Show1);
	}
}