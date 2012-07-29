using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;

public partial class Poll_cs_validation_message : System.Web.UI.Page
{
    Poll Poll1 = new Poll();
    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.ID = "Poll1";
        Poll1.DataSourceID = "SqlDataSource1";
        Poll1.VotingMode = PollVotingMode.MultipleAnswers;
        Poll1.MinAnswers = 2;
        Poll1.MaxAnswers = 4;
        Poll1.AnswersRangeErrorMessage="Please select between 2 and 4 answers.";
        Poll1.SecurityErrorMessage = "You already voted on this poll.";
        Poll1.Title = "Favorite Movie";
        Poll1.Question = "What is your favorite movie?";
        Poll1.AllowedVotesPerUser = 100;
        phPoll1.Controls.Add(Poll1);
    }
}