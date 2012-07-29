using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;
using System.Drawing;
using Obout.Interface;

public partial class Poll_cs_validation_multiple_maxanswers : System.Web.UI.Page
{
    Poll Poll1 = new Poll();
    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.ID = "Poll1";
        Poll1.DataSourceID = "SqlDataSource1";
        Poll1.Title = "Favorite Movie";
        Poll1.Question = "What is your favorite movie?";
        Poll1.MinAnswers = 1;
        Poll1.VotingMode = PollVotingMode.MultipleAnswers;
        Poll1.AllowedVotesPerUser = 100;
        phPoll1.Controls.Add(Poll1);

        Poll1.MaxAnswers = int.Parse(OboutDropDownList1.SelectedValue);
        Poll1.AnswersRangeErrorMessage = "Please select less a maximum of " + OboutDropDownList1.SelectedValue + (OboutDropDownList1.SelectedValue == "1" ? " answer." : " answers.");
    }
}