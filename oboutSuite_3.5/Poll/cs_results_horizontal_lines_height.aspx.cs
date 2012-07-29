using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;
using Obout.Interface;

public partial class Poll_cs_results_horizontal_lines_height : System.Web.UI.Page
{
    Poll Poll1 = new Poll();
    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.ID = "Poll1";
        Poll1.DataSourceID = "SqlDataSource1";
        Poll1.VotingMode = PollVotingMode.SingleAnswer;
        Poll1.CurrentMode = PollMode.Results;
        Poll1.Title = "Favorite Movie";
        Poll1.Question = "What is your favorite movie?";
        Poll1.AllowedVotesPerUser = 100;
        Poll1.StyleFile="~/App_Obout/Poll/styles/grand_gray/style.css";
        Poll1.InterfaceStyleFolder="~/Interface/styles/grand_gray/OboutDropDownList";
        phPoll1.Controls.Add(Poll1);

        Poll1.ResultStyle.HorizontalLinesHeight = Unit.Parse(OboutDropDownList1.SelectedValue);
    }
}