imports System
imports System.Web.UI.WebControls
imports OboutInc

public class vb_updatepanel2 
	inherits OboutInc.oboutAJAXPage

	protected serverTime as Literal
	protected serverTime3 as Literal 
	protected postbackPanel1 as CallbackPanel
	protected postbackPanel3 as CallbackPanel 
	
	sub Page_Load(byval sender as object, byval e as EventArgs) 
        serverTime.Text = DateTime.Now.ToString()
		serverTime3.Text = DateTime.Now.ToString()
		
		addhandler postbackPanel1.BeforePanelUpdate, addressof oboutAJAXPage_BeforePanelUpdate
		addhandler postbackPanel3.BeforePanelUpdate, addressof oboutAJAXPage_BeforePanelUpdate
		 
    end sub
	
	private function oboutAJAXPage_BeforePanelUpdate(byval PanelId as string, ByVal UpdateContainer as string) as boolean 
		System.Threading.Thread.Sleep(2000)
		return true
	end function
	
	public sub UpdatePanelFromServer() 
		UpdatePanel("postbackPanel3")
	end sub
end class