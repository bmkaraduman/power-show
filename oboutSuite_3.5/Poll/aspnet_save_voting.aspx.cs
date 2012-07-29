using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;

public partial class Poll_aspnet_save_voting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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