using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_style_gallery : System.Web.UI.Page
{
	private string StyleFolder = "styles/";
	protected Show Show1;
	protected ListBox lbLiveStyles;
	
	void Page_Load(object sender, EventArgs e) {
	
		Show1.Width="370px";
		Show1.Height="195px";
		Show1.ShowType=ShowType.Manual;
		Show1.ManualChanger=true;
		Show1.Changer.Width=370;
		Show1.Changer.Height=30;
		Show1.Changer.Type=ChangerType.Both;
		Show1.Changer.HorizontalAlign=ChangerHorizontalAlign.Center;

		if (!IsPostBack)
			Show1.StyleFolder = "";
	}
	
	private void ChangeStyle(object sender, System.EventArgs e)
	{
		if (lbLiveStyles.SelectedValue.ToString() == "Default")
			Show1.StyleFolder = "";
		else
			Show1.StyleFolder = StyleFolder + lbLiveStyles.SelectedValue.ToString();
	}
	
	override protected void OnInit(EventArgs e)
	{
		this.lbLiveStyles.SelectedIndexChanged += new System.EventHandler(this.ChangeStyle);
	}
}