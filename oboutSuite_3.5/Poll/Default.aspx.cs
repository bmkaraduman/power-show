using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Collections;
using System.Text;

public partial class Poll_Default : OboutInc.oboutAJAXPage
{
    protected Dictionary<string, int> mainCategories;

    protected void Page_Load(object sender, EventArgs e)
    {              
        CreateDictionaries();
        BuildCategoriesTree();
        //DisplayPathToExamples();        

        if(Session["PollSamples_CategoryName"] != null)
        {
            string type = "aspnet_";
            
            if (Session["PollSamples_Type"] != null)
            {
                type = Session["PollSamples_Type"].ToString();

                RbtnAspNet.Checked = type == "aspnet_";
                RbtnCSharp.Checked = type == "cs_";
                RbtnVbNet.Checked = type == "vb_";
            }
            
            ClientScript.RegisterStartupScript(typeof(Page), "LoadSamples", "loadInitialSamples('" + type + "', '" + Session["PollSamples_CategoryName"].ToString() + "')", true);
        }
    }

    protected void CreateDictionaries()
    {
        mainCategories = new Dictionary<string, int>();

        mainCategories.Add("Appearance", 2);
        mainCategories.Add("Voting", 2);
        mainCategories.Add("Populate with items", 3);
        mainCategories.Add("Saving Votes", 3);
        mainCategories.Add("Displaying Results", 7);
        mainCategories.Add("Validation", 4);
        mainCategories.Add("Security", 3);
        mainCategories.Add("Templates", 1);
       
    }    

    protected void BuildCategoriesTree()
    {
        StringBuilder mainCategoriesText = new StringBuilder();
        foreach (KeyValuePair<string, int> category in mainCategories)
        {
            mainCategoriesText.Append("<a class=\"header\" href=\"javascript: loadSamples('" + category.Key + "');\">" + category.Key + "</a> - <span class=\"headerNumber\">" + category.Value.ToString() + "</span> <br /><br />");
        }
        MainCategories.Text = mainCategoriesText.ToString();
    }

    public string LoadSamples(string categoryName, string type)
    {
        Session["PollSamples_CategoryName"] = categoryName;
        Session["PollSamples_Type"] = type;
        
        List<Dictionary<string, string>> samples = new List<Dictionary<string, string>>();

        switch (categoryName)
        {
            case "Appearance":
                samples.Add(PrepareSample("Live Styles", "appearance_livestyles.aspx"));
                samples.Add(PrepareSample("Customize Styles", "appearance_customizestyles.aspx"));
                break;

            case "Voting":
                samples.Add(PrepareSample("Single Answer", "voting_singleanswer.aspx"));
                samples.Add(PrepareSample("Multiple Answers", "voting_multipleanswers.aspx"));
                break;

            case "Populate with items":
                samples.Add(PrepareSample("Manual", "populate_manual.aspx"));
                samples.Add(PrepareSample("At Runtime", "populate_runtime.aspx"));
                samples.Add(PrepareSample("SqlDataSource", "populate_sds.aspx"));
                break;

            case "Saving Votes":
                samples.Add(PrepareSample("SqlDataSource", "save_sqldatasource.aspx"));
                samples.Add(PrepareSample("Voting Event", "save_voting.aspx"));
                samples.Add(PrepareSample("Application State", "save_application_state.aspx"));
                break;

            case "Displaying Results":
                samples.Add(PrepareSample("Result Types", "results_types.aspx"));
                samples.Add(PrepareSample("Current Mode", "results_currentmode.aspx"));
                samples.Add(PrepareSample("Display Percentages", "results_percentages.aspx"));
                samples.Add(PrepareSample("Display Vote Count", "results_vote_count.aspx"));
                samples.Add(PrepareSample("Fill With Empty Space", "results_fill_with_space.aspx"));
                samples.Add(PrepareSample("Text Align", "results_text_align.aspx"));
                samples.Add(PrepareSample("Height for Horizontal Lines", "results_horizontal_lines_height.aspx"));
                break;

            case "Validation":
                samples.Add(PrepareSample("Single Vote - Min Answers", "validation_single_minanswers.aspx"));
                samples.Add(PrepareSample("Multiple Votes - Min Answers", "validation_multiple_minanswers.aspx"));
                samples.Add(PrepareSample("Multiple Votes - Max Answers", "validation_multiple_maxanswers.aspx"));
                samples.Add(PrepareSample("Customize Error Message", "validation_message.aspx"));
                break;

            case "Security":
                samples.Add(PrepareSample("Security Method - Cookies", "security_cookies.aspx"));
                samples.Add(PrepareSample("Security Method - Session", "security_session.aspx"));
                samples.Add(PrepareSample("Security Method - Custom", "security_custom.aspx"));
                break;

            case "Templates":
                samples.Add(PrepareSample("Item Templates", "templates_items.aspx"));
                break;
        }

        
        StringBuilder samplesContent = new StringBuilder();
        samplesContent.Append("<div class=\"header\"><b>" + categoryName + "</b> - <span class=\"headerNumber\">" + mainCategories[categoryName].ToString() + "</span></div>");

        foreach (Dictionary<string, string> sample in samples)
        {
            if (sample["URL"] != "")
            {
                if (bool.Parse(sample["HasCsVb"]) == true || type == "aspnet_")
                {
                    samplesContent.Append("<div class=\"link\"><a href=\"" + type + sample["URL"] + "\">" + sample["Name"] + (bool.Parse(sample["IsNew"]) == true ? " <b class=\"new-sample\">New</b>" : "") + "</a></div>");
                    samplesContent.Append("<div class=\"link-file\">" + type + sample["URL"] + "</div>");
                    samplesContent.Append("<div class=\"link-clear\"></div>");
                }
            }
            else
            {
                samplesContent.Append("<div class=\"sub-header\">" + sample["Name"] + "</div>");
            }
        }

        return samplesContent.ToString();
    }

    protected Dictionary<string, string> PrepareSample(string name)
    {
        return PrepareSample(name, "", false, true);
    }

    protected Dictionary<string, string> PrepareSample(string name, string url)
    {
        return PrepareSample(name, url, false, true);
    }

    protected Dictionary<string, string> PrepareSample(string name, string url, bool isNew)
    {
        return PrepareSample(name, url, isNew, true);
    }

    protected Dictionary<string, string> PrepareSample(string name, string url, bool isNew, bool hasCsVb)
    {
        Dictionary<string, string> tempDict = new Dictionary<string, string>();

        tempDict.Add("Name", name);
        tempDict.Add("URL", url);
        tempDict.Add("IsNew", isNew.ToString());
        tempDict.Add("HasCsVb", hasCsVb.ToString());

        return tempDict;
    }

    protected void DisplayPathToExamples()
    {
        try
        {
            XmlTextReader oXMLReader = null;
            oXMLReader = new XmlTextReader(Server.MapPath("examples.xml"));
            while (oXMLReader.Read())
            {
                if (oXMLReader.NodeType == XmlNodeType.Element && oXMLReader.Name == "path")
                {
                    lblPath.Text = "<b>Path to folder with Poll examples: </b>" + oXMLReader.ReadString();
                }
            }
            oXMLReader.Close();
        }
        catch (Exception ex)
        {
            if (ex != null) { ex = null; }
        }

        if (Request.QueryString["type"] != null)
        {
            ExamplesType.Value = Request.QueryString["type"].ToString();
        }
    }
}