imports System
imports OboutInc
imports OboutInc.Calendar2

public class vb_jsvisible 
	inherits OboutInc.oboutAJAXPage

	protected dim myCalendar as Calendar
	
	sub Page_Load(byval sender as object, byval e as EventArgs) 
		if not IsCallback
			myCalendar.DateToday  = new DateTime(1983, 5, 22)
			myCalendar.ShowYearSelector = true
			myCalendar.TitleText = ""
		end if
    end sub
	
	<JSVisible> _
	public function ComputeAge(byval name as string, byval year as Int32) as string
		dim age as Int32 = DateTime.Now.Year - year
		return name + " is " + age.ToString() + " years old."
	end function
end class