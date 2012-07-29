using System;
using System.Diagnostics;

public class cs_CPUMonitorStyle1 : OboutInc.oboutAJAXPage
{
	
	void Page_Load(object o, EventArgs e) 
	{
		CreateTimer ("updateCount", "computeCount", "getResult", 1000);
	}
	
	public float computeCount() {
		Random rnd = new Random();
		float val = rnd.Next(4);
		if(val == 2) // insert a random spike
			return rnd.Next(40);
		return rnd.Next(10);
	}
}