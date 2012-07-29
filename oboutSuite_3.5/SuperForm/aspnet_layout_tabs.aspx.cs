using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuperForm_aspnet_layout_tabs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SuperForm1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        e.NewValues["Notes"] = ((Obout.Ajax.UI.HTMLEditor.Editor)((DetailsViewRow)SuperForm1.Rows[14]).FindControl("Editor1")).Content;
    }

    protected void SuperForm1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["Notes"] = ((Obout.Ajax.UI.HTMLEditor.Editor)((DetailsViewRow)SuperForm1.Rows[14]).FindControl("Editor1")).Content;
    }
}
