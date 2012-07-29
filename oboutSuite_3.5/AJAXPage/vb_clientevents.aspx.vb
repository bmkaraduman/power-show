imports System

public class vb_clientevents 
	inherits OboutInc.oboutAJAXPage

	sub Page_Load(byval sender as object, byval e as EventArgs) 
		RequestTimeoutMilliseconds = 4000
    end sub
	
	public sub MyServerMethod(byval withTimeout as boolean) 
		if withTimeout
			System.Threading.Thread.Sleep(5000)
		end if
	end sub
end class