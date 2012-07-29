using System;
using System.Web.UI.WebControls;
using OboutInc;

public class cs_rendermethod : OboutInc.oboutAJAXPage
{
	protected Label label1;
	protected Label label2;
	protected Label label3;
	protected Label label4;
	protected CallbackPanel panelAlways;
	protected CallbackPanel panelOnCallback;
	protected CallbackPanel panelOnExplicitRequest;
	protected CallbackPanel panelOnExplicitRequestAndPageLoad;
	
	void Page_Load(object sender, EventArgs e) 
	{
        label1.Text = DateTime.Now.ToString();
		label2.Text = DateTime.Now.ToString();
		label3.Text = DateTime.Now.ToString();
		label4.Text = DateTime.Now.ToString();
		
		panelAlways.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
		panelOnCallback.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
		panelOnExplicitRequest.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
		panelOnExplicitRequestAndPageLoad.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
    }
	
	private bool oboutAJAXPage_BeforePanelUpdate(string PanelId, string UpdateContainer) 
	{
		System.Threading.Thread.Sleep(1000);
		return true;
	}
}