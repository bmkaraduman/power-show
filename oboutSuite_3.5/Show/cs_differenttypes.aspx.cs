using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_differenttypes : System.Web.UI.Page
{
	protected Show Show1;
	protected DropDownList ddlChangerType;
	
	void Page_Load(object sender, EventArgs e) 
	{
		
		Show1.Width="320px";
		Show1.Height="190px";
		Show1.ShowType=ShowType.Manual;
		Show1.ManualChanger=true;
		Show1.StyleFolder = "styles/style5";
		
		Show1.Changer.Width=350;
		Show1.Changer.Height=30;
		Show1.Changer.Type=ChangerType.Arrow;
		
		if (!IsPostBack)
		{
			Show1.Changer.Type = ChangerType.Arrow;
		}
	}
	
	private void ChangeChangerType(object sender, System.EventArgs e)
	{
		Show1.Changer.Type = (ChangerType)Enum.Parse(typeof(ChangerType), ddlChangerType.SelectedValue.ToString());
	}
	
	override protected void OnInit(EventArgs e)
	{
		this.ddlChangerType.SelectedIndexChanged += new System.EventHandler(this.ChangeChangerType);
	}
}