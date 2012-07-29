imports System
imports OboutInc
imports System.Web.UI.WebControls

public class vb_weather 
	Inherits OboutInc.oboutAJAXPage

	protected cp_weather as OboutInc.CallbackPanel
	protected lImage as Literal 
	protected lDegree1 as Literal
	protected lDegree2 as Literal
	protected lDate as Literal
	protected l1 as Literal
	protected l2 as Literal
	protected l3 as Literal
	protected l4 as Literal
	protected l5 as Literal
	
	sub Page_Load(byval sender as object, byval e as EventArgs) 
        
		addhandler cp_weather.BeforePanelUpdate, addressof oboutAJAXPage_BeforePanelUpdate
		
		if IsCallback or not IsPostBack
		
			dim r1 as Random = new Random()
			lImage.Text = "images/Weather/" + r1.Next(1, 34).ToString() + ".gif"
			dim r2 as Random = new Random()
			lDegree1.Text = r2.Next(30, 70).ToString()
			lDegree2.Text = lDegree1.Text
			lDate.Text = DateTime.Now.ToString()
			dim r3 as Random = new Random()
			l1.Text = r3.Next(1, 4).ToString()
			dim r4 as Random = new Random()
			l2.Text = r3.Next(1, 50).ToString()
			dim r5 as Random = new Random()
			l3.Text = r3.Next(1, 100).ToString()
			dim r6 as Random = new Random()
			l4.Text = r3.Next(25, 55).ToString()
			dim r7 as Random = new Random()
			l5.Text = r3.Next(0, 10).ToString() + ".0"
		end if
    end sub
	
	private function oboutAJAXPage_BeforePanelUpdate(byval PanelId as string, byval UpdateContainer as string) as boolean
	
		System.Threading.Thread.Sleep(3000)
		return true
	end function
end class
