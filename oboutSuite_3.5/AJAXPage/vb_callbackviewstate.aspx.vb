imports System
imports System.Web.UI.WebControls

public class vb_callbackviewstate 
	inherits OboutInc.oboutAJAXPage

	protected lblViewState as Label
	
	sub Page_Load(byval sender as object , byval e as EventArgs) 
        ' set the initial ViewState variable value. this is only executed on first load of page
		' when there is a postback or callback, IsPostBack is true
		if not Page.IsPostBack
			ViewState("something") = 1
		end if
	
		' if it's not a callback (aka first load or postback) write the value of the viewstate variable
		if not IsCallback
			if not ViewState("something") is nothing
				lblViewState.Text = "ViewState value = " + ViewState("something").ToString()
			end if
		end if
    end sub
	
	public function tempFunction() as string
		' increase the value of the viewstate variable
		dim count as int32 = ViewState("something")
		count = count + 1
		ViewState("something") = count
		return ViewState("something").ToString()
	end function
end class