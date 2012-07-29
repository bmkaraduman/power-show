using System;

public class cs_async : OboutInc.oboutAJAXPage
{
	public string onDnD2(int number1, int number2)
	{
		DateTime dt = DateTime.Now;
		while (DateTime.Now.Subtract(dt).Seconds < 3) { }
		return (number1 + number2).ToString();
	}
}