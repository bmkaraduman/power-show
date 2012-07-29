imports System.Web.UI.WebControls

public class vb_baseclass 
    Inherits vb_basebaseclass

	protected dim literal as Literal
	
	public sub PanelUpdate() 
		literal.Text = "test"
		
		UpdatePanel("callbackPanel1")
	end sub
end class

Public Class vb_basebaseclass
    Inherits OboutInc.oboutAJAXPage
End Class
	
