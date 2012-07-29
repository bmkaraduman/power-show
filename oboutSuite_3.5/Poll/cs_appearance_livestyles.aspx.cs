using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Obout.Ajax.UI.Poll;
using Obout.ListBox;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Poll_cs_appearance_livestyles : System.Web.UI.Page
{
    Poll Poll1 = new Poll();
    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.ID="Poll1";
        Poll1.DataSourceID = "SqlDataSource1";
        Poll1.VotingMode = PollVotingMode.SingleAnswer;
        Poll1.MinAnswers = 1;
        Poll1.Title = "Favorite Movie";
        Poll1.Question = "What is your favorite movie?";
        Poll1.AllowedVotesPerUser = 100;
        phPoll1.Controls.Add(Poll1);

        if (IsPostBack)
        {
            Poll1.StyleFile = "~/App_Obout/Poll/styles/" + ListBox1.SelectedValue + "/style.css";
        }
    }

    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {        
        Poll1.InterfaceStyleFolder = "~/Interface/styles/" + ListBox1.SelectedValue;
    }
}