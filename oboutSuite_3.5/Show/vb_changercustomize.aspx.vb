imports OboutInc.Show

public class vb_changercustomize
	inherits OboutInc.oboutAJAXPage
	
	Protected Dim Show1 as Show
	Protected Dim ddlType as DropDownList
	Protected Dim ddlPosition as DropDownList
	Protected Dim ddlArrowType as DropDownList
	Protected Dim ddlHorizontalAlign as DropDownList
	Protected Dim ddlVerticalAlign as DropDownList
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.ShowType=ShowType.Manual
		Show1.ManualChanger=true
		
		Show1.Changer.Type = ChangerType.Arrow
	
		if not IsPostBack
		
			Show1.Width=340
			Show1.Height=190
			
			Show1.Changer.Width=340
			Show1.Changer.Height=20
			Show1.Changer.Type = ChangerType.Arrow
			Show1.Changer.ArrowType = ArrowType.BothSides
			Show1.Changer.Position = ChangerPosition.Bottom
			Show1.Changer.HorizontalAlign = ChangerHorizontalAlign.Center
			
			ExecOnLoad("SetAlign('Bottom')")
		
		else
		
			Show1.Changer.Type = System.Enum.Parse(GetType(ChangerType), ddlType.SelectedValue)
			Show1.Changer.Position = System.Enum.Parse(GetType(ChangerPosition), ddlPosition.SelectedValue)
			Show1.Changer.ArrowType = System.Enum.Parse(GetType(ArrowType), ddlArrowType.SelectedValue)
			
			select case Show1.Changer.Position
			
				case ChangerPosition.Top, ChangerPosition.Bottom
					Show1.Changer.HorizontalAlign = System.Enum.Parse(GetType(ChangerHorizontalAlign), ddlHorizontalAlign.SelectedValue)
					Show1.Width = 340
					Show1.Changer.Width = 340
					Show1.Height = 190
					Show1.Changer.Height = 20
					
					ExecOnLoad("SetAlign('Bottom')")
					
				case ChangerPosition.Left, ChangerPosition.Right
					Show1.Changer.VerticalAlign = System.Enum.Parse(GetType(ChangerVerticalAlign), ddlVerticalAlign.SelectedValue)
					Show1.Width = 370
					Show1.Changer.Width = 20
					Show1.Height = 160
					Show1.Changer.Height = 160
					
					ExecOnLoad("SetAlign('Left')")
					
			End Select
		End If
	End Sub
	
end class