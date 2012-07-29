using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Interface;
using System.Data.OleDb;
using Obout.ListBox;

public partial class SuperForm_aspnet_templates_radiobuttonlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void SuperForm1_DataBound(object sender, EventArgs e)
    {
        if (SuperForm1.CurrentMode == DetailsViewMode.Edit)
        {
            string country = DataBinder.Eval(SuperForm1.DataItem, "Country").ToString();

            RadioButtonList Country = (RadioButtonList)((DetailsViewRow)SuperForm1.Rows[3]).FindControl("Country");

            foreach (ListItem item in Country.Items)
            {
                if (item.Text == country)
                {
                    item.Selected = true;
                    break;
                }
            }
        }
    }

    protected void SuperForm1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        e.NewValues["Country"] = GetSelectedCountries();
    }

    protected void SuperForm1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["Country"] = GetSelectedCountries();
    }

    protected string GetSelectedCountries()
    {
        RadioButtonList Country = (RadioButtonList)((DetailsViewRow)SuperForm1.Rows[3]).FindControl("Country");

        foreach (ListItem item in Country.Items)
        {
            if (item.Selected == true)
            {
                return item.Text;
            }
        }

        return "";
    }
}
