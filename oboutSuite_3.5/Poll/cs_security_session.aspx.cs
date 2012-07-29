using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;

public partial class Poll_cs_security_session : System.Web.UI.Page
{
    Poll Poll1 = new Poll();
    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.ID = "Poll1";
        Poll1.DataSourceID = "SqlDataSource1";       
        Poll1.Title = "Favorite Sport";
        Poll1.Question = "What is your favorite sport?";
        Poll1.AllowedVotesPerUser = 1;
        Poll1.SecurityMethod = PollSecurityMethod.Session;
        phPoll1.Controls.Add(Poll1);      
    }

}