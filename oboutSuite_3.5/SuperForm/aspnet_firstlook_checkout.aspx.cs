using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;
using Obout.Interface;

public partial class SuperForm_aspnet_firstlook_checkout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void SuperForm1_Inserting(object sender, DetailsViewInsertEventArgs e)
    {
        SuperForm1.Visible = false;
        MessagePanel.Visible = true;
    }

    protected void SuperForm1_DataBound(object sender, EventArgs e)
    {
        OboutDropDownList yearDdl = SuperForm1.GetFieldControl(1) as OboutDropDownList;
        yearDdl.MenuWidth = Unit.Pixel(90);

        yearDdl.Items.Add(new ListItem(""));
        for (int i = 2010; i < 2025; i++)
        {
            yearDdl.Items.Add(new ListItem(i.ToString()));            
        }

        OboutDropDownList monthDdl = SuperForm1.GetFieldControl(2) as OboutDropDownList;

        monthDdl.Items.Add(new ListItem(""));
        monthDdl.Items.Add(new ListItem("January"));
        monthDdl.Items.Add(new ListItem("February"));
        monthDdl.Items.Add(new ListItem("March"));
        monthDdl.Items.Add(new ListItem("April"));
        monthDdl.Items.Add(new ListItem("May"));
        monthDdl.Items.Add(new ListItem("June"));
        monthDdl.Items.Add(new ListItem("July"));
        monthDdl.Items.Add(new ListItem("August"));
        monthDdl.Items.Add(new ListItem("September"));
        monthDdl.Items.Add(new ListItem("October"));
        monthDdl.Items.Add(new ListItem("November"));
        monthDdl.Items.Add(new ListItem("December"));
    }
}