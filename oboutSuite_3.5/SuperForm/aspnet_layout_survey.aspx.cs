using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Interface;

public partial class SuperForm_aspnet_layout_survey : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SuperForm1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        SuperForm1.Visible = false;
        Panel1.Visible = true;

        e.Cancel = true;

        Question1Answer.Text = ((OboutTextBox)((DetailsViewRow)SuperForm1.Rows[0]).FindControl("txt1")).Text;        
        Question2Answer.Text = ((OboutDropDownList)((DetailsViewRow)SuperForm1.Rows[1]).FindControl("OboutDropDownList1")).SelectedItem.Text;



        List<OboutRadioButton> question3Radios = new List<OboutRadioButton>();
        question3Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton31")));
        question3Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton32")));
        question3Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton33")));
        question3Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton34")));

        foreach (OboutRadioButton radio in question3Radios)
        {
            if (radio.Checked)
            {
                Question3Answer.Text = radio.Text;
            }
        }



        List<OboutRadioButton> question4Radios = new List<OboutRadioButton>();
        question4Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton41")));
        question4Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton42")));
        question4Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton43")));
        question4Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton44")));

        foreach (OboutRadioButton radio in question4Radios)
        {
            if (radio.Checked)
            {
                Question4Answer.Text = radio.Text;
            }
        }

        List<OboutRadioButton> question5Radios = new List<OboutRadioButton>();
        question5Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton51")));
        question5Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton52")));
        question5Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton53")));
        question5Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton54")));

        foreach (OboutRadioButton radio in question5Radios)
        {
            if (radio.Checked)
            {
                Question5Answer.Text = radio.Text;
            }
        }

        List<OboutRadioButton> question6Radios = new List<OboutRadioButton>();
        question6Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton61")));
        question6Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton62")));
        question6Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton63")));
        question6Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton64")));

        foreach (OboutRadioButton radio in question6Radios)
        {
            if (radio.Checked)
            {
                Question6Answer.Text = radio.Text;
            }
        }

        List<OboutRadioButton> question7Radios = new List<OboutRadioButton>();
        question7Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton71")));
        question7Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton72")));
        question7Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton73")));
        question7Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton74")));

        foreach (OboutRadioButton radio in question7Radios)
        {
            if (radio.Checked)
            {
                Question7Answer.Text = radio.Text;
            }
        }

        List<OboutRadioButton> question8Radios = new List<OboutRadioButton>();
        question8Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton81")));
        question8Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton82")));
        question8Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton83")));
        question8Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton84")));

        foreach (OboutRadioButton radio in question8Radios)
        {
            if (radio.Checked)
            {
                Question8Answer.Text = radio.Text;
            }
        }



        List<OboutRadioButton> question91Radios = new List<OboutRadioButton>();
        question91Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton91")));
        question91Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton92")));
        question91Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton93")));
        question91Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton94")));
        question91Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton95")));
        question91Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton96")));

        for(int i=0; i<question91Radios.Count; i++)
        {
            if (question91Radios[i].Checked)
            {
                Question91Answer.Text = (i + 1).ToString();
            }
        }

        List<OboutRadioButton> question92Radios = new List<OboutRadioButton>();
        question92Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton97")));
        question92Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton98")));
        question92Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton99")));
        question92Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton910")));
        question92Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton911")));
        question92Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton912")));

        for (int i = 0; i < question92Radios.Count; i++)
        {
            if (question92Radios[i].Checked)
            {
                Question92Answer.Text = (i + 1).ToString();
            }
        }

        List<OboutRadioButton> question93Radios = new List<OboutRadioButton>();
        question93Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton913")));
        question93Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton914")));
        question93Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton915")));
        question93Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton916")));
        question93Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton97")));
        question93Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton918")));

        for (int i = 0; i < question93Radios.Count; i++)
        {
            if (question93Radios[i].Checked)
            {
                Question93Answer.Text = (i + 1).ToString();
            }
        }

        List<OboutRadioButton> question94Radios = new List<OboutRadioButton>();
        question94Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton919")));
        question94Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton920")));
        question94Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton921")));
        question94Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton922")));
        question94Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton923")));
        question94Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton924")));

        for (int i = 0; i < question94Radios.Count; i++)
        {
            if (question94Radios[i].Checked)
            {
                Question94Answer.Text = (i + 1).ToString();
            }
        }

        List<OboutRadioButton> question95Radios = new List<OboutRadioButton>();
        question95Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton925")));
        question95Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton926")));
        question95Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton927")));
        question95Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton928")));
        question95Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton929")));
        question95Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton930")));

        for (int i = 0; i < question95Radios.Count; i++)
        {
            if (question95Radios[i].Checked)
            {
                Question95Answer.Text = (i + 1).ToString();
            }
        }

        List<OboutRadioButton> question96Radios = new List<OboutRadioButton>();
        question96Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton931")));
        question96Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton932")));
        question96Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton933")));
        question96Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton934")));
        question96Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton935")));
        question96Radios.Add(((OboutRadioButton)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("OboutRadioButton936")));

        for (int i = 0; i < question96Radios.Count; i++)
        {
            if (question96Radios[i].Checked)
            {
                Question96Answer.Text = (i + 1).ToString();
            }
        }
    }
}
