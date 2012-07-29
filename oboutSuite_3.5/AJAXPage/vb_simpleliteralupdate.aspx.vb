public class vb_simpleliteralupdate 
	inherits OboutInc.oboutAJAXPage

	protected literal as System.Web.UI.WebControls.Literal
	
	public sub PanelUpdate() 
		literal.Text = "test"
		
		UpdatePanel("callbackPanel1")
	end sub 
	
end class 