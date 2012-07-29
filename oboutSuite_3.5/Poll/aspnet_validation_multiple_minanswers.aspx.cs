using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;

public partial class Poll_aspnet_validation_multiple_minanswers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.MinAnswers = int.Parse(OboutDropDownList1.SelectedValue);
        Poll1.AnswersRangeErrorMessage = "Please select at least " + OboutDropDownList1.SelectedValue + (OboutDropDownList1.SelectedValue == "1" ? " answer." : " answers.");
    }
}