using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;
using Obout.Interface;

public partial class Poll_cs_results_fill_with_space : System.Web.UI.Page
{
    Poll Poll1 = new Poll();
    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.ID = "Poll1";
        Poll1.DataSourceID = "SqlDataSource1";
        Poll1.VotingMode = PollVotingMode.SingleAnswer;
        Poll1.CurrentMode = PollMode.Results;
        Poll1.MaxAnswers = 4;
        Poll1.Title = "Favorite Movie";
        Poll1.Question = "What is your favorite movie?";
        Poll1.AllowedVotesPerUser = 100;
        Poll1.ResultStyle.DisplayVotes = true;
        phPoll1.Controls.Add(Poll1);

        Poll1.ResultStyle.FillWithEmptySpace = OboutCheckBox1.Checked;
    }
}