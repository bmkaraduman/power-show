public class vb_openwindow 
	Inherits OboutInc.oboutAJAXPage

	public sub ServerOpenWindow() 
		' this will open a new window at client
		OpenWindow("aspnet_SomePage.aspx", "_blank", "width=400, height=250")
	end sub
end class