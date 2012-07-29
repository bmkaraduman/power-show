using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.Poll;
using System.Data.OleDb;
using System.Drawing;
using Obout.Interface;

public partial class Poll_cs_templates_items : System.Web.UI.Page
{
    Poll Poll1 = new Poll();
    protected void Page_Load(object sender, EventArgs e)
    {
        Poll1.ID = "Poll1";
        Poll1.DataSourceID = "SqlDataSource1";       
        Poll1.VotingMode = PollVotingMode.SingleAnswer;
        Poll1.MinAnswers = 1;
        Poll1.Title = "Favorite Movie";
        Poll1.Question = "What is your favorite movie?";
        Poll1.AllowedVotesPerUser = 100;
        Poll1.ResultStyle.DisplayVotes = true;
        Poll1.GetSelectedItem += Poll1_GetSelectedItem;
        Poll1.SetSelectedItem += Poll1_SetSelectedItem;  
        
        Poll1.AnswerTemplate = new AnswerTemplate(IsPostBack);

        phPoll1.Controls.Add(Poll1);
    }

    public class AnswerTemplate : ITemplate
    {
        private bool isPostBack;

        public AnswerTemplate(bool _isPostBack)
        {
            isPostBack = _isPostBack;
        }
        
        public void InstantiateIn(Control container)
        {
            PlaceHolder templatePlaceHolder = new PlaceHolder();
            container.Controls.Add(templatePlaceHolder);
            
            templatePlaceHolder.DataBinding += new EventHandler(DataBindTemplate);
        }

        public void DataBindTemplate(object sender, EventArgs e)
        {
            PlaceHolder templatePlaceHolder = sender as PlaceHolder;
            PollAnswerTemplateContainer container = templatePlaceHolder.NamingContainer as PollAnswerTemplateContainer;
            PollAnswer item = (PollAnswer)container.Parent;            

            Literal image = new Literal();

            image.Text = "<img src=\"resources/images/" + container.Item.Text.ToString() + ".jpg\" + alt=''" + "height='80' />";

            Obout.Interface.OboutRadioButton OboutRadioButton1 = new Obout.Interface.OboutRadioButton();

            OboutRadioButton1.ID = "OboutRadioButton1";
            OboutRadioButton1.Text = container.Item.Text.ToString();
            OboutRadioButton1.GroupName = "PollItem";

            templatePlaceHolder.Controls.Add(image);
            templatePlaceHolder.Controls.Add(OboutRadioButton1);
        }
    }
    protected void Poll1_GetSelectedItem(object sender, PollAnswerEventArgs e)
    {
        OboutRadioButton OboutRadioButton1 = e.Answer.FindControl("OboutRadioButton1") as OboutRadioButton;        
        e.Answer.Item.Selected = OboutRadioButton1.Checked;
    }

    protected void Poll1_SetSelectedItem(object sender, PollAnswerEventArgs e)
    {
        OboutRadioButton OboutRadioButton1 = e.Answer.FindControl("OboutRadioButton1") as OboutRadioButton;
        OboutRadioButton1.Checked = e.Answer.Item.Selected;
    }
}