using System;
using OboutInc;
using System.Web.UI.WebControls;

public class cs_weather : OboutInc.oboutAJAXPage
{
	protected OboutInc.CallbackPanel cp_weather;
	protected Literal lImage;
	protected Literal lDegree1;
	protected Literal lDegree2;
	protected Literal lDate;
	protected Literal l1;
	protected Literal l2;
	protected Literal l3;
	protected Literal l4;
	protected Literal l5;
	
	void Page_Load(object sender, EventArgs e) {
        
		cp_weather.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
		
		if (IsCallback || !IsPostBack)
		{
			Random r1 = new Random();
			lImage.Text = "images/Weather/" + r1.Next(1, 34).ToString() + ".gif"; // 1 - 34
			Random r2 = new Random();
			lDegree1.Text = r2.Next(30, 70).ToString();
			lDegree2.Text = lDegree1.Text;
			lDate.Text = DateTime.Now.ToString();
			Random r3 = new Random();
			l1.Text = r3.Next(1, 4).ToString(); // 1 to 4
			Random r4 = new Random();
			l2.Text = r3.Next(1, 50).ToString(); // mph
			Random r5 = new Random();
			l3.Text = r3.Next(1, 100).ToString(); // 1- 100
			Random r6 = new Random();
			l4.Text = r3.Next(25, 55).ToString(); // 25 - 55
			Random r7 = new Random();	
			l5.Text = r3.Next(0, 10).ToString() + ".0"; // 0 - 10
		}
    }
	
	private bool oboutAJAXPage_BeforePanelUpdate(string PanelId, string UpdateContainer)
	{
		System.Threading.Thread.Sleep(3000);
		return true;
	}
}
