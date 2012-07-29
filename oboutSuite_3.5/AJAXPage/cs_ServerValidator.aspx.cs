using System.Collections;
using System.Text.RegularExpressions;

public class cs_ServerValidator : OboutInc.oboutAJAXPage
{
	public Hashtable unique(string elementValue, string elementID)
	{
		bool valid = true;
		
		ArrayList listNames = new ArrayList();
		listNames.Add("john");
		listNames.Add("david");
		listNames.Add("tim");
		listNames.Add("sheldon");
		listNames.Add("kim");
		
		if (elementValue.Trim() == string.Empty)
			valid = false;
		else
		{
			Regex objName = new Regex("^[ \t\r\n\v\f]*[a-zA-Z0-9_-]*[ \t\r\n\v\f]*$");
		
			if (!objName.IsMatch(elementValue))
				valid = false;
		}
		
		if (valid)
			if (listNames.Contains(elementValue.Trim().ToLower()))
				valid = false;
			
		Hashtable ht = new Hashtable();
		ht.Add("elementID", elementID);
		ht.Add("valid", valid);
		
		ExecBeforeLoad("ProcessValidationOnClient(response)");
		
		return ht;
	}
	
	public Hashtable required(string elementValue, string elementID)
	{
		bool valid = true;
		if (elementValue.Trim() == string.Empty)
			valid = false;
		else
		{
			Regex objName = new Regex("^[ \t\r\n\v\f]*[a-zA-Z0-9_-]*[ \t\r\n\v\f]*$");
		
			if (!objName.IsMatch(elementValue))
				valid = false;
		}
			
		Hashtable ht = new Hashtable();
		ht.Add("elementID", elementID);
		ht.Add("valid", valid);
		
		ExecBeforeLoad("ProcessValidationOnClient(response)");
		
		return ht;
	}
	
	public Hashtable phoneNumber(string elementValue, string elementID)
	{
		bool valid = true;
		
		Regex objPhoneNumber = new Regex(@"^\(?\d{3}\)?\s\d{3}-\d{4}$");
		
		if (!objPhoneNumber.IsMatch(elementValue))
			valid = false;
	
		Hashtable ht = new Hashtable();
		ht.Add("elementID", elementID);
		ht.Add("valid", valid);
		
		ExecBeforeLoad("ProcessValidationOnClient(response)");
		
		return ht;
	}
}