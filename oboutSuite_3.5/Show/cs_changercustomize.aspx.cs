using System;
using System.Web.UI.WebControls;
using OboutInc.Show;

public class cs_changercustomize : OboutInc.oboutAJAXPage
{
	protected Show Show1;
	protected DropDownList ddlType;
	protected DropDownList ddlPosition;
	protected DropDownList ddlArrowType;
	protected DropDownList ddlHorizontalAlign;
	protected DropDownList ddlVerticalAlign;
	
	void Page_Load(object sender, EventArgs e) 
	{
		
		Show1.ShowType=ShowType.Manual;
		Show1.ManualChanger=true;
		
		Show1.Changer.Type = ChangerType.Arrow;
	
		if (!IsPostBack)
		{
			Show1.Width="340px";
			Show1.Height="190px";
			
			Show1.Changer.Width=340;
			Show1.Changer.Height=20;
			Show1.Changer.Type = ChangerType.Arrow;
			Show1.Changer.ArrowType = ArrowType.BothSides;
			Show1.Changer.Position = ChangerPosition.Bottom;
			Show1.Changer.HorizontalAlign = ChangerHorizontalAlign.Center;
			
			ExecOnLoad("SetAlign('Bottom')");
		}
		else
		{
			Show1.Changer.Type = (ChangerType)Enum.Parse(typeof(ChangerType), ddlType.SelectedValue.ToString());
			Show1.Changer.Position = (ChangerPosition)Enum.Parse(typeof(ChangerPosition), ddlPosition.SelectedValue.ToString());
			Show1.Changer.ArrowType = (ArrowType)Enum.Parse(typeof(ArrowType), ddlArrowType.SelectedValue.ToString());
			
			switch(Show1.Changer.Position)
			{
				case ChangerPosition.Top:
				case ChangerPosition.Bottom:
					Show1.Changer.HorizontalAlign = (ChangerHorizontalAlign)Enum.Parse(typeof(ChangerHorizontalAlign), ddlHorizontalAlign.SelectedValue.ToString());
					Show1.Width = "340px";
					Show1.Changer.Width = 340;
					Show1.Height = "190px";
					Show1.Changer.Height = 20;
					
					ExecOnLoad("SetAlign('Bottom')");
					break;
					
				case ChangerPosition.Left:
				case ChangerPosition.Right:
					Show1.Changer.VerticalAlign = (ChangerVerticalAlign)Enum.Parse(typeof(ChangerVerticalAlign), ddlVerticalAlign.SelectedValue.ToString());
					Show1.Width = "370px";
					Show1.Changer.Width = 20;
					Show1.Height = "160px";
					Show1.Changer.Height = 160;
					
					ExecOnLoad("SetAlign('Left')");
					break;
			}
		}
	}
}