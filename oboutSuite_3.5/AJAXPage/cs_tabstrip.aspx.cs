using System;
using System.Web.UI.WebControls;
using OboutInc;
using OboutInc.EasyMenu_Pro;

public class cs_tabstrip : OboutInc.oboutAJAXPage
{
	protected CallbackPanel cp1;
	protected Literal lSrc;
	protected EasyMenu EasymenuTabStrip;
	
	void Page_Load(object sender, EventArgs e) 
        {
		if (!IsPostBack)
		{
			lSrc.Text = "item1";
			EasymenuTabStrip.SelectedItemId = "item1";
		}			
	}
	
	protected bool cp1_OnBeforePanelUpdate(string PanelId, string UpdateContainer)
	{
		lSrc.Text = this.UpdatePanelParams["itemID"].ToString();
		
		System.Threading.Thread.Sleep(1000);
		
		return true;
	}
}