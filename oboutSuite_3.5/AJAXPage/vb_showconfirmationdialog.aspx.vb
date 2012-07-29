imports  System.Collections

public class vb_showconfirmationdialog 
	inherits OboutInc.oboutAJAXPage

	public sub ServerUseConfirmDialog () 
		' these are the params that can be sent to the result function along with the response
		dim ht as Hashtable = new Hashtable()
		ht.Add("param1", 1)
		ht.Add("param2", "a")
		
		' call the ShowConfirmDialog function with the message, the function to call
		' after the user answers, and the extra parameters the function should have.
		' the initial client side function that called this function (ServerUseConfirmDialog)
		' will receive the final answer of function Confirm
		ShowConfirmationDialog("Are you sure?", "Confirm", ht)
	end sub

	public function Confirm (byval response as boolean, byval param1 as int32, byval param2 as string) as string
		' response is true or false depending on user choice
		' the rest of the params is what we saved as the last
		' parameter of ShowConfirmationDialog
		if response
		
			' user chose OK
			'
			' do some execution
			'
			return "You clicked Ok"
		else 
		
			' user chose Cancel
			'
			' do some execution
			'
			return "You clicked Cancel"
		end if
	end function
end class