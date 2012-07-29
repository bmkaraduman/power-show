imports System
imports System.Web.UI.WebControls
imports OboutInc

public class vb_rendermethod 
	inherits OboutInc.oboutAJAXPage

	protected label1 as Label
	protected label2 as Label 
	protected label3 as Label
	protected label4 as Label
	protected panelAlways as CallbackPanel
	protected panelOnCallback as CallbackPanel
	protected panelOnExplicitRequest as CallbackPanel
	protected panelOnExplicitRequestAndPageLoad as CallbackPanel
	
	sub Page_Load(byval sender as object, byval e as EventArgs) 
	
        label1.Text = DateTime.Now.ToString()
		label2.Text = DateTime.Now.ToString()
		label3.Text = DateTime.Now.ToString()
		label4.Text = DateTime.Now.ToString()
		
		addhandler panelAlways.BeforePanelUpdate, addressof oboutAJAXPage_BeforePanelUpdate
		addhandler panelOnCallback.BeforePanelUpdate, addressof oboutAJAXPage_BeforePanelUpdate
		addhandler panelOnExplicitRequest.BeforePanelUpdate, addressof oboutAJAXPage_BeforePanelUpdate
		addhandler panelOnExplicitRequestAndPageLoad.BeforePanelUpdate, addressof oboutAJAXPage_BeforePanelUpdate
    end sub
	
	private function oboutAJAXPage_BeforePanelUpdate(byval PanelId as string, byval UpdateContainer as string) as boolean
	
		System.Threading.Thread.Sleep(1000)
		return true
	end function
end class