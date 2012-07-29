using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Interface;
using Obout.ComboBox;

public partial class SuperForm_aspnet_templates_combobox_ondemand : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ShipCountry_LoadingItems(object sender, ComboBoxLoadingItemsEventArgs e)
    {
        (sender as ComboBox).Items.Clear();
        SqlDataSource2.SelectParameters[0].DefaultValue = e.Text + "%";
        (sender as ComboBox).DataSourceID = "SqlDataSource2";
    }

    protected void SuperForm1_DataBound(object sender, EventArgs e)
    {
        if (SuperForm1.CurrentMode == DetailsViewMode.Edit)
        {
            string selectedCountry = DataBinder.Eval(SuperForm1.DataItem, "ShipCountry").ToString();
            ComboBox ShipCountryComboBox = (ComboBox)((DetailsViewRow)SuperForm1.Rows[4]).FindControl("ShipCountry");
            
            // Creating an new item using the selected country and marking it as selected
            ComboBoxItem item = new ComboBoxItem();
            item.Value = selectedCountry;
            item.Text = selectedCountry;
            item.Selected = true;
            ShipCountryComboBox.Items.Add(item);
            
            ShipCountryComboBox.DataBind();
        }
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
