using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;

public partial class Poll_cs_save_voting : System.Web.UI.Page
{
    Poll Poll1 = new Poll();
    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.ID = "Poll1";
        Poll1.DataSourceID = "SqlDataSource1";
        Poll1.Title = "Favorite Movie";
        Poll1.Question = "What is your favorite movie?";
        Poll1.AllowedVotesPerUser = 100;
        Poll1.Voting += Poll1_Voting;

        phPoll1.Controls.Add(Poll1);
    }
    protected void Poll1_Voting(object sender, PollItemEventArgs e)
    {
        OleDbConnection conn = new OleDbConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PollConnectionString"].ConnectionString);

        conn.Open();

        foreach (PollAnswer answer in Poll1.Answers)
        {
            if (answer.Selected)
            {
                string logVoteQuery = "UPDATE Answers SET Votes = Votes + 1 WHERE AnswerID = @AnswerID";
                OleDbCommand logVoteCommand = new OleDbCommand(logVoteQuery, conn);
                logVoteCommand.Parameters.AddWithValue("@AnswerID", answer.Item.Value);

                logVoteCommand.ExecuteNonQuery();

                break;
            }
        }

        conn.Close();
    }
}