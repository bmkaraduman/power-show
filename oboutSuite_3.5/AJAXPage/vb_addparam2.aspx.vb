public class vb_addparam2 
	inherits OboutInc.oboutAJAXPage

	public function onAddParam(byval Param1 as string, byval Param2 as string, byval Param3 as string, byval Param4 as string, byval Param5 as string, byval Param6 as string, byval Param7 as string, byval Param8 as string, byval Param9 as string, byval Param10 as string) as string
		dim j as int32 = 0
		dim result as string
		if Param1 is nothing
			return ("No parameter has been added after the last callback.")
		else
			j=j+1
			result = "This data is returned from the server.\n\nThe parameter list is:\nParam1: " + Param1 + "\n"
			if not Param2 is nothing
				j=j+1
				result = result + "Param2: " + Param2 + "\n"
			end if
			if not Param3 is nothing
				j=j+1
				result = result + "Param3: " + Param3 + "\n"
			end if
			if not Param4 is nothing
				j=j+1
				result = result + "Param4: " + Param4 + "\n"
			end if
			if not Param5 is nothing
				j=j+1
				result = result + "Param5: " + Param5 + "\n"
			end if
			if not Param6 is nothing
				j=j+1
				result = result + "Param6: " + Param6 + "\n"
			end if
			if not Param7 is nothing
				j=j+1
				result = result + "Param7: " + Param7 + "\n"
			end if
			if not Param8 is nothing
				j=j+1
				result = result + "Param8: " + Param8 + "\n"
			end if
			if not Param9 is nothing
				j=j+1
				result = result + "Param9: " + Param9 + "\n"
			end if
			if not Param10 is nothing
				j=j+1
				result = result + "Param10: " + Param10 + "\n"
			end if
			return result + "\n The list contains " + j.ToString() + " parameters."
		end if
	end function
end class