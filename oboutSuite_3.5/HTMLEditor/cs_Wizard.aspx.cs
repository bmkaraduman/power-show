using System;
using System.IO;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Obout.Ajax.UI.HTMLEditor;
using Obout.Ajax.UI.HTMLEditor.ToolbarButton;
using System.Collections.ObjectModel;
using System.Globalization;

public partial class HTMLEditor_cs_Wizard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            StreamReader input;
            input = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII);
            editor.Content = input.ReadToEnd();
            input.Close();
        }
        Label1.Visible = false;
    }

    public void OnActiveStepChanged(object sender, EventArgs e)
    {
        if (Wizard1.ActiveStepIndex == 1)
        {
            previewContent.Text = editor.Content;
        }
        else
            if (Wizard1.ActiveStepIndex == 2)
            {
                htmlLength.Text = editor.Content.Length.ToString();
                plainLength.Text = editor.PlainText.Length.ToString();
            }
    }

    public void OnFinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Label1.Text = "The wizard has been completed.";
        Label1.Visible = true;
    }
}