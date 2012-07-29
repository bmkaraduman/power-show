using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;

public partial class Poll_cs_security_cookies : System.Web.UI.Page
{
    Poll Poll1 = new Poll();
    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.ID = "Poll1";
        Poll1.DataSourceID = "SqlDataSource1";       
        Poll1.Title = "Favorite Sport";
        Poll1.Question = "What is your favorite sport?";
        Poll1.CssClass = "ob_pMCont";
        Poll1.CurrentMode = PollMode.Answers;
        Poll1.DataTextField = "AnswerText" ;
        Poll1.DataValueField = "AnswerID";
        Poll1.DataVotesField = "Votes";
        Poll1.StyleFile = "";
        Poll1.VotingMode = PollVotingMode.SingleAnswer;
        Poll1.Width = 300;
        phPoll1.Controls.Add(Poll1);
    }
}