using System;
using System.Web.UI.WebControls;
using OboutInc;

public class cs_updatepanel2 : OboutInc.oboutAJAXPage
{
	protected Literal serverTime;
	protected Literal serverTime3;
	protected CallbackPanel postbackPanel1;
	protected CallbackPanel postbackPanel3;
	
	void Page_Load(object sender, EventArgs e) {
        serverTime.Text = DateTime.Now.ToString();
		serverTime3.Text = DateTime.Now.ToString();
		
		postbackPanel1.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
		postbackPanel3.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
    }
	
	private bool oboutAJAXPage_BeforePanelUpdate(string PanelId, string UpdateContainer) {
		System.Threading.Thread.Sleep(2000);
		return true;
	}
	
	public void UpdatePanelFromServer() {
		UpdatePanel("postbackPanel3");
	}
}