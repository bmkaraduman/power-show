using System.Web.UI.WebControls;

public class aspnet_baseclass : aspnet_basebaseclass
{
	protected Literal literal;
	
	public void PanelUpdate() 
	{
		literal.Text = "test";
		
		UpdatePanel("callbackPanel1");
	}
}

public class aspnet_basebaseclass : OboutInc.oboutAJAXPage
{
	
}