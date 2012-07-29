using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;

public partial class Poll_aspnet_results_types : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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