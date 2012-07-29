using System;
using OboutInc;

public class cs_cp_clientevents : OboutInc.oboutAJAXPage
{
	protected OboutInc.CallbackPanel callbackPanel1;
	
	void Page_Load(object sender, EventArgs e) {
        callbackPanel1.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
    }
	
	private bool oboutAJAXPage_BeforePanelUpdate(string PanelId, string UpdateContainer) {
		System.Threading.Thread.Sleep(2000);
		return true;
	}
	
	public void MyServerMethod() {
	}
}