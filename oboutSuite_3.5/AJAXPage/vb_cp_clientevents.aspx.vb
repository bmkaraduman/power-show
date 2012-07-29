imports System
imports OboutInc

public class vb_cp_clientevents 
	inherits OboutInc.oboutAJAXPage

	protected callbackPanel1 as CallbackPanel
	
	sub Page_Load(byval sender as object, byval e as EventArgs) 
        addhandler callbackPanel1.BeforePanelUpdate, addressof oboutAJAXPage_BeforePanelUpdate
    end sub
	
	private function oboutAJAXPage_BeforePanelUpdate(byval PanelId as string, byval UpdateContainer as string) as boolean
		System.Threading.Thread.Sleep(2000)
		return true
	end function
	
	public sub MyServerMethod() 
	end sub
end class