using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;

public partial class Poll_cs_populate_manual : System.Web.UI.Page
{
    Poll Poll1 = new Poll();
    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.ID = "Poll1";
        Poll1.VotingMode = PollVotingMode.SingleAnswer;
        Poll1.MinAnswers = 1;
        Poll1.Title="Favorite Programming Language";
        Poll1.Question = "What is your favorite programming language?";
        Poll1.AllowedVotesPerUser = 100;

        PollItem item1 = new PollItem();
        item1.Text = "C#";
        Poll1.Items.Add(item1);

        PollItem item2 = new PollItem();
        item2.Text = "JavaScript";
        Poll1.Items.Add(item2);

        PollItem item3 = new PollItem();
        item3.Text = "Perl";
        Poll1.Items.Add(item3);

        PollItem item4 = new PollItem();
        item4.Text = "PHP";
        Poll1.Items.Add(item4);

        PollItem item5 = new PollItem();
        item5.Text = "Ruby";
        Poll1.Items.Add(item5);
       
        PollItem item6 = new PollItem();
        item6.Text = "VB";
        Poll1.Items.Add(item6);

        phPoll1.Controls.Add(Poll1);
    }
}