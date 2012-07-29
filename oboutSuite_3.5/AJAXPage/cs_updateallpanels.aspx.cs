using System;
using System.Web.UI.WebControls;

public class cs_updateallpanels : OboutInc.oboutAJAXPage
{
	protected Literal serverTime;
	protected Literal serverMillisecond;
	
	void Page_Load(object sender, EventArgs e) {
        serverTime.Text = DateTime.Now.TimeOfDay.ToString();
		serverMillisecond.Text = DateTime.Now.Millisecond.ToString().PadLeft(3, '0');		
    }	
}