using System;

public class cs_clientevents : OboutInc.oboutAJAXPage
{
	void Page_Load(object sender, EventArgs e) {
		RequestTimeoutMilliseconds = 4000;
    }
	
	public void MyServerMethod(bool withTimeout) {
		if (withTimeout)
			System.Threading.Thread.Sleep(5000);
	}
}