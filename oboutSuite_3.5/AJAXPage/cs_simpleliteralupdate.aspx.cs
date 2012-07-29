public class cs_simpleliteralupdate : OboutInc.oboutAJAXPage
{
	protected System.Web.UI.WebControls.Literal literal;
	
	public void PanelUpdate() 
	{
		literal.Text = "test";
		
		UpdatePanel("callbackPanel1");
	}
}