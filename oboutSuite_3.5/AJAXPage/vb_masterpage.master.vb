imports System.Web.UI.WebControls

public class vb_masterpage 
	inherits System.Web.UI.MasterPage

	protected lblText as Label
	
	public sub DoCallback()
	
		lblText.Text = "some text from server ... panel update ..."
		CType(Me.Page, OboutInc.oboutAJAXPage).UpdatePanel("CallbackPanel1")
	end sub
end class