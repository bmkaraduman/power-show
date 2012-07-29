imports System

public class vb_createtimer2 
	inherits OboutInc.oboutAJAXPage

	public sub ServerCreateTimer ()
		if not Session("nrCallback") is nothing
			Session("nrCallback") = 0
		end if
			
		CreateTimer("MyTimer", "myServerMethod", "myClientFunction", 2000)
	end sub
	
	public sub ServerCancelTimer () 
		if not Session("nrCallback") is nothing
			Session("nrCallback") = 0
		end if
			
		CancelTimer("MyTimer")
	end sub
	
	public function myServerMethod() as string
		if Session("nrCallback") is nothing
			Session("nrCallback") = 0
		end if
			
		Session("nrCallback") = Int32.Parse(Session("nrCallback").ToString()) + 1
		
		return Session("nrCallback").ToString()
	end function
end class