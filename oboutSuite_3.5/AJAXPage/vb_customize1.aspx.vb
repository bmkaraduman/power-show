imports System
imports OboutInc

public class vb_customize1 
	Inherits OboutInc.oboutAJAXPage

	protected cp1 as CallbackPanel
	protected cp2 as CallbackPanel
	
	sub Page_Load(byval sender as object, byval e as EventArgs) 
		addhandler cp1.BeforePanelUpdate, addressof oboutAJAXPage_BeforePanelUpdate
		addhandler cp2.BeforePanelUpdate, addressof oboutAJAXPage_BeforePanelUpdate
    end sub
	
	private function oboutAJAXPage_BeforePanelUpdate(byval PanelId as string, byval UpdateContainer as string) as boolean
		System.Threading.Thread.Sleep(2000)
		return true
	end function
end class