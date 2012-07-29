public class cs_openwindow : OboutInc.oboutAJAXPage
{
	public void ServerOpenWindow() {
		// this will open a new window at client
		OpenWindow("aspnet_SomePage.aspx", "_blank", "width=400, height=250");
	}
}