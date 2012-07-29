using System;
using System.Web.UI.WebControls;

public class cs_callbackviewstate : OboutInc.oboutAJAXPage
{
	protected Label lblViewState;
	
	void Page_Load(object sender, EventArgs e) {
        // set the initial ViewState variable value. this is only executed on first load of page
		// when there is a postback or callback, IsPostBack is true
		if (!Page.IsPostBack)
			ViewState["something"] = 1;
	
		// if it's not a callback (aka first load or postback) write the value of the viewstate variable
		if (!IsCallback)
			if (ViewState["something"] != null)
				lblViewState.Text = "ViewState value = " + ViewState["something"].ToString();
    }
	
	public string tempFunction() {
		// increase the value of the viewstate variable
		int count = (int)ViewState["something"];
		count++;
		ViewState["something"] = count;
		return ViewState["something"].ToString();
	}
}