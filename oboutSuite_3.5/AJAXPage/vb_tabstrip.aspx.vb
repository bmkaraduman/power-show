imports System
imports System.Web.UI.WebControls
imports OboutInc
imports OboutInc.EasyMenu_Pro

public class vb_tabstrip 
	inherits OboutInc.oboutAJAXPage

	protected cp1 as CallbackPanel
	protected lSrc as Literal
	protected EasymenuTabStrip as EasyMenu 
	
	sub Page_Load(byval sender as object, byval e as EventArgs) 
	
		if not IsPostBack
		
			lSrc.Text = "item1"
			EasymenuTabStrip.SelectedItemId = "item1"
			
		end if 
			
	End Sub
	
	protected function cp1_OnBeforePanelUpdate(byval PanelId as string, byval UpdateContainer as string) as boolean
	
        lSrc.Text = Me.UpdatePanelParams("itemID").ToString()
		System.Threading.Thread.Sleep(1000)
		return true
	
	end function

End Class