using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;

public partial class Poll_cs_populate_runtime : System.Web.UI.Page
{
    Poll Poll1 = new Poll();
    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.ID = "Poll1";
        Poll1.Title = "Favorite Programming Language";
        Poll1.Question="What is your favorite programming language?";
        Poll1.AllowedVotesPerUser = 100;

        Poll1.Items.Add(new PollItem("C#"));
        Poll1.Items.Add(new PollItem("Java"));
        Poll1.Items.Add(new PollItem("JavaScript"));
        Poll1.Items.Add(new PollItem("Perl"));
        Poll1.Items.Add(new PollItem("PHP"));
        Poll1.Items.Add(new PollItem("Ruby"));
        Poll1.Items.Add(new PollItem("VB"));
        phPoll1.Controls.Add(Poll1);
    }
}