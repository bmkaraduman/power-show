public class cs_addparam2 : OboutInc.oboutAJAXPage
{
	public string onAddParam(string Param1, string Param2, string Param3, string Param4, string Param5, string Param6, string Param7, string Param8, string Param9, string Param10)
	{
		int j = 0;
		string result;
		if (Param1==null)
		{
			return ("No parameter has been added after the last callback.");
		}
		else
		{
			j++;
			result = "This data is returned from the server.\n\nThe parameter list is:\nParam1: " + Param1 + "\n";
			if (Param2!=null){
				j++;
				result += "Param2: " + Param2 + "\n";
			}
			if (Param3!=null)
			{
				j++;
				result += "Param3: " + Param3 + "\n";
			}
			if (Param4!=null)
			{
				j++;
				result += "Param4: " + Param4 + "\n";
			}
			if (Param5!=null)
			{
				j++;
				result += "Param5: " + Param5 + "\n";
			}
			if (Param6!=null)
			{
				j++;
				result += "Param6: " + Param6 + "\n";
			}
			if (Param7!=null)
			{
				j++;
				result += "Param7: " + Param7 + "\n";
			}
			if (Param8!=null)
			{
				j++;
				result += "Param8: " + Param8 + "\n";
			}
			if (Param9!=null)
			{
				j++;
				result += "Param9: " + Param9 + "\n";
			}
			if (Param10!=null)
			{
				j++;
				result += "Param10: " + Param10 + "\n";
			}
			return result + "\n The list contains " + j + " parameters.";
		}
	}		
}