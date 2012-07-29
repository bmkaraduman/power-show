imports System
imports OboutInc

public class vb_customize2 
	inherits OboutInc.oboutAJAXPage

	protected cp3 as CallbackPanel
	protected cp4 as CallbackPanel
	
	sub Page_Load(byval sender as object, byval e as EventArgs) 
		addhandler cp3.BeforePanelUpdate, addressof oboutAJAXPage_BeforePanelUpdate
		addhandler cp4.BeforePanelUpdate, addressof oboutAJAXPage_BeforePanelUpdate
    end sub
	
	private function oboutAJAXPage_BeforePanelUpdate(byval Panelid as string, byval UpdateContainer as string) as boolean
		System.Threading.Thread.Sleep(2000)
		return true
	end function
end class 