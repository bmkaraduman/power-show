using System.Web.UI.WebControls;

public class cs_masterpage : System.Web.UI.MasterPage
{
	protected Label lblText;
	
	public void DoCallback()
	{
		lblText.Text = "some text from server ... panel update ...";
		((OboutInc.oboutAJAXPage)this.Page).UpdatePanel("CallbackPanel1");
	}
}