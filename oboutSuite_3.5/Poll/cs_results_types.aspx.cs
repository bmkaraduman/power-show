using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;
using Obout.Interface;

public partial class Poll_cs_results_types : System.Web.UI.Page
{
    Poll Poll1 = new Poll();
    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.ID = "Poll1";
        Poll1.DataSourceID = "SqlDataSource1";
        Poll1.VotingMode = PollVotingMode.SingleAnswer;
        Poll1.CurrentMode = PollMode.Results;
        Poll1.VotingMode = PollVotingMode.SingleAnswer;
        Poll1.Title = "Favorite Movie";
        Poll1.Question = "What is your favorite movie?";
        Poll1.AllowedVotesPerUser = 100;
        Poll1.ResultStyle.DisplayVotes = true;

        phPoll1.Controls.Add(Poll1);

        if (ChartTypeHorizontalLines.Checked)
        {
            Poll1.ResultStyle.ResultType = PollResultType.HorizontalLines;
        }
        else if (ChartTypeTextOnly.Checked)
        {
            Poll1.ResultStyle.ResultType = PollResultType.TextOnly;
        }
        else if (ChartTypePieChart3D.Checked)
        {
            Poll1.ResultStyle.ResultType = PollResultType.PieChart3D;
        }
        else if (ChartTypePieChart.Checked)
        {
            Poll1.ResultStyle.ResultType = PollResultType.PieChart;
        }
        else if (ChartTypePyramidChart3DWithPointGaps.Checked)
        {
            Poll1.ResultStyle.ResultType = PollResultType.PyramidChart3DWithPointGaps;
        }
        else if (ChartTypePyramidChartWithPointGaps.Checked)
        {
            Poll1.ResultStyle.ResultType = PollResultType.PyramidChartWithPointGaps;
        }
        else if (ChartTypeFunnelChart3DWithPointGaps.Checked)
        {
            Poll1.ResultStyle.ResultType = PollResultType.FunnelChart3DWithPointGaps;
        }
        else if (ChartTypeFunnelChartWithPointGaps.Checked)
        {
            Poll1.ResultStyle.ResultType = PollResultType.FunnelChartWithPointGaps;
        }
    }
}