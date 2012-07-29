using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Interface;
using Obout.ComboBox;

public partial class SuperForm_aspnet_templates_combobox_cascading : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SuperForm1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        e.NewValues["ShipCountry"] = ((Obout.ComboBox.ComboBox)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("ShipCountry")).SelectedValue;
        e.NewValues["ShipCity"] = ((Obout.ComboBox.ComboBox)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("ShipCity")).SelectedValue;
    }

    protected void SuperForm1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["ShipCountry"] = ((Obout.ComboBox.ComboBox)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("ShipCountry")).SelectedValue;
        e.Values["ShipCity"] = ((Obout.ComboBox.ComboBox)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("ShipCity")).SelectedValue;
    }

    protected void ShipCountry_SelectedIndexChanged(object sender, ComboBoxItemEventArgs e)
    {
        SqlDataSource3.SelectParameters[0].DefaultValue = e.Item.Value;
    }

    protected void SuperForm1_DataBound(object sender, EventArgs e)
    {
        if (SuperForm1.CurrentMode == DetailsViewMode.Edit)
        {
            SqlDataSource3.SelectParameters[0].DefaultValue = DataBinder.Eval(SuperForm1.DataItem, "ShipCountry").ToString();
            ((Obout.ComboBox.ComboBox)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("ShipCity")).SelectedValue = DataBinder.Eval(SuperForm1.DataItem, "ShipCity").ToString();
        }
        else
        {
            SqlDataSource3.SelectParameters[0].DefaultValue = "";
        }
    }
}
