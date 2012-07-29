using System;
using OboutInc;

public class cs_customize1 : OboutInc.oboutAJAXPage
{
	protected CallbackPanel cp1;
	protected CallbackPanel cp2;
	
	void Page_Load(object sender, EventArgs e) {
		cp1.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
		cp2.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
    }
	
	private bool oboutAJAXPage_BeforePanelUpdate(string PanelId, string UpdateContainer) {
		System.Threading.Thread.Sleep(2000);
		return true;
	}
}