using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuperForm_aspnet_layout_width : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ConfigureWidths();
        }
    }

    protected void Width_SelectedIndexChanged(object sender, EventArgs e)
    {
        ConfigureWidths();

        SuperForm1.DataBind();
    }

    protected void ConfigureWidths()
    {
        SuperForm1.Width = Unit.Parse(FormWidth.SelectedValue);

        foreach (DataControlField field in SuperForm1.Fields)
        {
            field.HeaderStyle.Width = Unit.Percentage(100 - int.Parse(ItemWidth.SelectedValue.Replace("%", "")));
            field.ItemStyle.Width = Unit.Parse(ItemWidth.SelectedValue);
            if (ControlWidth.SelectedValue != "auto")
            {
                field.ControlStyle.Width = Unit.Parse(ControlWidth.SelectedValue);
            }
        }
    }
}
