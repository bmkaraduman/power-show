using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Interface;

public partial class SuperForm_aspnet_validation_dropdownlistfield : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SuperForm1_DataBound(object sender, EventArgs e)
    {
        if (SuperForm1.CurrentMode != DetailsViewMode.ReadOnly)
        {
            OboutDropDownList customerIDDdl = SuperForm1.GetFieldControl(1) as OboutDropDownList;
            customerIDDdl.Items.Insert(0, new ListItem("Select a customer ..."));
            
            OboutDropDownList shipCountryDdl = SuperForm1.GetFieldControl(2) as OboutDropDownList;
            shipCountryDdl.Items.Insert(0, new ListItem("Select a country ..."));
        }
    }
}
