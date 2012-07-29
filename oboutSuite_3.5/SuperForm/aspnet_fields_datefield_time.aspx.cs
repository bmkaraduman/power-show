using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuperForm_aspnet_fields_datefield_time : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SuperForm1_DataBound(object sender, EventArgs e)
    {
        if (SuperForm1.CurrentMode != DetailsViewMode.ReadOnly)
        {
            OboutInc.Calendar2.Calendar orderDateCal = SuperForm1.Rows[2].Cells[1].Controls[0].Controls[1].Controls[0] as OboutInc.Calendar2.Calendar;
            orderDateCal.ShowTimeSelector = true;
            orderDateCal.DateFormat = "MM/dd/yyyy hh:mm";

            OboutInc.Calendar2.Calendar shippedDateCal = SuperForm1.Rows[3].Cells[1].Controls[0].Controls[1].Controls[0] as OboutInc.Calendar2.Calendar;
            shippedDateCal.ShowTimeSelector = true;
            shippedDateCal.DateFormat = "MM/dd/yyyy hh:mm";

            OboutInc.Calendar2.Calendar requiredDateCal = SuperForm1.Rows[4].Cells[1].Controls[0].Controls[1].Controls[0] as OboutInc.Calendar2.Calendar;
            requiredDateCal.ShowTimeSelector = true;
            requiredDateCal.DateFormat = "MM/dd/yyyy hh:mm";
        }
    }
}
