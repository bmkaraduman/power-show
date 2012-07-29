imports  System
imports System.Web.UI.WebControls

public class vb_updateallpanels 
	inherits OboutInc.oboutAJAXPage

	protected serverTime as Literal
	protected serverMillisecond as Literal
	
	sub Page_Load(byval sender as object, byval e as EventArgs) 
        serverTime.Text = DateTime.Now.TimeOfDay.ToString()
		serverMillisecond.Text = DateTime.Now.Millisecond.ToString().PadLeft(3, "0")
    end sub
end class