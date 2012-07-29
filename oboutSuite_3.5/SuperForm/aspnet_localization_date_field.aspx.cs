using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuperForm_aspnet_localization_date_field : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (SuperForm1.CurrentMode == DetailsViewMode.Edit || SuperForm1.CurrentMode == DetailsViewMode.Insert)
        {
            OboutInc.Calendar2.Calendar orderDateCalendar = (OboutInc.Calendar2.Calendar)(SuperForm1.Rows[2].Cells[1].Controls[0].Controls[1].Controls[0]);
            orderDateCalendar.CultureName = ListBox1.SelectedValue;

            OboutInc.Calendar2.Calendar shippedDateCalendar = (OboutInc.Calendar2.Calendar)(SuperForm1.Rows[3].Cells[1].Controls[0].Controls[1].Controls[0]);
            shippedDateCalendar.CultureName = ListBox1.SelectedValue;

            OboutInc.Calendar2.Calendar requiredDateCalendar = (OboutInc.Calendar2.Calendar)(SuperForm1.Rows[4].Cells[1].Controls[0].Controls[1].Controls[0]);
            requiredDateCalendar.CultureName = ListBox1.SelectedValue;
        }
    }
}
