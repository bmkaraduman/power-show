using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;
using System.Drawing;

public partial class Poll_cs_appearance_customize_styles : System.Web.UI.Page
{
     Poll Poll1 = new Poll();

    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.ID="Poll1";
        Poll1.DataSourceID="SqlDataSource1";
        Poll1.VotingMode = PollVotingMode.SingleAnswer;
        Poll1.MinAnswers = 1;
        Poll1.Title = "Favorite Movie";
        Poll1.Question = "What is your favorite movie?";
        Poll1.AllowedVotesPerUser = 100;
        phPoll1.Controls.Add(Poll1);

        Poll1.AnswerStyle.Font.Size = FontUnit.Parse(AnswersFontSize.Text);
        Poll1.AnswerStyle.Font.Bold = AnswersFontBold.Checked;
        Poll1.AnswerStyle.Font.Italic = AnswersFontItalic.Checked;
        Poll1.AnswerStyle.ForeColor = Color.FromName(AnswersForeColor.Text);

        Poll1.ResultStyle.Font.Size = FontUnit.Parse(ResultsFontSize.Text);
        Poll1.ResultStyle.Font.Bold = ResultsFontBold.Checked;
        Poll1.ResultStyle.Font.Italic = ResultsFontItalic.Checked;
        Poll1.ResultStyle.ForeColor = Color.FromName(ResultsForeColor.Text);

        Poll1.TitleStyle.Font.Size = FontUnit.Parse(TitleFontSize.Text);
        Poll1.TitleStyle.Font.Bold = TitleFontBold.Checked;
        Poll1.TitleStyle.Font.Italic = TitleFontItalic.Checked;
        Poll1.TitleStyle.ForeColor = Color.FromName(TitleForeColor.Text);

        Poll1.QuestionStyle.Font.Size = FontUnit.Parse(QuestionFontSize.Text);
        Poll1.QuestionStyle.Font.Bold = QuestionFontBold.Checked;
        Poll1.QuestionStyle.Font.Italic = QuestionFontItalic.Checked;
        Poll1.QuestionStyle.ForeColor = Color.FromName(QuestionForeColor.Text);
    }
}