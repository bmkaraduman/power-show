using System;

public class cs_createtimer2 : OboutInc.oboutAJAXPage
{
	public void ServerCreateTimer () {
		if (Session["nrCallback"] != null)
			Session["nrCallback"] = 0;
			
		CreateTimer("MyTimer", "myServerMethod", "myClientFunction", 2000);
	}
	
	public void ServerCancelTimer () {
		if (Session["nrCallback"] != null)
			Session["nrCallback"] = 0;
			
		CancelTimer("MyTimer");
	}
	
	public string myServerMethod() {
		if (Session["nrCallback"] == null)
			Session["nrCallback"] = 0;
			
		Session["nrCallback"] = Int32.Parse(Session["nrCallback"].ToString()) + 1;
		
		return Session["nrCallback"].ToString();
	}
}