public class vb_createtimer1 
	inherits OboutInc.oboutAJAXPage

	public sub ServerCreateTimer () 
		CreateTimer("MyTimer", "fillDiv('myDIV')", 3000)
	end sub
	
	public sub ServerCancelTimer ()
		CancelTimer("MyTimer")
	end sub
end class