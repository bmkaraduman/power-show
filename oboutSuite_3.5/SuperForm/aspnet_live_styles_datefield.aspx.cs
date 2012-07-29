using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class SuperForm_aspnet_live_styles_datefield : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void CalendarType_Changed(object sender, EventArgs e)
    {
        SuperForm1.DataBind();
    }

    protected void SuperForm1_DataBound(object sender, EventArgs e)
    {
        if (SuperForm1.CurrentMode == DetailsViewMode.Edit || SuperForm1.CurrentMode == DetailsViewMode.Insert)
        {
            OboutInc.Calendar2.Calendar orderDateCalendar = (OboutInc.Calendar2.Calendar)(SuperForm1.Rows[4].Cells[1].Controls[0].Controls[1].Controls[0]);
            orderDateCalendar.StyleFolder = "~/Calendar/styles/" + ListBox1.SelectedValue;            

            OboutInc.Calendar2.Calendar shippedDateCalendar = (OboutInc.Calendar2.Calendar)(SuperForm1.Rows[5].Cells[1].Controls[0].Controls[1].Controls[0]);
            shippedDateCalendar.StyleFolder = "~/Calendar/styles/" + ListBox1.SelectedValue;

            OboutInc.Calendar2.Calendar requiredDateCalendar = (OboutInc.Calendar2.Calendar)(SuperForm1.Rows[6].Cells[1].Controls[0].Controls[1].Controls[0]);
            requiredDateCalendar.StyleFolder = "~/Calendar/styles/" + ListBox1.SelectedValue;

            string datePickerImagePath = "date_picker1.gif";

            if (DatePicker2.Checked)
            {
                datePickerImagePath = "date_picker2.gif";
            }
            else if (DatePicker3.Checked)
            {
                datePickerImagePath = "icon2.gif";
            }

            orderDateCalendar.DatePickerImagePath = "~/Calendar/styles/" + datePickerImagePath;
            shippedDateCalendar.DatePickerImagePath = "~/Calendar/styles/" + datePickerImagePath;
            requiredDateCalendar.DatePickerImagePath = "~/Calendar/styles/" + datePickerImagePath;
        }
    }
}
