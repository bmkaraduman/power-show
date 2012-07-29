public class cs_createtimer1 : OboutInc.oboutAJAXPage
{
	public void ServerCreateTimer () {
		CreateTimer("MyTimer", "fillDiv('myDIV')", 3000); 
	}
	
	public void ServerCancelTimer () {
		CancelTimer("MyTimer");
	}
}