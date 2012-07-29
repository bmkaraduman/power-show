using System.Web.UI.WebControls;

public class cs_baseclass : cs_basebaseclass
{
	protected Literal literal;
	
	public void PanelUpdate() 
	{
		literal.Text = "test";
		
		UpdatePanel("callbackPanel1");
	}
}

public class cs_basebaseclass : OboutInc.oboutAJAXPage
{
	
}