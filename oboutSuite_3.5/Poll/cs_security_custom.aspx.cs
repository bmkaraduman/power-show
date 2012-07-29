using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;

public partial class Poll_cs_security_custom : System.Web.UI.Page
{
    private Guid UserID = new Guid("12345678-1234-1234-1234-123456789012");
    
    Poll Poll1 = new Poll();
    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.ID = "Poll1";
        Poll1.DataSourceID = "SqlDataSource1";       
        Poll1.Title = "Favorite Sport";
        Poll1.Question = "What is your favorite sport?";
        Poll1.AllowedVotesPerUser = 1;
        Poll1.SecurityMethod = PollSecurityMethod.Custom;
        Poll1.Voted += Poll1_Voted;
        Poll1.SecurityChecking += Poll1_SecurityChecking;
        phPoll1.Controls.Add(Poll1);      
    }

    protected void Poll1_Voted(object sender, PollItemEventArgs e)
    {
        OleDbConnection conn = new OleDbConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PollConnectionString"].ConnectionString);

        conn.Open();
       
        string logVoteQuery = "INSERT INTO UserVotes(AnswerID, UserID) VALUES(@AnswerID, @UserID)";
        OleDbCommand logVoteCommand = new OleDbCommand(logVoteQuery, conn);
        logVoteCommand.Parameters.AddWithValue("@AnswerID", e.Item.Value);
        logVoteCommand.Parameters.AddWithValue("@UserID", UserID.ToString());

        logVoteCommand.ExecuteNonQuery();
          
        conn.Close();
    }

    protected void Poll1_SecurityChecking(object sender, PollSecurityCheckingEventArgs e)
    {
        OleDbConnection conn = new OleDbConnection(System.Configuration.ConfigurationManager.ConnectionStrings["PollConnectionString"].ConnectionString);

        conn.Open();

        string checkVotingAllowedQuery = "SELECT COUNT(*) FROM UserVotes UV";
        checkVotingAllowedQuery += " INNER JOIN Answers A ON UV.AnswerID = A.AnswerID WHERE UV.UserID = @UserID AND A.PollID = 3";

        OleDbCommand checkVotingAllowedCommand = new OleDbCommand(checkVotingAllowedQuery, conn);
        checkVotingAllowedCommand.Parameters.AddWithValue("@UserID", UserID.ToString());

        object numberOfVotes = checkVotingAllowedCommand.ExecuteScalar();

        conn.Close();

        if (int.Parse(numberOfVotes.ToString()) >= Poll1.AllowedVotesPerUser)
        {
            e.AllowVoting = false;
        }
        else
        {
            e.AllowVoting = true;
        }        
    }
}