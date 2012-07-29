using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;
using Obout.Interface;

public partial class Poll_aspnet_templates_items : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Poll1_GetSelectedItem(object sender, PollAnswerEventArgs e)
    {
        OboutRadioButton OboutRadioButton1 = e.Answer.FindControl("OboutRadioButton1") as OboutRadioButton;        
        e.Answer.Item.Selected = OboutRadioButton1.Checked;
    }

    protected void Poll1_SetSelectedItem(object sender, PollAnswerEventArgs e)
    {
        OboutRadioButton OboutRadioButton1 = e.Answer.FindControl("OboutRadioButton1") as OboutRadioButton;
        OboutRadioButton1.Checked = e.Answer.Item.Selected;
    }
}