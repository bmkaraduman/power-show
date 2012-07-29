using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_quickscrollcustomize : System.Web.UI.Page
{
	protected Show Show1;
	protected DropDownList ddlScrollDirection;
	
	void Page_Load(object sender, EventArgs e) {
	
		Show1.Width="345px";
		Show1.Height="153px";
		Show1.ShowType=ShowType.Show;
		Show1.TransitionType=TransitionType.QuickScroll;
	
		if (!IsPostBack)
		{
			ddlScrollDirection.SelectedIndex = 0;
			Show1.ScrollDirection = ScrollDirection.Left;
		}
	}
	
	private void ChangeScrollDirection(object sender, System.EventArgs e)
	{
		Show1.ScrollDirection = (ScrollDirection)Enum.Parse(typeof(ScrollDirection), ddlScrollDirection.SelectedValue.ToString());
	}
	
	override protected void OnInit(EventArgs e)
	{
		this.ddlScrollDirection.SelectedIndexChanged += new System.EventHandler(this.ChangeScrollDirection);
	}

}