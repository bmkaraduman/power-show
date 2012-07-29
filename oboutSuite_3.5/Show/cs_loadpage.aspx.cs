using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_loadpage : System.Web.UI.Page
{
	protected PlaceHolder PlaceHolder1;
	
	void Page_Load(object sender, EventArgs e) 
	{
		Show Show1 = new Show();
		Show1.Width="400px";
		Show1.Height="340px";
		Show1.ShowType=ShowType.Show;
		Show1.ID = "Show1";
		Show1.AddUrlPanel("HTMFiles/1.html");
		Show1.AddUrlPanel("HTMFiles/2.html");
		Show1.AddUrlPanel("HTMFiles/3.html");
		Show1.AddUrlPanel("HTMFiles/4.html");
		
		PlaceHolder1.Controls.Add(Show1);
	}
}