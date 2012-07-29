using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Interface;

public partial class SuperForm_aspnet_templates_combobox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SuperForm1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        e.NewValues["ShipCountry"] = ((Obout.ComboBox.ComboBox)((DetailsViewRow)SuperForm1.Rows[4]).FindControl("ShipCountry")).SelectedValue;
    }

    protected void SuperForm1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["ShipCountry"] = ((Obout.ComboBox.ComboBox)((DetailsViewRow)SuperForm1.Rows[4]).FindControl("ShipCountry")).SelectedValue;
    }
}
