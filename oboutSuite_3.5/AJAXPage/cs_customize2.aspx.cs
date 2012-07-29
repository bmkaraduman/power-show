using System;
using OboutInc;

public class cs_customize2 : OboutInc.oboutAJAXPage
{
	protected CallbackPanel cp3;
	protected CallbackPanel cp4;
	
	void Page_Load(object sender, EventArgs e) {
        cp3.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
		cp4.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
    }
	
	private bool oboutAJAXPage_BeforePanelUpdate(string PanelId, string UpdateContainer) {
		System.Threading.Thread.Sleep(2000);
		return true;
	}
}