using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_scrollingcustomize : System.Web.UI.Page
{
	protected Show Show1;
	protected DropDownList ddlScrollDirection;
	
	void Page_Load(object sender, EventArgs e) 
	{
	
		Show1.Width="370px";
		Show1.Height="155px";
		Show1.ShowType=ShowType.Show;
		Show1.TransitionType=TransitionType.Scrolling;
		Show1.ScrollingSpeed=1000;
		Show1.ScrollingStep=5;
		
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