using System;
using OboutInc.Calendar2;

public class cs_addparam1 : OboutInc.oboutAJAXPage
{
	protected Calendar myCalendar;
	
	void Page_Load(object sender, EventArgs e) 
	{
		if (!IsCallback)
		{
			myCalendar.DateToday  = new DateTime(1983, 5, 22);
			myCalendar.ShowYearSelector = true;
			myCalendar.TitleText = "";
		}
    }
	
	public string ComputeAge(string name, int year)
	{
		int age = DateTime.Now.Year - year;
		return name + " is " + age + " years old.";
	}
}